function [] = simulationObjectSaveButtonCallback(hObject, eventdata, handles, className)
% [] = simulationObjectSaveButtonCallback(hObject, eventdata, handles, className)

workspace = handles.workspace;

workspace = workspace.createFromGUI(handles);

if strcmp(className, 'Simulation')
    objectForGUI = workspace.simulation;
elseif strcmp(className, 'Phantom');
    objectForGUI = workspace.simulation.phantom;
elseif strcmp(className, 'Detector');
    objectForGUI = workspace.simulation.detector;
elseif strcmp(className, 'Source');
    objectForGUI = workspace.simulation.source;
elseif strcmp(className, 'Scan');
    objectForGUI = workspace.simulation.scan;
elseif strcmp(className, 'PhotonBeam');
    objectForGUI = workspace.simulation.scan.beamCharacterization;    
elseif strcmp(className, 'PhantomDataSet');
    objectForGUI = workspace.simulation.phantom.dataSet;
end

objectForGUI.saveInSeparateFile = true;

[saved,objectForGUI,~] = objectForGUI.saveAs();

if saved && ~isempty(objectForGUI)        
    if strcmp(className, 'Simulation')
        workspace.simulation = objectForGUI;
    elseif strcmp(className, 'Phantom');
        workspace.simulation.phantom = objectForGUI;
    elseif strcmp(className, 'Detector');
        workspace.simulation.detector = objectForGUI;
    elseif strcmp(className, 'Source');
        workspace.simulation.source = objectForGUI;
    elseif strcmp(className, 'Scan');
        workspace.simulation.scan = objectForGUI;
    elseif strcmp(className, 'PhotonBeam');
        workspace.simulation.scan.beamCharacterization = objectForGUI;
    elseif strcmp(className, 'PhantomDataSet');
        workspace.simulation.phantom.dataSet = objectForGUI;
    end
    
    % update handles
    
    handles = workspace.setGUI(handles);
    handles.workspace = workspace;
    
    guidata(hObject, handles);
end

end