function [] = simulationViewerLoadButtonCallback(app)
% [] = simulationViewerLoadButtonCallback(app)

filterSpec = '*.mat';
dialogTitle = 'Open Simulation Run...';
defaultName = app.settings.Simulation_And_Reconstruction_Run_Save_Path;

[fileName, pathName, ~] = uigetfile(filterSpec, dialogTitle, defaultName);

if ~all(fileName == 0) % have a selection
    openPath = [pathName, fileName];
    
    loadedData = load(openPath);
    
    if isfield(loadedData, Constants.Processing_Run_Var_Name)
        simulationRun = loadedData.(Constants.Processing_Run_Var_Name);
        
        if isa(simulationRun, class(SimulationRun)) % we're good!
            app.workspace.simulationRunForViewing = simulationRun;
            
            app = app.workspace.simulationRunForViewing.setGUIForScanSimulationViewer(app);
            
            resetScanSimulationViewerListBoxes(app);
        else
            errordlg('The selected file was not a Simulation Run file and so could not be opened.', 'Invalid File');
        end
    else
        errordlg('The selected file was not a Simulation Run file and so could not be opened.', 'Invalid File');
    end
else
    
end

end

