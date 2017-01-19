function rawDetectorValue = runRayTrace(pointSourceCoords, sourceEndBoxCoords, pointDetectorCoords, phantomData, voxelDimsInM, phantomLocationInM, beamCharacterization)
%function rawDetectorValue = runRayTrace(pointSourceCoords, sourceEndBoxCoords, pointDetectorCoords, phantomData, voxelDimsInM, phantomLocationInM, beamCharacterization)
% run a ray trave from the source point to detector point as long as the
% detector point is within the source end box.
% the beam described by the beam characterization passes through the
% phantom data, being attenuated as expected.

if pointIsWithinObject(pointDetectorCoords, sourceEndBoxCoords)
    % describe line in 3 space
    [deltas, point] = createLineEquation(pointSourceCoords, pointDetectorCoords);
    
    phantX = phantomLocationInM(1);
    
    phantDelX = voxelDimsInM(1);
    phantDelY = voxelDimsInM(2);
    phantDelZ = voxelDimsInM(3);
    
    phantDims = size(phantData);
    
    phantNumX = phantDims(2);
    phantNumY = phantDims(1);
    phantNumZ = phantDims(3);
    
    linePhantomIntersectionPoints = findLinePhantomIntersections(...
        deltas,...
        point,...
        pointSourceCoords,...
        phantomLocationInM,...
        voxelDimsInM,...
        phantomData);
        
    %these arrays will hold mu(x) values and x values
    %first values are those that will be traversed first by the beam
    dims = size(linePhantomIntersectionPoints);
    numIntersections = dims(1);
    
    if numIntersections <= 1 % no absorption
        rawDetectorValue = beamCharacterization.intensity;
    else
        absorptionVals = zeros(numIntersections-1,1);
        absorptionValsDistance = zeros(numIntersections-1,1);
        
        for i=1:numIntersections-1
            startPoint = linePhantomIntersectionPoints(i,:);
            endPoint = linePhantomIntersectionPoints(i+1,:);
            
            absorptionVals(i) = phantomAbsorptionVal(startPoint, endPoint,phantomData, voxelDimsInM, phantomLocationInM);
            absorptionValsDistance(i) = norm(endPoint-startPoint);
        end
        
        rawDetectorValue = beamCharacterization.modelAbsorption(absorptionVals, absorptionValsDistance);
    end
else
    rawDetectorValue = beamCharacterization.intensity;
end

end

