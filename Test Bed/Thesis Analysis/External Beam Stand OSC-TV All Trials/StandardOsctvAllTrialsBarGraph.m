% **************************************
% Set Base Params
% **************************************
readPath = 'E:\Thesis Results\External Beam Trials.xls';
sheet = 'Stand. OSC-TV All Trials ANLYS';

groupLabels = {...
    '\begin{tabular}{c}1 Catheter\\500MU\end{tabular}',...
    '\begin{tabular}{c}1 Catheter\\1500MU\end{tabular}',...
    '\begin{tabular}{c}1 Catheter\\2000MU\end{tabular}',...
    '\begin{tabular}{c}1 Catheter\\2500MU\end{tabular}',...
    '\begin{tabular}{c}1 Catheter\\(Off-axis)\\2000MU\end{tabular}',...
    '\begin{tabular}{c}3 Catheters\\2000MU\end{tabular}',...
    '\begin{tabular}{c}5 Catheters\\2000MU\end{tabular}'};

groupRows = {...
    5:7,...
    9:11,...
    13:15,...
    17:19,...
    21:23,...
    25:27,...
    29:31};

subgroupLabels = {...
    'FDK',...
    'OSC-TV',...
    'OSC-TV$_{FF}$'};

subgroupColours = [...
    0.8 0.8 0.8;...
    0.50 0.50 0.50;...
    0.20 0.20 0.20];

customColours = {...
    [], [], [], [], [], [], [], []};

figDimsInCm = [10, 15];

subgroupLabelWriteIndex = 1;

% **************************************
% Delta Mean
% **************************************

graphWritePath = 'E:\Thesis Results\Standard OSC-TV All Trials Bar Graphs\Delta Mean Comparison.png';

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

graphWritePath = 'E:\Thesis Results\Standard OSC-TV All Trials Bar Graphs\Delta Mean Comparison (Entire ROI).png';

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

graphWritePath = 'E:\Thesis Results\Standard OSC-TV All Trials Bar Graphs\Mean Comparison.png';

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

graphWritePath = 'E:\Thesis Results\Standard OSC-TV All Trials Bar Graphs\Stdev Comparison.png';

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

graphWritePath = 'E:\Thesis Results\Standard OSC-TV All Trials Bar Graphs\Gradient Comparison.png';

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

graphWritePath = 'E:\Thesis Results\Standard OSC-TV All Trials Bar Graphs\d1 Comparison.png';

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

graphWritePath = 'E:\Thesis Results\Standard OSC-TV All Trials Bar Graphs\d2 Comparison.png';

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