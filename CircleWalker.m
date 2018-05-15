%using trigonometry the the ranom walk is portrayed. A  radius is chosen, 
%and using sin and cosin the x and z and angles are used to find the z value. The length of the step is determined by either a random number generated in a step before or a 1. If no value is put in for step length then the default steplength is one
function circleWalkerData = CircleWalker(stepSize)
#vairiables

#radius of the circle
  lowerRadius = 5;
# 2pir = circ0umference of the circle
  circleWidth = 2 * pi * lowerRadius;
#upper half of the circle
  leftBound = circleWidth / 2;
#lower half of the circle
  rightBound = -circleWidth / 2
# radius
  r = circleWidth / 2 * pi;
#step constant variable used to detrmine what step length to use
  stepConstant = 0:
# number of steps taken throiughout the whole simulatiom
  numSubSteps = 1000;
  
  circleWalkerData.circleGrid = zeros(numSubSteps,2);
  stepLength = 0;
  angleMat = zeros(numSubSteps,1);
  thetaMat = zeros(numSubSteps,1);
  xMat = zeros(numSubSteps,1);
  zMat = zeros(numSubSteps,1);
  circleWalkerData.totalMat = zeros(numSubSteps,3);
  
  if nargin == 0
    stepLength = 1;
    stepConstant = 0;
  elseif stepSize == -1 
    stepConstant = 1;
  else
    stepLength = stepSize;
  end
  
  for stepper = 1:numSubSteps
    if stepConstant == 1
      stepLength = sdStepLength;
    else 
    end
    stepAngle = (2*pi) * rand(1);
    y = sin(stepAngle) * stepLength;
    x = cos(stepAngle) * stepLength;
    circleWalkerData.circleGrid(stepper + 1,1) = circleWalkerData.circleGrid(stepper,1) + x;
    circleWalkerData.circleGrid(stepper + 1,2) = circleWalkerData.circleGrid(stepper,2) + y;
    angleMat(stepper,1) = leftBound - circleWalkerData.circleGrid(stepper,1);
    thetaMat(stepper,1) = (angleMat(stepper,1) / circleWidth) * (2 * pi);
    zMat(stepper,1) = r * sin(thetaMat(stepper,1));
    xMat(stepper,1) = r * cos(thetaMat(stepper,1));
    circleWalkerData.totalMat(stepper,1) = xMat(stepper,1);
    circleWalkerData.totalMat(stepper,3) = zMat(stepper,1);
    circleWalkerData.totalMat(stepper,2) = circleWalkerData.circleGrid(stepper,2);
end

      
    
    
  
  