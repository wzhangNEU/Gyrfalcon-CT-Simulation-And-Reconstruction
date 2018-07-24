function [] = takeAndPlotLineProfiles(writePath, volumes, volumeUnitConversion, sliceNum, xCoords, yCoords, voxelDimInMM, figureDimsInCm, xLabel, yLabel, lineStyles, lineColours, lineWidths, legendLabels)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

numPixels = ceil(norm([xCoords(2)-xCoords(1), yCoords(2)-yCoords(1)]))+1;

numProfiles = length(volumes);

profilePoints = cell(numProfiles,1);

for i=1:numProfiles
    volume = volumes{i};
    
    profilePoints{i} = improfile(volume(:,:,sliceNum), xCoords, yCoords, numPixels);
end

distInMM = voxelDimInMM .* numPixels;

x = linspace(0, distInMM, numPixels);

fig = figure();
axis = axes('parent', fig);
hold(axis, 'on');

fig.Units = 'centimeters';
fig.Position = [1 1 figureDimsInCm(2) figureDimsInCm(1)];

for i=1:numProfiles
    plot(...
        axis, x, profilePoints{i}.*volumeUnitConversion,...
        'LineStyle', lineStyles{i},...
        'Color', lineColours{i},...
        'LineWidth', lineWidths{i});    
end

xlim(axis, [x(1), x(end)]);

ylabel(axis, yLabel, 'Interpreter', 'latex');
xlabel(axis, xLabel, 'Interpreter', 'latex');

box(axis, 'on');
axis.YGrid = 'on';
axis.XGrid = 'on';
grid(axis, 'minor');

axis.FontName = 'times';

axis.Units = 'centimeters';

pos = axis.Position;
pos(3) = figureDimsInCm(2) - pos(1) - 0.4;
pos(4) = pos(4) + 0.1;
axis.Position = pos;

% save without legend

drawnow;

saveas(fig, strrep(writePath, '.png', ' (1).png'));
savefig(fig, strrep(writePath, '.png', ' (1).fig'), 'compact');

% add legend
leg = legend(axis, legendLabels);
leg.Box ='off';

% save with legend

drawnow;

saveas(fig, strrep(writePath, '.png', ' (2).png'));
savefig(fig, strrep(writePath, '.png', ' (2).fig'), 'compact');


% delete
delete(fig);

end

