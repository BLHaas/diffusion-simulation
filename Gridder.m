function grid = Gridder
  numSubStep = 1001;
  grid.matGrid = zeros(numSubStep,2);
   for mover = 1:numSubStep
#random number from 1-4
    position = randi(4);
# if one is the random number take 1 step up
    if position == 1
      grid.matGrid(mover + 1,1) = grid.matGrid(mover,1) + 1;
      grid.matGrid(mover + 1,2) = grid.matGrid(mover,2);
# if two is chosen take 1 step down
    elseif position == 2
      grid.matGrid(mover + 1,1) = grid.matGrid(mover,1) - 1;
      grid.matGrid(mover + 1,2) = grid.matGrid(mover,2);
# if three is chosen take one step to the right
    elseif position == 3
      grid.matGrid(mover + 1,1) = grid.matGrid(mover,1);
      grid.matGrid(mover + 1,2) = grid.matGrid(mover,2) + 1;
# if 4 is chosen take one step to the left
    else position == 4
      grid.matGrid(mover + 1,1) = grid.matGrid(mover,1);
      grid.matGrid(mover + 1,2) = grid.matGrid(mover,2) - 1;
# all the steps compound for the number of substeps chosen in the for loop
    end
    end