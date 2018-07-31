% **************************************
% Set Base Params
% **************************************
readPath = 'E:\Thesis Results\External Beam Trials.xls';
sheet = 'Stand. OSC-TV All Trials';

groupLabels = {...
    '\begin{tabular}{c}500MU\end{tabular}',...
    '\begin{tabular}{c}1500MU\end{tabular}',...
    '\begin{tabular}{c}2000MU\end{tabular}',...
    '\begin{tabular}{c}2500MU\end{tabular}'};

groupRows = {...
    3:4,...
    7:8,...
    11:12,...
    15:16};    

subgroupLabels = {...
    'Control',...
    'Catheter'};

subgroupColours = [...
    0.75 0.75 0.75;...
    0.25 0.25 0.25];

customColours = {...
    [],...
    [],...
    [],...
    []};

figDimsInCm = [7.4, 7.4];

subgroupLabelWriteIndex = 1;

% **************************************
% Mean
% **************************************

graphWritePath = 'E:\Thesis Figures\Results\Artifact Characterization\Dose Level Bar Graphs\Mean Comparison.png';

column = 28;

yAxisLabel = '$\bar{\Delta\mu}_{ROI}$ $[cm^-1]$';

title = '$\bar{\Delta\mu}_{ROI}$ for $\Delta\mu$ levels';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'above',...
    'above'};

subgroupLabelAngle = {...
    50,...
    50};

lineAtBar = [];
linePosAndNeg = true;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 


% **************************************
% Stdev
% **************************************

graphWritePath = 'E:\Thesis Figures\Results\Artifact Characterization\Dose Level Bar Graphs\Stdev Comparison.png';

column = 31;

yAxisLabel = '$\sigma_{ROI}$ $[cm^-1]$';

title = '$\sigma_{ROI}$ for $\Delta\mu$ levels';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'above',...
    'above'};

subgroupLabelAngle = {...
    50,...
    50};

lineAtBar = [];
linePosAndNeg = true;

subgroupLabels = {...
    };

subgroupLabelWriteIndex = Inf;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 

% **************************************
% Gradient Mean
% **************************************

graphWritePath = 'E:\Thesis Figures\Results\Artifact Characterization\Dose Level Bar Graphs\Gradient Comparison.png';

column = 34;

yAxisLabel = '$\bar{\nabla_{ROI}}$ $[cm^{-1} / mm]$';

title = '$\bar{\nabla_{ROI}}$ for $\Delta\mu$ levels';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'above',...
    'above'};

subgroupLabelAngle = {...
    50,...
    50};

lineAtBar = [];
linePosAndNeg = true;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 

% **************************************
% Delta Mean
% **************************************

groupRows = {...
    5,...
    9,...
    13,...
    17};    

subgroupLabels = {...
    };

subgroupColours = [...
    0.25 0.25 0.25];


graphWritePath = 'E:\Thesis Figures\Results\Artifact Characterization\Dose Level Bar Graphs\Delta Comparison.png';

column = 40;

yAxisLabel = '$\bar{\Delta_{ROI}}$ $[cm^{-1}]$';

title = '$\bar{\Delta_{ROI}}$ for $\Delta\mu$ levels';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'above',...
    'above'};

subgroupLabelAngle = {...
    50,...
    50};

lineAtBar = [];
linePosAndNeg = true;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 

