classdef ConeBeamOS_ASD_POCSReconstruction < Reconstruction
    % ConeBeamOS_ASD_POCSReconstruction
    
    properties
        displayName = 'OS-ASD-POCS Algorithm [TIGRE]'
        fullName = 'OS-ASD-POCS Algorithm (CBCT)'
                
        % reconstruction settings (for TIGRE)
        numberOfIterations = 10
        forwardProjectionAccuracy = 0.25
        
        % specific for OS-SART
        initialBlockSize = 26
        finalBlockSize = 2
        blockSizeReductionPower = 1/2
        
        lambda = 1
        lambdaReduction = 1
        orderStrategy = TigreOrderStrategies.angularDistance
        verbosity = true
        
        numberOfTvIterations = 20
        maxL2ErrorRatio = 0.2
        updateRatio = 0.95
        alpha = 0.25
        alphaReduction = 1
    end
        
    methods(Static)
        function handle = getSettingsTabHandle(app)
            handle = app.ConeBeamOSASDPOCSSettingsTab;
        end
    end
    
    methods
        function string = getNameString(recon)
            string = 'CBCT OS-ASD-POCS';
        end     
        
        function recon = createFromGUIForSubClass(recon, app)            
            recon.numberOfIterations = app.CBCT_OSASDPOCS_NumberOfIterationsEditField.Value;
            recon.forwardProjectionAccuracy = app.CBCT_OSASDPOCS_ForwardProjectionAccuracyEditField.Value;
            
            recon.initialBlockSize = app.CBCT_OSASDPOCS_InitialBlockSizeEditField.Value;
            recon.finalBlockSize = app.CBCT_OSASDPOCS_FinalBlockSizeEditField.Value;
            recon.blockSizeReductionPower = app.CBCT_OSASDPOCS_BlockSizeReductionPowerEditField.Value;
            
            recon.lambda = app.CBCT_OSASDPOCS_LambdaEditField.Value;
            recon.lambdaReduction = app.CBCT_OSASDPOCS_LambdaReductionEditField.Value;
            recon.orderStrategy = app.CBCT_OSASDPOCS_OrderStrategyDropDown.Value;
            recon.verbosity = app.CBCT_OSASDPOCS_VerboseCheckBox.Value;
            
            recon.numberOfTvIterations = app.CBCT_OSASDPOCS_NumberOfTvIterationsEditField.Value;
            recon.maxL2ErrorRatio = app.CBCT_OSASDPOCS_MaxL2ErrorRatioEditField.Value;
            recon.updateRatio = app.CBCT_OSASDPOCS_UpdateRatioEditField.Value;
            recon.alpha = app.CBCT_OSASDPOCS_AlphaEditField.Value;
            recon.alphaReduction = app.CBCT_OSASDPOCS_AlphaReductionEditField.Value;
        end
        
        function app = setGUI(recon, app)
            % set visible tab
            hideAllAlgorithmSettingsTabs(app);
            
            tabHandle = recon.getSettingsTabHandle(app);
            tabHandle.Parent = app.ReconstructionAlgorithmSettingsTabGroup;
            
            % set drop-down options
            setDropDownOptions(...
                app.CBCT_OSASDPOCS_OrderStrategyDropDown,...
                enumeration('TigreOrderStrategies'),...
                'displayString');
            
            % set settings  
            app.CBCT_OSASDPOCS_RayRejectionCheckBox.Value = recon.useRayRejection;
            
            app.CBCT_OSASDPOCS_NumberOfIterationsEditField.Value = recon.numberOfIterations;
            app.CBCT_OSASDPOCS_ForwardProjectionAccuracyEditField.Value = recon.forwardProjectionAccuracy;
            
            app.CBCT_OSASDPOCS_InitialBlockSizeEditField.Value = recon.initialBlockSize;
            app.CBCT_OSASDPOCS_FinalBlockSizeEditField.Value = recon.finalBlockSize;
            app.CBCT_OSASDPOCS_BlockSizeReductionPowerEditField.Value = recon.blockSizeReductionPower;
            
            app.CBCT_OSASDPOCS_LambdaEditField.Value = recon.lambda;
            app.CBCT_OSASDPOCS_LambdaReductionEditField.Value = recon.lambdaReduction;
            app.CBCT_OSASDPOCS_OrderStrategyDropDown.Value = recon.orderStrategy;
            app.CBCT_OSASDPOCS_VerboseCheckBox.Value = recon.verbosity;
            
            app.CBCT_OSASDPOCS_NumberOfTvIterationsEditField.Value = recon.numberOfTvIterations;
            app.CBCT_OSASDPOCS_MaxL2ErrorRatioEditField.Value = recon.maxL2ErrorRatio;
            app.CBCT_OSASDPOCS_UpdateRatioEditField.Value = recon.updateRatio;
            app.CBCT_OSASDPOCS_AlphaEditField.Value = recon.alpha;
            app.CBCT_OSASDPOCS_AlphaReductionEditField.Value = recon.alphaReduction;
        end
                
        function recon = runReconstruction(recon, reconRun, simulationOrImagingScanRun, app, projectionData, rayRejectionMaps)
            % get everything converted for TIGRE
            [projectionData, rayRejectionMaps, tigreGeometry, tigreAnglesInRadians] = ...
                getValuesForTigreReconstruction(recon, simulationOrImagingScanRun, projectionData, rayRejectionMaps);
               
            % run reconstruction
            if recon.useRayRejection
                
                reconDataSet = OS_ASD_POCS_withRayRejection(projectionData, rayRejectionMaps, tigreGeometry, tigreAnglesInRadians,...
                    recon.numberOfIterations,...
                    'BlockSize', recon.blockSize,...
                    'lambda', recon.lambda,...
                    'lambda_red', recon.lambdaReduction,...
                    'Verbose', recon.verbosity,...
                    'OrderStrategy', recon.orderStrategy.tigreString,...
                    'TViter', recon.numberOfTvIterations,...
                    'alpha', recon.alpha,...
                    'alpha_red', recon.alphaReduction,...
                    'maxL2err', im3Dnorm(FDK(projectionData, tigreGeometry, tigreAnglesInRadians),'L2')*recon.maxL2ErrorRatio,...
                    'Ratio', recon.updateRatio);
            else
                reconDataSet = OSC_TV2(...
                    app,...
                    projectionData, rayRejectionMaps, tigreGeometry, tigreAnglesInRadians,...
                    recon.numberOfIterations,...
                    'initialBlockSize', recon.initialBlockSize,...
                    'finalBlockSize', recon.finalBlockSize,...
                    'blockSizeReductionPower', recon.blockSizeReductionPower,...
                    'lambda', recon.lambda,...
                    'lambda_red', recon.lambdaReduction,...
                    'Verbose', recon.verbosity,...
                    'OrderStrategy', recon.orderStrategy.tigreString,...
                    'TViter', recon.numberOfTvIterations,...
                    'alpha', recon.alpha,...
                    'alpha_red', recon.alphaReduction,...
                    'maxL2err', im3Dnorm(FDK(projectionData, tigreGeometry, tigreAnglesInRadians),'L2')*recon.maxL2ErrorRatio,...
                    'Ratio', recon.updateRatio);
            end
            
            % convert data set to Gyrfalcon units
            reconDataSet = convertReconDataSetFromTigreToGyrfalcon(reconDataSet);
            
            % set to the Reconstruction object
            recon.reconDataSetSlices = {reconDataSet};
        end
        
        function [] = saveOutputSubclass(recon, savePath)
            % nothing special to do here 
        end
    end
    
end
