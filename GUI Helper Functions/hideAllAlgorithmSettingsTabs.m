function app = hideAllAlgorithmSettingsTabs(app)
%app = hideAllAlgorithmSettingsTabs(app)

tabHandles = {...
    app.Gen1FBP_SettingsTab,...
    app.Gen1PAIR_SettingsTab,...
    app.ConeBeamFDK_SettingsTab,...
    app.ConeBeamPAIR_SettingsTab
    };

for i=1:length(tabHandles)
    tabHandles{i}.Parent = [];
end

end

