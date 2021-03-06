function [] = phantomDataSetNewButtonCallback(app)
% [] = phantomDataSetNewButtonCallback(app)
% callback function that creates a new phantom data set

dataSet = createNewDataSet(app);
  
if ~isempty(dataSet)
    % update handles
    app.workspace.simulation.phantom.dataSet = dataSet;
        
    app.workspace.setGUI(app);
end

end

% HELPER FUNCTIONS

function dataSet = createNewDataSet(app)    
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
        
        if zDim == 1
            data = phantomInHU('Modified Shepp-Logan', xyDim, xyDim);
        else
            radius = zDim/2;
            
            data = zeros(xyDim,xyDim,zDim);
            
            for i=1:zDim %through slices
                height = abs(radius-i);
                
                radiusForSlice = sqrt(radius^2 - height^2);
                
                dimForSlice = round(radiusForSlice/radius * xyDim);
                
                sliceData = phantomInHU('Modified Shepp-Logan',dimForSlice,xyDim);
                
                data(...
                    :,...
                    :,...
                    i) = sliceData ;
                
            end
        end
        
        dataSet = PhantomDataSet(data);
        
        dataSet.saveInSeparateFile = true;
        
        [saved,dataSet,~,~] = dataSet.saveAs(app.settings.Simulation_Save_Path);
        
        if ~saved
            dataSet.saveInSeparateFile = false;
        end
    end
    
end
