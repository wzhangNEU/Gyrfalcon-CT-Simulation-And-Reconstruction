% **************************************
% Set Base Params
% **************************************
readPath = 'E:\Thesis Results\External Beam Trials.xls';
sheet = 'Stand. OSC-TV Param. Opt. ANLYS';

groupLabels = {...
    'FDK',...
    '\begin{tabular}{c}OSC-TV$_{FF}$\\S=[26..2]\end{tabular}',...
    '\begin{tabular}{c}OSC-TV$_{FF}$\\S=[51..3]\end{tabular}',...
    '\begin{tabular}{c}OSC-TV$_{FF}$\\S=[103..6]\end{tabular}',...
    '\begin{tabular}{c}OSC-TV$_{FF}$\\S=[205..13]\end{tabular}',...
    '\begin{tabular}{c}OSC-TV$_{FF}$\\S=[205..41]\end{tabular}'};

groupRows = {...
    4:4,...
    81:85,...
    86:90,...
    91:95,...
    96:100,...
    101:105};

subgroupLabels = {...
    'c=0.001',...
    'c=0.005',...
    'c=0.01',...
    'c=0.05',...
    'c=0.1'};

subgroupColours = [...
    0.8 0.8 0.8;...
    0.65 0.65 0.65;...
    0.50 0.50 0.50;...
    0.35 0.35 0.35;...
    0.20 0.20 0.20];

customColours = {...
    [0.05 0.05, 0.05],...
    [], [], [], [], []};

figDimsInCm = [10, 15];

subgroupLabelWriteIndex = 2;

% **************************************
% Mean
% **************************************

graphWritePath = 'E:\Thesis Results\Standard OSC-TV FF Bar Graphs\Mean Comparison (15 Iterations).png';

column = 28;

yAxisLabel = 'Change in $\bar{\mu}_{ROI}$ from control $[cm^-1]$';

title = 'Comparison of $\bar{\mu}_{ROI}$ for tested OSC-TV parameters';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'above',...
    'above',...
    'above',...
    'above',...
    'above'};

subgroupLabelAngle = {...
    45,...
    45,...
    45,...
    45,...
    45};

lineAtBar = [1,1];
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

graphWritePath = 'E:\Thesis Results\Standard OSC-TV FF Bar Graphs\Stdev Comparison (15 Iterations).png';

column = 31;

yAxisLabel = 'Change in $\sigma_{ROI}$ from control $[cm^-1]$';

title = 'Comparison of $\sigma_{ROI}$ for tested OSC-TV parameters';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'above',...
    'above',...
    'above',...
    'above',...
    'above'};

subgroupLabelAngle = {...
    15,...
    45,...
    45,...
    80,...
    45};

lineAtBar = [1,1];
linePosAndNeg = false;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 

% **************************************
% Gradient Mean
% **************************************

graphWritePath = 'E:\Thesis Results\Standard OSC-TV FF Bar Graphs\Gradient Comparison (15 Iterations).png';

column = 34;

yAxisLabel = 'Change in $\nabla_{ROI}$ from control  $[cm^-1]$';

title = 'Comparison of $\nabla_{ROI}$ for tested OSC-TV parameters $[unitless]$';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'below',...
    'below',...
    'below',...
    'below',...
    'below'};

subgroupLabelAngle = {...
    40,...
    40,...
    40,...
    40,...
    40};

lineAtBar = [1,1];
linePosAndNeg = false;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 

% **************************************
% Delta Mean
% **************************************

graphWritePath = 'E:\Thesis Results\Standard OSC-TV FF Bar Graphs\Delta Mean Comparison (15 Iterations).png';

column = 40;

yAxisLabel = 'Change in $\Delta_{ROI}$ from control  $[cm^-1]$';

title = 'Comparison of $\Delta_{ROI}$ for tested OSC-TV parameters $[unitless]$';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'above',...
    'above',...
    'above',...
    'above',...
    'above'};

subgroupLabelAngle = {...
    20,...
    80,...
    80,...
    80,...
    80};

lineAtBar = [1,1];
linePosAndNeg = false;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 

% **************************************
% Delta Stdev
% **************************************

graphWritePath = 'E:\Thesis Results\Standard OSC-TV FF Bar Graphs\Delta Stdev Comparison (15 Iterations).png';

column = 43;

yAxisLabel = 'Change in $\Delta_{ROI}$ from control  $[cm^-1]$';

title = 'Comparison of $\Delta_{ROI}$ for tested OSC-TV parameters $[unitless]$';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'above',...
    'above',...
    'above',...
    'above',...
    'above'};

subgroupLabelAngle = {...
    20,...
    45,...
    45,...
    45,...
    45};

lineAtBar = [1,1];
linePosAndNeg = false;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 


% **************************************
% D1
% **************************************

graphWritePath = 'E:\Thesis Results\Standard OSC-TV FF Bar Graphs\d1 Comparison (15 Iterations).png';

column = 46;

yAxisLabel = 'Change in $d_{1}$ from control $[mm]$';

title = 'Comparison of $d_{1}$ for tested OSC-TV parameters';

f = @(x) x .* 0.5;

subgroupLabelOrientation = {...
    'below',...
    'below',...
    'below',...
    'below',...
    'below'};

subgroupLabelAngle = {...
    45,...
    45,...
    45,...
    45,...
    45};

lineAtBar = [1,1];
linePosAndNeg = true;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 

% **************************************
% D2
% **************************************

graphWritePath = 'E:\Thesis Results\Standard OSC-TV FF Bar Graphs\d2 Comparison (15 Iterations).png';

column = 52;

yAxisLabel = 'Change in $d_{2}$ from control $[mm]$';

title = 'Comparison of $d_{2}$ for tested OSC-TV parameters';

f = @(x) x .* 0.5;

subgroupLabelOrientation = {...
    'above',...
    'above',...
    'below',...
    'below',...
    'above'};

subgroupLabelAngle = {...
    45,...
    70,...
    25,...
    45,...
    55};

lineAtBar = [1,1];
linePosAndNeg = true;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 