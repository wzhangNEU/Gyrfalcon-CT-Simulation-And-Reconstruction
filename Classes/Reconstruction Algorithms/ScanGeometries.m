classdef ScanGeometries
    % ScanGeometries
    % contains the types of scan geometries for which reconstructions can
    % be performed
    
    properties
        displayString
        shortDescriptionString
        longDescriptionString
    end
    
    enumeration
        firstGenCT (...
            '1st Generation CT',...
            'Parallel Pencil-Beam Configuration (Rotate/Translation)',...
            'At each angle, a 1D projection image is created by sending a pencil beam perpendicular to the detector. After each pencil-beam, the source is shifted parallel to the detector, and the next piece of the projection found. At each angle, the image is then formed by a set of parallel pencil beams. The detector can either be defined as a moving point detecotr, or a 2D linear detector'...
            )
        
        secondGenCT (...
            '2nd Generation CT',...
            'Parallel Narrow Fan-Beam Configuration (Rotate/Translation)',...
            'At each angle, a 1D projection image is created by sending a narrow fan beam to a multi-pixel linear detector, and translating the source parallel to the detector. The detector must be defined as a detector that moves with the source.'...
            )
        
        thirdGenCT (...
            '3rd Generation CT',...
            'Wide Fan-Beam Configuration with Moving Detector (Rotate/Rotate)',...
            'At each angle, a 1D projection image is created in one step by using a wide fan beam to hit a planar or curved detector. The detector must be defined to move with the scan angle'...
            )
        
        fourthGenCT (...
            '4th Generation CT',...
            'Wide Fan-Beam Configuration with Fixed Detector (Rotate/Stationary)',...
            'At each angle, a 1D projection image is created in one step by using a wide fan beam to hit a stationary detector that is curved completely around the phantom. The detector must be defined to not move with the scan angle'...
            )
        
        coneBeamCT (...
            'Cone Beam CT',...
            'Cone Beam CT (CBCT) with Moving Detector (Rotate/Rotate)',...
            'At each angle, a 2D projection image is created in one step by using a cone beam and planar 2D detector that moves with the scan angle.'...
            )
            
    end
    
    methods
        function obj = ScanGeometries(displayString, shortDescriptionString, longDescriptionString)
            obj.displayString = displayString;
            obj.shortDescriptionString = shortDescriptionString;
            obj.longDescriptionString = longDescriptionString;
        end
        
        function [algorithmChoiceStrings, choices] = getReconAlgorithmChoices(geometry)
            switch geometry
                case ScanGeometries.firstGenCT
                    choices = {...
                        FirstGenFilteredBackprojectionReconstruction,...
                        FirstGenPAIRReconstruction...
                        };
                case ScanGeometries.secondGenCT
                    choices = {...
                        SecondGenFilteredBackprojectionReconstruction...
                        };
                case ScanGeometries.thirdGenCT
                    choices = {...
                        ThirdGenFilteredBackprojectionReconstruction...
                        };                    
                case ScanGeometries.fourthGenCT                    
                    choices = {...
                        FourthGenFilteredBackprojectionReconstruction...
                        };                    
                case ScanGeometries.coneBeamCT                    
                    choices = {...
                        ConeBeamFDKReconstruction,...
                        ConeBeamPAIRReconstruction,...
                        ConeBeamSIRTReconstruction,...
                        ConeBeamSARTReconstruction,...
                        ConeBeamSART_TVReconstruction,...
                        ConeBeamOS_SARTReconstruction,...
                        ConeBeamOS_ASD_POCSReconstruction,...
                        ConeBeamMLEMReconstruction,...
                        ConeBeamCGLSReconstruction...
                        };
            end
            
            numChoices = length(choices);
            
            algorithmChoiceStrings = cell(1,numChoices);
            
            for i=1:numChoices
                algorithmChoiceStrings{i} = choices{i}.displayName;
            end
        end
        
        function choice = getDefaultAlgorithmChoice(geometry)
            switch geometry
                case ScanGeometries.firstGenCT
                    choice = FirstGenFilteredBackprojectionReconstruction;
                case ScanGeometries.secondGenCT
                    choice = SecondGenFilteredBackprojectionReconstruction;
                case ScanGeometries.thirdGenCT
                    choice = ThirdGenFilteredBackprojectionReconstruction;
                case ScanGeometries.fourthGenCT
                    choice = FourthGenFilteredBackprojectionReconstruction;
                case ScanGeometries.coneBeamCT
                    choice = ConeBeamFDKReconstruction;
            end
        end
        
        function [projectionData, rayRejectionMaps] = compileAndInterpolateProjectionData(geometry, simulationOrImagingScanRun, reconstruction)
            switch geometry
                case ScanGeometries.coneBeamCT
                    angles = simulationOrImagingScanRun.getImagingSetup().scan.getScanAnglesInDegrees();
                    numAngles = length(angles);
                    
                    targetDetectorDims = reconstruction.processingWholeDetectorDimensions;
                    
                    projectionData = zeros(targetDetectorDims(2), targetDetectorDims(1), numAngles);
                    rayRejectionMaps = false & zeros(targetDetectorDims(2), targetDetectorDims(1), numAngles);
                                        
                    origSingleDetectorDimensionsInM = simulationOrImagingScanRun.getImagingSetup().detector.getSingleDetectorDimensionsInM();
                    
                    targetSingleDetectorDimensionsInM = reconstruction.getSingleDetectorDimensionsInM();
                    
                    useRayRejection = reconstruction.useRayRejection;
                                        
                   p = parpool();
                    
                   parfor i=1:numAngles
                        [detectorData, rayRejectionMap] = loadProjectionAndRayExclusionMapDataFiles(...
                            simulationOrImagingScanRun, 1, angles(i), 1, 1);
                        
                        % convert projection data to cleaned-up Radon transform data
                        detectorData = correctProjectionData(detectorData);
                        detectorData = simulationOrImagingScanRun.getImagingSetup().convertProjectionDataToRadonSumData(detectorData);
                        detectorData = correctRadonSumData(detectorData);
                        
                        [projectionData(:,:,i), rayRejectionMaps(:,:,i)] = interpolateProjectionDataForReconstruction(...
                            detectorData,...
                            rayRejectionMap,...
                            useRayRejection,...
                            origSingleDetectorDimensionsInM,...
                            targetDetectorDims, targetSingleDetectorDimensionsInM);
                    end
                    
                   delete(p);
                otherwise
                    error('Invalid Scan Geometry');
            end
                
        end
        
        function [projectionData, rayRejectionMaps] = compileProjectionData(geometry, simulationOrImagingScanRun, reconstruction)
            switch geometry
                case ScanGeometries.coneBeamCT
                    angles = simulationOrImagingScanRun.getImagingSetup().scan.getScanAnglesInDegrees();
                    numAngles = length(angles);
                    
                    targetDetectorDims = reconstruction.processingWholeDetectorDimensions;
                    
                    projectionData = zeros(targetDetectorDims(2), targetDetectorDims(1), numAngles);
                    rayRejectionMaps = false & zeros(targetDetectorDims(2), targetDetectorDims(1), numAngles);
                                        
                    for i=1:numAngles
                        [detectorData, rayRejectionMap] = loadProjectionAndRayExclusionMapDataFiles(...
                            simulationOrImagingScanRun, 1, angles(i), 1, 1);
                        
                        % crop down data as needed
                        dataDims = fliplr(size(detectorData)); % fliplr so in [xy,z] format
                        
                        starts = ( (dataDims - targetDetectorDims) ./ 2) + 1;
                        ends = starts + targetDetectorDims - 1;
                        
                        detectorData = detectorData(starts(2):ends(2), starts(1):ends(1));
                        rayRejectionMap = rayRejectionMap(starts(2):ends(2), starts(1):ends(1));
                        
                        % convert projection data to cleaned-up Radon transform data
                        detectorData = correctProjectionData(detectorData);
                        detectorData = simulationOrImagingScanRun.getImagingSetup().convertProjectionDataToRadonSumData(detectorData);
                        detectorData = correctRadonSumData(detectorData);
                        
                        projectionData(:,:,i) = detectorData;
                        rayRejectionMaps(:,:,i) = rayRejectionMap;
                    end
                otherwise
                    error('Invalid Scan Geometry');
            end
                
        end
    end
    
end

