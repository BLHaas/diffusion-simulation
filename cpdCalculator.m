function cpdCalculator
%% About cpdCalculator
% Works with *.mat output of msdCalculator. Reads displacementData variable
% from *.mat file. Calculates cumulative probability of squared
% displacements less than or equal to each unique squared displacement at
% each tau. Plots CPD vs. tau (tau = frame differece)

%% Parameters
maxPlotTau = 5; % plot only the first # frame differences, not all of them

%% Import Data
% get displacementData from *.mat file
disp('Choose a *.mat file containing MSD data.')
[inputFile, inputPath] = uigetfile('*.mat', ...
    'Choose a *.mat file');
load(fullfile(inputPath, inputFile))

%% Prepare output file
disp('Choose an output folder.')
outputFile = [datestr(now, 'yyyy-mm-dd HHMMSS') ' CPD'];
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

%% Calculate CPD
% Prepare matrix to store CPD data (in pairs of displacements and
% probabilities, i.e. two columns per tau value)
[nDispRow, nTau] = size(displacementData);
cpdData = NaN(nDispRow, 2*nTau);

squaredDisps = displacementData.^2;
for iTau = 1:nTau
    % Ignore NaN values
    currTauDisps = squaredDisps(~isnan(squaredDisps(:, iTau)), iTau);
    % Find unique squared displacements
    uniqSqDisps = unique(currTauDisps);
    nUniqRow = size(uniqSqDisps, 1);
    % Calculate frequencies
    freqDisps = histc(currTauDisps, unique(currTauDisps));
    sumFreq = sum(freqDisps);
    % Store CPD data in matrix
    for iUniqRow = 1:nUniqRow
        currDispCol = 2*iTau - 1; % odd columns are squared displacements
        currFreqCol = currDispCol + 1; % even columns are cumulative probabilities
        cpdData(iUniqRow, currDispCol) = uniqSqDisps(iUniqRow);
        cpdData(iUniqRow, currFreqCol) = freqDisps(iUniqRow)/sumFreq;
    end
end

%% Plot CPD curves
% Create figure window
cpdFigure = figure;
cpdFigure.Color = 'w'; % white figure background instead of gray
hold on
for iiTau = 1:maxPlotTau
    currXCol = 2*iiTau - 1; % odd columns are squared displacements
    currYCol = currXCol + 1; % even columns are cumulative probabilities
    % Plot
    plot(cpdData(:, currXCol), cpdData(:, currYCol));
end
% Label axes
cpdAxes = gca;
cpdAxes.XLabel.String = 'squared displacement';
cpdAxes.YLabel.String = 'cumulative probability';
cpdAxes.Title.String = ['CPD of ' inputFile(1:length(inputFile)-4)];

%% Save data & figure
disp('Data saved as *.csv, *.mat, and *.fig')
% Write CPD data to *.csv file
 % Header
 fprintf(outputFID, [repmat(['displacement' ',' 'probability' ','], 1, nTau) '\n']);
 % Data
 fprintf(outputFID, ['%.4f' ',' '%.4f' ',' '\n'], cpdData');
 % Footer
 fprintf(outputFID, ['Input data from ' fullfile(inputPath, inputFile) '\n']);
 fprintf(outputFID, datestr(now, 'yyyy-mm-dd HH:MM'));
% Save CPD data to *.mat file
save(fullfile(outputPath, outputFile), 'cpdData');
% Save CPD figure to *.fig file
savefig(cpdFigure, fullfile(outputPath, outputFile))

% Close *.csv file
closeFlag = fclose(outputFID);
if closeFlag == -1
    disp('Error. Could not close *.csv file.')
    return
end

end