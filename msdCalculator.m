% function msdCalculator
%% About msdCalculator
% Works with 1 track only. Reads data from csv file with 2 columns 
% (X and Y positions). Calculates mean squared displacement over
% first 75% of possible frame differences. Plots MSD vs. tau
% (tau = frame difference)

%% Parameters
fracFrameDiffs = .75; %use first #% of frame differences as tau values

%% Column Assignments
xColumn = 1;
yColumn = 2;

%% Import data file
% To do: inputPath = 
molPositions = importdata(inputPath, '\t', 1);

%% Prepare output file
% To do

%% Determine maximum frame difference to use
nFrames = size(molPositions.data, 1); % #rows = #frames
nFrameDiff = floor(fracFrameDiffs*nFrames);

%% Prepare empty matrix for storing displacements
displacementData = NaN(nFrames - 1, nFrameDiff);

%% Calculate displacements
for iFrameDiff = 1:nFrameDiff % choose a tau value (frame difference)
    nRow = nFrames - iFrameDiff;
    for iRow = 1:nRow % calculate displacements at the chosen tau value
        deltaX = molPositions.data(iRow + iFrameDiff, xColumn) - ...
            molPositions.data(iRow, xColumn);
        deltaY = molPositions.data(iRow + iFrameDiff, yColumn) - ...
            molPositions.data(iRow, yColumn);
        displacementData(iRow, iFrameDiff) = sqrt( deltaX^2 + deltaY^2 );
    end
end

%% To be continued
% mean(displacementData.^2, 'omitnan')'
% store MSD values with their respective tau values
% plot MSD vs. tau
% save data & plot

% end of function