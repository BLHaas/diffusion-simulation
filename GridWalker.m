function gridwalkerdata = GridWalker
#constants

# raious of the bacteria in the 3D projection
  lowerRadius = 5;
# circumference of the circle
  circleWidth = 2 * pi * lowerRadius;
# left half cylynder
  leftBound = circleWidth / 2;
#right half cylinder
  rightBound = -circleWidth / 2;
#number of steps 
  numSubStep = 1001;
# x-value of the 3D matrix
  gridwalkerdata.xMat = zeros(numSubStep,1);
# z value of the 3D matrix
  gridwalkerdata.zMat = zeros(numSubStep,1);
# original 2D grid
  gridwalkerdata.matGrid = zeros(numSubStep,2);
# original 3D grid
  gridwalkerdata.totalMat2 = zeros(numSubStep,3);
# angle matrix for finding x and z values
  angleMat = zeros(numSubStep,1);
# matrix to find theta of the matrix and used to make x and z values for 3D
  thetaMat = zeros(numSubStep,1);
# radius
  r = lowerRadius;
# z for 3D from 2D projection of old 3D
  gridwalkerdata.zMat2 = zeros(numSubStep,1);
# x-value of the projection backtracked from the 2D projection 
  xval = zeros(numSubStep,1);
# angle of old 3D projection found from 2D projection of old 3D projection
  newangle = zeros(numSubStep,1);
# theta found form backtracking from the 2D projection
  gridwalkerdata.newtheta = zeros(numSubStep,1);
# z val found from backtracking from the 2D projection
  gridwalkerdata.newzval = zeros(numSubStep,1);
# 
  gridwalkerdata.x = zeros(numSubStep,1);
# new 3D matrix from backtracked to 2D
  gridwalkerdata.new3dmat = zeros(numSubStep,3);
# for loop that distinguishes number of steps that need to be taken
  for mover = 1:numSubStep
#random number from 1-4
    position = randi(4);
# if one is the random number take 1 step up
    if position == 1
      gridwalkerdata.matGrid(mover + 1,1) = gridwalkerdata.matGrid(mover,1) + 1;
      gridwalkerdata.matGrid(mover + 1,2) = gridwalkerdata.matGrid(mover,2);
# if two is chosen take 1 step down
    elseif position == 2
      gridwalkerdata.matGrid(mover + 1,1) = gridwalkerdata.matGrid(mover,1) - 1;
      gridwalkerdata.matGrid(mover + 1,2) = gridwalkerdata.matGrid(mover,2);
# if three is chosen take one step to the right
    elseif position == 3
      gridwalkerdata.matGrid(mover + 1,1) = gridwalkerdata.matGrid(mover,1);
      gridwalkerdata.matGrid(mover + 1,2) = gridwalkerdata.matGrid(mover,2) + 1;
# if 4 is chosen take one step to the left
    else position == 4
      gridwalkerdata.matGrid(mover + 1,1) = gridwalkerdata.matGrid(mover,1);
      gridwalkerdata.matGrid(mover + 1,2) = gridwalkerdata.matGrid(mover,2) - 1;
# all the steps compound for the number of substeps chosen in the for loop
    end
# asigns an angle to each x value
    angleMat(mover,1) = leftBound - gridwalkerdata.matGrid(mover,1);
# finds theta by solving for it using the circumference of a circle equation
    thetaMat(mover,1) = (angleMat(mover,1) / circleWidth) * (2 * pi);
# using sin assign a z value and the theta we found 
    gridwalkerdata.zMat(mover,1) = r * sin(thetaMat(mover,1));
# assign an x value using cos and the theta we found
    gridwalkerdata.xMat(mover,1) = r * cos(thetaMat(mover,1));
# assigns x value found to a total matrix
    gridwalkerdata.totalMat2(mover,1) = gridwalkerdata.xMat(mover,1);
# assigns the z value we found to the total matrix
    gridwalkerdata.totalMat2(mover,3) = gridwalkerdata.zMat(mover,1);
# assigns y value to the total matrix from the original data
    gridwalkerdata.totalMat2(mover,2) = gridwalkerdata.matGrid(mover,2);
# in these next three lines we backtrack to try and find the original x value so that we can show the half cylynder from the 2D projection into a half cylynder in 3D
    gridwalkerdata.x(mover,1) = gridwalkerdata.totalMat2(mover,1)/r;
    gridwalkerdata.newtheta(mover,1) = acos(gridwalkerdata.x(mover,1));
    newzval(mover,1) = sin(gridwalkerdata.newtheta(mover,1)) * r;
# assigns all the values to a new 3d matrix for graphing reasons
    gridwalkerdata.new3dmat(mover,1) = gridwalkerdata.totalMat2(mover,1);
    gridwalkerdata.new3dmat(mover,2) = gridwalkerdata.totalMat2(mover,2);
    gridwalkerdata.new3dmat(mover,3) = gridwalkerdata.newzval(mover,1);
  end
  