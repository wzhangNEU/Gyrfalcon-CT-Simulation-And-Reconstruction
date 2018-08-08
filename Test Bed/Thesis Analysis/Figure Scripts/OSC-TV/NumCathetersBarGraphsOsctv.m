% **************************************
% Set Base Params
% **************************************
readPath = 'E:\Thesis Results\External Beam Trials.xls';
sheet = 'OSC-TV All Trials';

groupLabels = {...
    '\begin{tabular}{c}1 Cath.\end{tabular}',...
    '\begin{tabular}{c}1 Cath.\\(Offset)\end{tabular}',...
    '\begin{tabular}{c}3 Cath.\end{tabular}',...
    '\begin{tabular}{c}5 Cath.\end{tabular}'};

groupRows = {...
    15:17,...
    27:29,...
    33:35,...
    39:41};    

subgroupLabels = {...
    'Control',...
    'FDK',...
    'OSC-TV'};

subgroupColours = [...
    0.75 0.75 0.75;...
    0.25 0.25 0.25;...
    0.5 0.5 0.5];

customColours = {...
    [],...
    [],...
    [],...
    []};

figDimsInCm = [5, 7.4];

subgroupLabelWriteIndex = 1;

% **************************************
% Mean
% **************************************

graphWritePath = 'E:\Thesis Figures\Results\OSC-TV\Num Catheter Bar Graphs\Mean Comparison.png';

column = 28;

yAxisLabel = '$\bar{\Delta}\mu_{ROI}$ $[cm^-1]$';

title = '$\bar{\Delta}\mu_{ROI}$';

f = @(x) x ./ 100;

subgroupLabelOrientation = {...
    'above',...
    'above',...
    'above'};

subgroupLabelAngle = {...
    40,...
    40,...
    40};

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

graphWritePath = 'E:\Thesis Figures\Results\OSC-TV\Num Catheter Bar Graphs\Stdev Comparison.png';

column = 31;

yAxisLabel = '$\sigma_{ROI}$ $[cm^-1]$';

title = '$\sigma_{ROI}$';

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

graphWritePath = 'E:\Thesis Figures\Results\OSC-TV\Num Catheter Bar Graphs\Gradient Comparison.png';

column = 34;

yAxisLabel = '$\bar{\nabla}_{ROI}$ $[cm^{-1} / mm]$';

title = '$\bar{\nabla}_{ROI}$';

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
    16:17,...
    28:29,...
    34:35,...
    40:41};   

subgroupLabels = {...
    };

subgroupColours = [...
    0.25 0.25 0.25;...
    0.5 0.5 0.5];


graphWritePath = 'E:\Thesis Figures\Results\OSC-TV\Num Catheter Bar Graphs\Delta Comparison.png';

column = 40;

yAxisLabel = '$\bar{\Delta}_{ROI}$ $[cm^{-1}]$';

title = '$\bar{\Delta}_{ROI}$';

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

