% make a matrix of some sort with at least two columns, to store x and y values% also make a random number generator from 1 to 4 to signify left, right, up,% and down. Store these values that are given in a variable and put them in the% matrix.matGrid = zeros(1001,2);numStepMat = zeros(50,2);numSteps = 20;numSubStep = 1001  for mover = 1:numSubStep    position = randi(4);    % 1 is right 2 is left 3 is up 4 is down.      if position == 1      % add one to 1st columns      matGrid(mover + 1,1) = matGrid(mover,1) + 1;      matGrid(mover+1, 2) = matGrid(mover, 2);      elseif position == 2      % subtract one from 1st columns       matGrid(mover + 1 ,1) = matGrid(mover,1) - 1;       matGrid(mover+1, 2) = matGrid(mover, 2);      elseif position == 3      % add to second columns       matGrid(mover + 1,2) = matGrid(mover,2) + 1;       matGrid(mover+1, 1) = matGrid(mover, 1);      else      %subtract from second columns       matGrid(mover + 1,2) = matGrid(mover,2) - 1;       matGrid(mover+1, 1) = matGrid(mover, 1);      end   end   for chooser = 1:floor(numSubStep/numSteps)  numStepMat(chooser,:) = matGrid(chooser*20,:);   end simulationPlacer = uigetdir; refinedSimulationPlacer2 = uigetdir; fileName = [simulationPlacer filesep 'GridWalker Sim ' datestr(now, 'yy-mm-dd HH-MM-SS')]  writer = fopen([fileName '.csv'], 'wt'); fileName2 = [refinedSimulationPlacer2 filesep 'GridWalker Sim Steps' datestr(now, 'yy-mm-dd HH-MM-SS')]; writer2 = fopen([fileName2 '.csv'], 'wt');if writer == -1   disp('File not Open Correctly');elseend fprintf(writer,'x,y\n'); fprintf(writer, '%d,%d,\n', matGrid'); closeresult = fclose(writer);if closeresult == -1  disp('File did not close correctly');elseendif writer2 == -1  disp('File not Open Correctly');elseend fprintf(writer2,'x,y\n'); fprintf(writer2, '%d,%d,\n', numStepMat'); fprintf(writer2, 'Nth step'); closeresult2 = fclose(writer2);if closeresult2 == -1 disp('File did not close correctly');elseend   