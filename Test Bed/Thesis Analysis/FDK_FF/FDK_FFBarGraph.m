% **************************************
% Set Base Params
% **************************************
readPath = 'E:\Thesis Results\External Beam Trials.xls';
sheet = 'FDK_FF ANLYS';

groupLabels = {...
    '\begin{tabular}{c}1500MU\\Pre\end{tabular}',...
    '\begin{tabular}{c}1500MU\\Post\end{tabular}',...
    '\begin{tabular}{c}2000MU\\Pre\end{tabular}',...
    '\begin{tabular}{c}2000MU\\Post\end{tabular}'};

groupRows = {...
    7,...
    8,...
    9,...
    10};

subgroupLabels = {};

subgroupColours = [...
    0.50 0.50 0.50];

customColours = {...
    [], [], [], [], [], [], [], []};

figDimsInCm = [10, 15];

subgroupLabelWriteIndex = 0;

% **************************************
% Delta Mean
% **************************************

graphWritePath = 'E:\Thesis Figures\Results\FDK_FF\Bar Graphs\Delta Mean Comparison.png';

column = 40;

yAxisLabel = 'Change in $\Delta_{ROI}$ from control  $[cm^-1]$';

title = 'Comparison of $\Delta_{ROI}$ for external beam trials';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'above',...
    'above',...
    'above'};

subgroupLabelAngle = {...
    80,...
    80,...
    80};

lineAtBar = [];
linePosAndNeg = false;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 

% **************************************
% Delta Mean (Entire ROI)
% **************************************

graphWritePath = 'E:\Thesis Figures\Results\FDK_FF\Bar Graphs\Delta Mean Comparison (Entire ROI).png';

column = 22;

yAxisLabel = 'Change in $\Delta_{ROI}$ from control  $[cm^-1]$';

title = 'Comparison of $\Delta_{ROI}$ for external beam trials';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'above',...
    'above',...
    'above'};

subgroupLabelAngle = {...
    80,...
    80,...
    80};

lineAtBar = [];
linePosAndNeg = false;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 


% **************************************
% Mean
% **************************************

graphWritePath = 'E:\Thesis Figures\Results\FDK_FF\Bar Graphs\Mean Comparison.png';

column = 28;

yAxisLabel = 'Change in $\bar{\mu}_{ROI}$ from control $[cm^-1]$';

title = 'Comparison of $\bar{\mu}_{ROI}$ for tested OSC-TV parameters';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'above',...
    'above',...
    'above'};

subgroupLabelAngle = {...
    45,...
    45,...
    45};

lineAtBar = [];
linePosAndNeg = false;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 

% **************************************
% Stdev
% **************************************

graphWritePath = 'E:\Thesis Figures\Results\FDK_FF\Bar Graphs\Stdev Comparison.png';

column = 31;

yAxisLabel = 'Change in $\sigma_{ROI}$ from control $[cm^-1]$';

title = 'Comparison of $\sigma_{ROI}$ for tested OSC-TV parameters';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'above',...
    'above',...
    'above'};

subgroupLabelAngle = {...
    35,...
    45,...
    45};

lineAtBar = [];
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

graphWritePath = 'E:\Thesis Figures\Results\FDK_FF\Bar Graphs\Gradient Comparison.png';

column = 34;

yAxisLabel = 'Change in $\nabla_{ROI}$ from control  $[cm^-1]$';

title = 'Comparison of $\nabla_{ROI}$ for tested OSC-TV parameters $[unitless]$';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'below',...
    'below',...
    'below'};

subgroupLabelAngle = {...
    40,...
    40,...
    40};

lineAtBar = [];
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

graphWritePath = 'E:\Thesis Figures\Results\FDK_FF\Bar Graphs\d1 Comparison.png';

column = 46;

yAxisLabel = 'Change in $d_{1}$ from control $[mm]$';

title = 'Comparison of $d_{1}$ for tested OSC-TV parameters';

f = @(x) x .* 0.5;

subgroupLabelOrientation = {...
    'below',...
    'below',...
    'below'};

subgroupLabelAngle = {...
    45,...
    45,...
    45};

lineAtBar = [];
linePosAndNeg = false;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 

% **************************************
% D2
% **************************************

graphWritePath = 'E:\Thesis Figures\Results\FDK_FF\Bar Graphs\d2 Comparison.png';

column = 52;

yAxisLabel = 'Change in $d_{2}$ from control $[mm]$';

title = 'Comparison of $d_{2}$ for tested OSC-TV parameters';

f = @(x) x .* 0.5;

subgroupLabelOrientation = {...
    'above',...
    'above',...
    'above'};

subgroupLabelAngle = {...
    45,...
    45,...
    45};

lineAtBar = [];
linePosAndNeg = false;

barGraphDataCollectionAndCreation(...
    readPath, sheet, groupRows, column,...
    graphWritePath, groupLabels, subgroupLabels,...
    subgroupLabelWriteIndex, subgroupLabelOrientation, subgroupLabelAngle,...
    figDimsInCm, subgroupColours, customColours,...
    yAxisLabel, title, f, lineAtBar, linePosAndNeg); 