function [] = phantomDataSetLoadButtonCallback(hObject, eventdata, handles)
% [] = phantomDataSetLoadButtonCallback(hObject, eventdata, handles)
% callback function that loads up a phantom data set

question = 'What phantom data set would you like to use?';
title = 'Load Phantom Data Set';

createNew = 'Create New';
loadDataSet = 'Load Existing';
cancel = 'Cancel';

default = loadDataSet;

choice = questdlg(question, title, createNew, loadDataSet, cancel, default);

workspace = handles.workspace.createFromGUI(handles);

switch choice
    case createNew
        dataSet = createNewDataSet();
    case loadDataSet
        dataSet = PhantomDataSet;
        
        dataSet = dataSet.load();
    case cancel
        dataSet = [];
end

if ~isempty(dataSet)
    % update handles
    workspace.simulation.phantom.dataSet = dataSet;
    
    handles.workspace = workspace;
    
    handles = workspace.setGUI(handles);
    
    guidata(hObject, handles);
end

end

% HELPER FUNCTIONS

function dataSet = createNewDataSet()    
    title = 'Create Shepp-Logan Phantom Data Set';

    questions = {'Please enter the x/y dimension (will be square!):', 'Please enter the z dimension (will create round phantom):'};
    default = {'50','1'};
    numLines = 1;
    
    answers = inputdlg(questions, title, numLines, default);
    
    if isempty(answers) % pressed cancel
        dataSet = [];
    else
        xyDim = str2double(answers{1});
        zDim = str2double(answers{2});
        
        data = zeros(xyDim, xyDim, zDim);
        
        slice = phantom(xyDim); %use Matlab Shepp-Logan phantom
        
        for i=1:zDim
            data(:,:,i) = slice;
        end
        
        dataSet = PhantomDataSet(data);
        
        clearBeforeSave = false;
        
        [saved,dataSet] = dataSet.saveAs(clearBeforeSave);
        
        if ~saved
            dataSet = [];
        end
    end
    
end
