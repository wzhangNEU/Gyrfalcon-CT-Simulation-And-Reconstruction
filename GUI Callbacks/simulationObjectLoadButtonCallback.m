function [] = simulationObjectLoadButtonCallback(hObject, eventdata, handles, className)
% [] = simulationObjectLoadButtonCallback(hObject, eventdata, handles, className)

if strcmp(className, 'Simulation')
    object = Simulation;
elseif strcmp(className, 'Phantom');
    object = Phantom;
elseif strcmp(className, 'Detector');
    object = Detector;
elseif strcmp(className, 'Source');
    object = Source;
elseif strcmp(className, 'Scan');
    object = Scan;
elseif strcmp(className, 'PhotonBeam');
    object = PhotonBeam;    
elseif strcmp(className, 'PhantomDataSet');
    object = PhantomDataSet;
end

object = object.load();

if ~isempty(object)
    object = object.loadFields();
    
    workspace = handles.workspace.createFromGUI(handles);
    
    if strcmp(className, 'Simulation')
        workspace.simulation = object;
    elseif strcmp(className, 'Phantom');
        workspace.simulation.phantom = object;
    elseif strcmp(className, 'Detector');
        workspace.simulation.detector = object;
    elseif strcmp(className, 'Source');
        workspace.simulation.source = object;
    elseif strcmp(className, 'Scan');
        workspace.simulation.scan = object;
    elseif strcmp(className, 'PhotonBeam');
        workspace.simulation.scan.beamCharacterization = object;
    elseif strcmp(className, 'PhantomDataSet');
        workspace.simulation.phantom.dataSet = object;
    end
    
    % update handles
    
    handles = workspace.setGUI(handles);
    handles.workspace = workspace;
    
    guidata(hObject, handles);
end

end