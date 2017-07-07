classdef ConeBeamFDKReconstruction < Reconstruction
    % ConeBeamFDKReconstruction
    
    properties
        displayName = 'FDK Algorithm'
        fullName = 'FDK Algorithm (CBCT)'
    end
    
    methods(Static)
        function handle = getSettingsTabHandle(app)
            handle = app.ConeBeamFDK_SettingsTab;
        end
    end
    
    methods
        function string = getNameString(recon)
            string = 'CBCT FDK';
        end
        
        function recon = createFromGUIForSubClass(recon, app)
            % no GUI fields yet
        end
        
        function app = setGUI(recon, app)
            % set visible tab
            hideAllAlgorithmSettingsTabs(app);
            
            tabHandle = recon.getSettingsTabHandle(app);
            tabHandle.Parent = app.ReconstructionAlgorithmSettingsTabGroup;
            
            % set settings
        end
    end
    
end

