function outputdata = gridWalker
% make a matrix of some sort with at least two columns, to store x and y values
% also make a random number generator from 1 to 4 to signify left, right, up,
% and down. Store these values that are given in a variable and put them in the
% matrix.
lowerRadius = 5;
circleWidth = 2 * pi * lowerRadius;
leftBound = circleWidth / 2;
rightBound = -circleWidth / 2;
numSubStep = 1001;
xMat = zeros(numSubStep,1);
zMat = zeros(numSubStep,1);
outputdata.matGrid = zeros(numSubStep,2);
outputdata.totalMat2 = zeros(numSubStep,3);
angleMat = zeros(numSubStep,1);
thetaMat = zeros(numSubStep,1);
r = circleWidth / 2;
outputdata.edgemat = zeros(numSubStep,2);


for mover = 1:numSubStep
    position = randi(4);
    % 1 is right 2 is left 3 is up 4 is down.
    if position == 1
        % add one to 1st columns
        outputdata.matGrid(mover + 1,1) = outputdata.matGrid(mover,1) + 1;
        outputdata.matGrid(mover+1, 2) = outputdata.matGrid(mover, 2);
%         if outputdata.matGrid(mover +1,1) > leftBound
%             % move it back to the right side
%             outputdata.matGrid(mover+1,1) = rightBound + 1;
%             outputdata.matGrid(mover+1,2) = outputdata.matGrid(mover+1,2);
%         else
%         end
    elseif position == 2
        % subtract one from 1st columns
        outputdata.matGrid(mover + 1 ,1) = outputdata.matGrid(mover,1)-1;
        outputdata.matGrid(mover+1, 2) = outputdata.matGrid(mover, 2);
%         if outputdata.matGrid(mover +1,1) < rightBound
%             % move it back to the left
%             outputdata.matGrid(mover+1,1) = leftBound - 1;
%             outputdata.matGrid(mover+1,2) = outputdata.matGrid(mover+1,2);
%         else
%         end
    elseif position == 3
        % add to second columns
        outputdata.matGrid(mover + 1,2) = outputdata.matGrid(mover,2) + 1;
        outputdata.matGrid(mover+1, 1) = outputdata.matGrid(mover, 1);
        %         if matGrid(mover+1,2) > upperBound
        %             matGrid(mover+1,2) = lowerBound + 1;
        %             matGrid(mover+1,1) = matGrid(mover,1);
        %         else
        %         end
    else
        %subtract from second columns
        outputdata.matGrid(mover + 1,2) = outputdata.matGrid(mover,2) - 1;
        outputdata.matGrid(mover+1, 1) = outputdata.matGrid(mover, 1);
        %         if matGrid(mover+1,2) < lowerBound
        %             matGrid(mover+1,2) = upperBound - 1;
        %             matGrid(mover+1,1) = matGrid(mover,1);
        %         else
        %         end
        
    end
%     if abs(outputdata.matGrid(mover,1) - outputdata.matGrid(mover+1,1)) >= 28
%         difference = outputdata.matGrid(mover,1) + outputdata.matGrid(mover+1,1)
%         outputdata.edgemat(mover + 1,1) = outputdata.matGrid(mover,1) + difference;
%         outputdata.edgemat(mover +1,2) = outputdata.matGrid(mover+1,2);
%     else
%         outputdata.edgemat(mover,1) = outputdata.matGrid(mover,1);
%         outputdata.edgemat(mover,2) = outputdata.matGrid(mover,2);
%     end
    
    angleMat(mover,1) = leftBound - outputdata.matGrid(mover,1);
    thetaMat(mover,1) = (angleMat(mover,1) / circleWidth) * (2 * pi);
    zMat(mover,1) = r * sin(thetaMat(mover,1));
    xMat(mover,1) = r * cos(thetaMat(mover,1));
    outputdata.totalMat2(mover,1) = xMat(mover,1);
    outputdata.totalMat2(mover,3) = zMat(mover,1);
    outputdata.totalMat2(mover,2) = outputdata.matGrid(mover,2);
    
end

simulationPlacer = uigetdir;
fileName3 = [simulationPlacer filesep 'GridWalker struct'];
fileName = [simulationPlacer filesep 'GridWalker 1st 2D Sim'];
fileName2 = [simulationPlacer filesep 'GridWalker 3D Sim'];
writer = fopen([fileName '.csv'], 'wt');
writer2 = fopen([fileName2 '.csv'], 'wt');
if writer == -1
    disp('File not Open Correctly');
else
end
if writer2 == -1
    disp('File not Open Correctly');
else
end
fprintf(writer,'x,y\n');
fprintf(writer, '%d,%d,\n', outputdata.matGrid');
fprintf(writer2,'x,y,z\n');
fprintf(writer2, '%d,%d,%d,\n', outputdata.totalMat2');
closeresult = fclose(writer);
closeresult2 = fclose(writer2);
if closeresult == -1
    disp('File did not close correctly');
else
end
if closeresult2 == -1
    disp('File did not close correctly');
else
end
save(fileName3,'-struct','outputdata');
end
