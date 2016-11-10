classdef Simulation
    % Simulation
    % This class contains all the data pertaining to an CT scan simulation
    % 
    % FIELDS:
    % *phantom:
    %  See Phantom class
    %
    % *detector: 
    %  See Detector class
    %
    % *source:
    %  See Source class
    %
    % *scan:
    %  See Scan class
    %
    % *scatteringNoiseLevel:
    % The level of noise modelled from Compton scattering
    % [0..1] (0 - no noise)
    %
    % *detectorNoiseLevel:
    % The level of noise modelled from electronic noise in the detectors
    % [0..1] (0 - no noise)
    %
    % *partialPixelModelling
    % Boolean field that if true, means that partial values of pixels will
    % be used in the attenuation modelling
    % T/F
    
    
    
    properties
        phantom
        detector
        source
        scan
        
        scatteringNoiseLevel
        detectorNoiseLevel
        partialPixelModelling
        
        savePath
        saveFileName
    end
    
    methods
        function simulation = Simulation(phantom, detector, source, scan, scatteringNoiseLevel, detectorNoiseLevel, partialPixelModelling)
            if nargin > 0
                % validate simulation parameters and fill in blanks if needed
                
                % phantom, detector, source, scan are all validated within
                % their classes
                
                % validate scatteringNoiseLevel
                if scatteringNoiseLevel < 0 || scatteringNoiseLevel > 1
                    error('Scattering Noise Level is not between 0 and 1')
                end
                
                % validate detectorNoiseLevel
                if detectorNoiseLevel < 0 || detectorNoiseLevel > 1
                    error('Detector Noise Level is not between 0 and 1')
                end
                
                % validate partialPixelModelling
                % no validation needed
                
                % if we get here, we're good to go, so lets assign the fields
                simulation.phantom = phantom;
                simulation.detector = detector;
                simulation.source = source;
                simulation.scan = scan;
                simulation.scatteringNoiseLevel = scatteringNoiseLevel;
                simulation.detectorNoiseLevel = detectorNoiseLevel;
                simulation.partialPixelModelling = partialPixelModelling;
            end
        end
        
        function [] = plot(simulation, handles)
            axesHandle = handles.axesHandle;
            
            axes(axesHandle);
            
            redrawAxes(handles);
            
            simulation.phantom.plot(axesHandle);
            simulation.detector.plot(axesHandle);
            simulation.source.plot(axesHandle);
            simulation.scan.plot(simulation.source, axesHandle);
                       
        end
        
        function handles = setGUIFromSimulation(simulation, handles)
            
            % PHANTOM
            
            handles = simulation.phantom.setGUI(handles);
            
            % DETECTOR
            
            handles = simulation.detector.setGUI(handles);
            
            % SOURCE
            
            handles = simulation.source.setGUI(handles);
            
            % SCAN
            
            handles = simulation.scan.setGUI(handles);
            
            % SIMULATION
            
            setDoubleForHandle(handles.simulationScatteringNoiseLevelEdit, simulation.scatteringNoiseLevel);
            setDoubleForHandle(handles.simulationDetectorNoiseLevelEdit, simulation.detectorNoiseLevel);
            set(handles.simulationPartialPixelModellingCheckbox, 'Value', simulation.partialPixelModelling);
                       
            % set hidden handles
            handles.simulationSavePath = simulation.savePath;
            handles.simulationSaveFileName = simulation.saveFileName;
        end
        
        function simulation = createFromGUI(simulation, handles)
            % PHANTOM
            
            phant = Phantom();
            
            simulation.phantom = phant.createFromGUI(handles);
            
            % DETECTOR
            
            detector = Detector();
            
            simulation.detector = detector.createFromGUI(handles);
            
            % SOURCE
            
            source = Source();
            
            simulation.source = source.createFromGUI(handles);
            
            % SCAN
            
            scan = Scan();
            
            simulation.scan = scan.createFromGUI(handles);
            
            % SIMULATION
            
            simulation.scatteringNoiseLevel = getDoubleFromHandle(handles.simulationScatteringNoiseLevelEdit);
            simulation.detectorNoiseLevel = getDoubleFromHandle(handles.simulationDetectorNoiseLevelEdit);
            simulation.partialPixelModelling = get(handles.simulationPartialPixelModellingCheckbox, 'Value');
            
            
            simulation.savePath = handles.simulationSavePath;
            simulation.saveFileName = handles.simulationSaveFileName;
        end
        
        function data = runScanSimulation(simulation)
            slices = simulation.scan.getSlicesInM();
            
            numSlices = length(slices);
            
            data = cell(numSlices, 1);
            
            for i=1:numSlices
                slicePosition = slices(i);
                
                sliceData = simulation.runScanSimulationForSlice(slicePosition);
                
                data{i} = sliceData;
            end            
        end
        
        function sliceData = runScanSimulationForSlice(simulation, slicePosition)
            angles = simulation.scan.getScanAnglesInDegrees();
            
            numAngles = length(angles);
            
            sliceData = cell(numAngles, 1);
            
            for i=1:numAngles
                angle = angles(i);
                
                angleData = simulation.runScanSimulationForAngle(slicePosition, angle);
                
                sliceData{i} = angleData;
            end
        end
        
        function angleData = runScanSimulationForAngle(simulation, slicePosition, angle)
            perAngleTranslationDimensions = simulation.scan.perAngleTranslationDimensions;
            
            xyNumSteps = perAngleTranslationDimensions(1);
            zNumSteps = perAngleTranslationDimensions(2);
            
            angleData = cell(zNumSteps, xyNumSteps);
            
            for zStep=1:zNumSteps
                for xyStep=1:xyNumSteps
                    [perAngleXYInM, perAngleZInM] = simulation.scan.getPerAnglePositionInM(xyStep, zStep);
                    
                    positionData = simulation.runScanSimulationForPerAnglePosition(slicePosition, angle, perAngleXYInM, perAngleZInM);
                    
                    angleData{zStep, xyStep} = positionData;
                end
            end
        end
        
        function positionData = runScanSimulationForPerAnglePosition(slicePosition, angle, perAngleXY, perAngleZ)
            [sourcePosition, directionUnitVector] = simulation.source.getSourcePosition(slicePosition, angle, perAngleXY, perAngleZ);
            
            detectorPosition = simulation.detector.getDetectorPosition(slicePosition, angle);
            
            xyNumDetectors = simulation.detector.wholeDetectorDimensions(1);
            zNumDetectors = simulation.detector.wholeDetectorDimensions(2);
            
            positionData = zeros(zNumDetectors, xyNumDetectors);
            
            for zDetector=1:zNumDetectors
                for xyDetector=1:xyNumDetectors
                    [clockwisePosZ,...
                     clockwiseNegZ,...
                     counterClockwisePosZ,...
                     counterClockwiseNegZ]...
                     = simulation.detector.getDetectorCoords(detectorPosition, xyDetector, zDetector);
                    
                    positionData(zDetector, xyDetector) = detectorData;
                end
            end
                
        end
        
    end
    
end

