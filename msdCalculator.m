function msdCalculator
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
disp ('Choose a data file.')
[inputFile, inputPath] = uigetfile('*.csv', ...
    'Choose a data file');
if isequal(inputFile, 0) || isequal(inputPath, 0)
    disp('User canceled.')
    return
end
molPositions = importdata(fullfile(inputPath, inputFile), ',', 1);

%% Prepare output file
disp('Choose an output folder.')
outputFile = [datestr(now, 'yyyy-mm-dd HHMMSS') ' MSD'];
outputPath = uigetdir('', 'Choose an output folder');
if isequal(outputPath, 0)
    disp('User canceled.')
    return
end
outputFID = fopen([fullfile(outputPath, outputFile) '.csv'], 'w');
if outputFID == -1
    disp('Error. Cannot open output file.')
    return
end

%% Determine maximum frame difference to use
nFrames = size(molPositions.data, 1); % #rows = #frames
nFrameDiff = floor(fracFrameDiffs*nFrames);

%% Prepare empty matrix for storing displacements
displacementData = NaN(nFrames - 1, nFrameDiff);

%% Calculate displacements
disp('Calculating displacements')
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

%% Store MSD and tau values
msdData(:, 1) = (1:nFrameDiff)'; % tau values
msdData(:, 2) = mean(displacementData.^2, 'omitnan')'; % MSD values

%% Plot MSD curve
% Create figure window
msdFigure = figure;
msdFigure.Color = 'w'; % white figure background instead of gray
% Plot
plot(msdData(:,1), msdData(:,2));
% Label axes
msdAxes = gca;
msdAxes.XLabel.String = 'frame difference';
msdAxes.YLabel.String = 'mean squared displacement';
msdAxes.Title.String = ['MSD of ' inputFile(1:length(inputFile)-4)];

%% Save data & figure
disp('Data saved as *.csv, *.mat, and *.fig')
% Write MSD data to *.csv file
fprintf(outputFID, ['%d' ',' '%.4f' ',' '\n'], msdData');
fprintf(outputFID, ['Input data from ' fullfile(inputPath, inputFile)]);
% Save MSD and displacement data to *.mat file
save(fullfile(outputPath, outputFile), 'msdData', 'displacementData');
% Save MSD figure to *.fig file
savefig(msdFigure, fullfile(outputPath, outputFile))

% Close *.csv file
closeFlag = fclose(outputFID);
if closeFlag == -1
    disp('Error. Could not close *.csv file.')
    return
end
end