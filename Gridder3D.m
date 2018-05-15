function grid = Gridder3D
  g = Gridder;
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
  grid.xMat = zeros(numSubStep,1);
# z value of the 3D matrix
  grid.zMat = zeros(numSubStep,1);
# original 3D grid
  grid.totalMat2 = zeros(numSubStep,3);
# angle matrix for finding x and z values
  angleMat = zeros(numSubStep,1);
# matrix to find theta of the matrix and used to make x and z values for 3D
  thetaMat = zeros(numSubStep,1);
   r = lowerRadius;
  for mover = 1:numSubStep
  # asigns an angle to each x value
    angleMat(mover,1) = leftBound - g.matGrid(mover,1);
# finds theta by solving for it using the circumference of a circle equation
    thetaMat(mover,1) = (angleMat(mover,1) / circleWidth) * (2 * pi);
# using sin assign a z value and the theta we found 
    grid.zMat(mover,1) = r * sin(thetaMat(mover,1));
# assign an x value using cos and the theta we found
    grid.xMat(mover,1) = r * cos(thetaMat(mover,1));
# assigns x value found to a total matrix
    grid.totalMat2(mover,1) = grid.xMat(mover,1);
# assigns the z value we found to the total matrix
    grid.totalMat2(mover,3) = grid.zMat(mover,1);
# assigns y value to the total matrix from the original data
    grid.totalMat2(mover,2) = g.matGrid(mover,2);
  end