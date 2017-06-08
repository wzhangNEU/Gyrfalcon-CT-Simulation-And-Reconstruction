function [detectorData, attenuationCoords, attenuationDistances] = runPartialPixelBeamTraceFromPointSource(axesHandle,pointSourceCoords, sourceEndBoxCoords, detectorCornerCoords, phantomData, phantomDims, voxelDimsInM, phantomLocationInM, beamCharacterization, scatteringNoiseLevel, detectorNoiseLevel, partialPixelModelingResolution, displayDetectorRayTrace)
% [detectorData, attenuationCoords, attenuationDistances] = runPartialPixelBeamTraceFromPointSource(pointSourceCoords, sourceEndBoxCoords, detectorCornerCoords, phantomData, phantomDims, voxelDimsInM, phantomLocationInM, beamCharacterization, scatteringNoiseLevel, detectorNoiseLevel, partialPixelModelingResolution, displayDetectorRayTrace)
% for this beam trace, partial pixel modelling is used. This requires a
% resolution to be given (how many ray traces to run per detector), and
% then these will be averaged out to give the detector value

attenuationCoords = [];
attenuationDistances = [];

detectorDimensions = dimensionalityOfQuadrangle(detectorCornerCoords);

switch detectorDimensions
    case 0
        % for a point detector, we can't have a "resolution" for our
        % detector, so just run a ray trace from source to detector
        
        detectorPoint = centreOfQuadrangle(detectorCornerCoords);
        
        [rawDetectorValue, attenuationCoords, attenuationDistances] =...
            runRayTrace(...
            axesHandle,...
            pointSourceCoords,...
            sourceEndBoxCoords,...
            detectorPoint,...
            phantomData,...
            voxelDimsInM,...
            phantomLocationInM,...
            beamCharacterization,...
            displayDetectorRayTrace);
        
        averDetectorValue = rawDetectorValue; %no averaging required, only a single point
    case 1 %1D detector
        detectorValueSum = 0;
        
        for i=1:partialPixelModelingResolution
            detectorPoint = calcDetectorPoint(detectorCornerCoords, i, partialPixelModelingResolution);
            
            [rawSubDetectorValue,~,~] = runRayTrace(...
                axesHandle,...
                pointSourceCoords,...
                sourceEndBoxCoords,...
                detectorPoint,...
                phantomData,...
                voxelDimsInM,...
                phantomLocationInM,...
                beamCharacterization,...
                displayDetectorRayTrace);
            
            
            detectorValueSum = detectorValueSum + rawSubDetectorValue;
        end
        
        averDetectorValue = detectorValueSum ./ partialPixelModelingResolution;
    case 2 %2D detector
        detectorValueSum = 0;
        
        for i=1:partialPixelModelingResolution
            
            for j=1:partialPixelModelingResolution
                
                detectorPoint = calcDetectorPoint(detectorCornerCoords, [i,j], partialPixelModelingResolution);
                
%                 [rawSubDetectorValue,~,~] = runRayTrace(...
%                     axesHandle,...
%                     pointSourceCoords,...
%                     sourceEndBoxCoords,...
%                     detectorPoint,...
%                     phantomData,...
%                     voxelDimsInM,...
%                     phantomLocationInM,...
%                     beamCharacterization,...
%                     displayDetectorRayTrace);

                rawSubDetectorValue = fastRayTrace(pointSourceCoords, detectorPoint,...
                    phantomLocationInM, phantomDims, voxelDimsInM,...
                    phantomData, beamCharacterization);
                
                
                detectorValueSum = detectorValueSum + rawSubDetectorValue;
            end
        end
        
        averDetectorValue = detectorValueSum ./ (partialPixelModelingResolution .^ 2);
    otherwise
        error('Invalid detector dimensions');
end


% if detectorDimensions == 1 || detectorDimensions == 2
%    % need to get the absorption val distances and phantom coords for the partial pixel modelling
%    % as if the ray was going to the detector centre
%    detectorPoint = centreOfQuadrangle(detectorCornerCoords);
%    displayDetectorRayTrace = false;
%    
%    [~, attenuationCoords, attenuationDistances] =...
%        runRayTrace(...
%        axesHandle,...
%        pointSourceCoords,...
%        sourceEndBoxCoords,...
%        detectorPoint,...
%        phantomData,...
%        voxelDimsInM,...
%        phantomLocationInM,...
%        beamCharacterization,...
%        displayDetectorRayTrace);
% end

    
detectorData = applyNoise(averDetectorValue, scatteringNoiseLevel, detectorNoiseLevel); 


end



function valueWithNoise = applyNoise(detectorValue, scatteringNoiseLevel, detectorNoiseLevel)
    % TODO
    valueWithNoise = detectorValue;
end