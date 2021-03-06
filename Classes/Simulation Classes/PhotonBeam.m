classdef PhotonBeam < GyrfalconObject
    % PhotonBeam
    % This class contains all the data pertaining to a beam of photons
    % 
    % FIELDS:
    % *energies:
    % the energies of photons in the beam, measured in MeV (electron volts)
    %
    % *intensities:
    % the intensities of the photons at the energies, measured in W/m^2
    %
    % *waterLinearAttenutationCoefficients:
    % the linear attneuation coefficients for the energies for the photon
    % beams. Values to stored to reduce computation time when converting
    % from Houndsfield units
    %
    % *airLinearAttenutationCoefficients:
    % the linear attneuation coefficients for the energies for the photon
    % beams. Values to stored to reduce computation time when converting
    % from Houndsfield units
    %
    % *calibratedPhantomDataSet
    % 
    
    properties
        energies
        intensities
        
        waterLinearAttenuationCoefficients
        airLinearAttenuationCoefficients
        
        calibratedPhantomDataSet
    end
    
    methods
        function beam = PhotonBeam(energies, intensities)
            if nargin > 0
                beam.energies = energies;
                beam.intensities = intensities;
                
                numEnergies = length(energies);
                
                waterCoeffs = zeros(numEnergies,1);
                airCoeffs = zeros(numEnergies,1);
                
                for i=1:numEnergies
                    [waterCoeff, airCoeff] = getWaterAndAirLinearAttenuationCoefficientsForPhotonEnergy(energies(i));
                    
                    waterCoeffs(i) = waterCoeff;
                    airCoeffs(i) = airCoeff;
                end
                
                beam.waterLinearAttenuationCoefficients = waterCoeffs;
                beam.airLinearAttenuationCoefficients = airCoeffs;
            end
        end
        
        function photonBeam = createBlankObject(photonBeam)
            photonBeam = PhotonBeam;
        end
                
        function name = displayName(photonBeam)
            name = 'Photon Beam';
        end
        
        function photonBeam = setDefaultValues(photonBeam)
            photonBeam.energies = [];
            photonBeam.intensities = [];
            
            photonBeam.waterLinearAttenuationCoefficients = [];
            photonBeam.airLinearAttenuationCoefficients = [];
            
            photonBeam.calibratedPhantomDataSet = {};
        end
        
        function [saved, beamForGUI, beamForParent, beamForSaving] = saveChildrenObjects(beam, defaultSavePath)
            beamForGUI = beam;
            beamForParent = beam;
            beamForSaving = beam;
            
            saved = true;
        end
        
        function photonBeam = loadFields(photonBeam, defaultLoadPath)
            %calibratedPhantomDataSet will be calculated as needed
        end 
        
        
        function name = defaultName(photonBeam)
            minEnergy = min(photonBeam.energies);
            maxEnergy = max(photonBeam.energies);
            
            minIntensity = min(photonBeam.intensities);
            maxIntensity = max(photonBeam.intensities);
            
            if minEnergy == maxEnergy
                energyString = [num2str(minEnergy), ' MeV'];
            else
                energyString = [num2str(minEnergy), '-', num2str(maxEnergy), ' MeV'];
            end
            
            if minIntensity == maxIntensity
                intensityString = [num2str(minIntensity), ' Wm-2'];
            else
                intensityString = [num2str(minIntensity), '-', num2str(maxIntensity), ' Wm-2'];
            end
            
            fileName = [Constants.Default_Photon_Beam_Name, ' (', energyString, ', ', intensityString, ')'];
            
            name = [fileName, Constants.Matlab_File_Extension];            
        end
        
        function bool = equal(beam1, beam2)
            b1 = matricesEqual(beam1.energies, beam2.energies);
            b2 = matricesEqual(beam1.intensities, beam2.intensities);
            b3 = matricesEqual(beam1.waterLinearAttenuationCoefficients, beam2.waterLinearAttenuationCoefficients);
            b4 = matricesEqual(beam1.airLinearAttenuationCoefficients, beam2.airLinearAttenuationCoefficients);
            
            b5 = true;
            
            numBeam1 = length(beam1.calibratedPhantomDataSet);
            numBeam2 = length(beam2.calibratedPhantomDataSet);
            
            if numBeam1 == numBeam2
                for i=1:numBeam1
                    b5 = b5 && matricesEqual(beam1.calibratedPhantomDataSet{i}, beam2.calibratedPhantomDatSet{i});
                end
            else
                b5 = false;
            end
            
            bool = b1 && b2 && b3 && b4 && b5;
        end
                
        function photonBeam = calibrateAndSetPhantomData(photonBeam, phantomDataInHU)
            energies = photonBeam.energies;
            
            numEnergies = length(energies);
            
            calibratedPhantomDataSet = cell(numEnergies,1);
            
            for i=1:numEnergies
                waterCoeff = photonBeam.waterLinearAttenuationCoefficients(i);
                airCoeff = photonBeam.airLinearAttenuationCoefficients(i);
                
                calibratedPhantomDataSet{i} = convertFromHoundsfieldToLinearAttenuation(phantomDataInHU, airCoeff, waterCoeff);
            end
            
            photonBeam.calibratedPhantomDataSet = calibratedPhantomDataSet;
        end
        
        function [finalIntensity, attenuationCoords] = modelAbsorption(photonBeam, coords, absorptionValsDistance)
            finalIntensity = 0;
            
            xCoords = coords(:,1);
            yCoords = coords(:,2);
            zCoords = coords(:,3);
            
            attenuationCoords = sub2ind(size(photonBeam.calibratedPhantomDataSet{1}),xCoords,yCoords,zCoords);
                        
            for i=1:length(photonBeam.energies)
               intensity = photonBeam.intensities(i);
                    
               % STEP 1
               % get phantom data from in linear attentuation units
               
               phantomDataInAttenuation = photonBeam.calibratedPhantomDataSet{i};
               
               % get relevant values
               attenuationValues = phantomDataInAttenuation(attenuationCoords);
                                             
               % STEP 2
               % sum over all voxels tranversed (including weighting)
               
               absorptionSum = sum(attenuationValues .* absorptionValsDistance);
               
               % STEP 3
               % apply Lambert-Beer's Law
               
               finalIntensity = finalIntensity + (intensity .* exp(-absorptionSum));
               
            end
        end
        
        
        
        function intensity = rawIntensity(photonBeam)
            intensity = 0;
            
            for i=1:length(photonBeam.intensities)
                intensity = intensity + photonBeam.intensities(i);
            end
        end
        
        function app = setGUI(photonBeam, app)            
            app.BeamCharacterizationSaveInSeparateFileCheckBox.Value = photonBeam.saveInSeparateFile;
        
            if ~photonBeam.saveInSeparateFile
                app.BeamCharacterizationFilePathLabel.Text = 'Tied to Scan';
            elseif isempty(photonBeam.saveFileName)
                app.BeamCharacterizationFilePathLabel.Text = 'None Selected';
            else                
                app.BeamCharacterizationFilePathLabel.Text = photonBeam.saveFileName;
            end
        end
        
        function photonBeam = createFromGUI(photonBeam, app)
            photonBeam.saveInSeparateFile = app.BeamCharacterizationSaveInSeparateFileCheckBox.Value;
        end
    end
    
end

