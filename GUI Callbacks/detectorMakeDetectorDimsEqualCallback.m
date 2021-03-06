function [] = detectorMakeDetectorDimsEqualCallback(app, changeXY)
%[] = detectorMakeDetectorDimsEqualCallback(app, changeXY)


simulation = app.workspace.simulation.createFromGUI(app);

detector = simulation.detector;

dist = detector.getDistanceBetweenOriginAndDetectorCentrePointInM();

xyDim = detector.singleDetectorDimensions(1);
zDim = detector.singleDetectorDimensions(2);


if xyDim.units.isAngular() && zDim.units.isAngular()
    errorString = 'Cannot set square detector pixels for spherical detectors';
    dlgname = 'Detector Set Error';
    
    errordlg(errorString, dlgname);
else
    if changeXY
        setLength = zDim.getLengthInM(dist, Units.m);
        
        xyDim = xyDim.setValueFromLengthInM(setLength, dist, Units.m);
        
        app.DetectorPixelDimsXYEditField.Value = xyDim.value;
    else
        setLength = xyDim.getLengthInM(dist, Units.m);
        
        zDim = zDim.setValueFromLengthInM(setLength, dist, Units.m);
        
        app.DetectorPixelDimsZEditField.Value = zDim.value;
    end
end

end

