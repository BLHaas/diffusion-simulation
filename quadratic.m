chooser = uigetfile;
file = [chooser filesep];
quadr = load(file);
xpositionMat(:,1) = quadr.totalMat(:,1);
ypostionMat(:,1) = quadr.totalMat(:,2);
matrixsize = size(quadr.totalMat,1)-1;
deltax = zeros(matrixsize,1);
deltay =zeros(matrixsize,1);
steplength = zeros(matrixsize,1);
for n = 1:matrixsize
    deltax(n) = quadr.totalMat(n+1,1) - quadr.totalMat(n,1);
    deltay(n) = quadr.totalMat(n+1,2) - quadr.totalMat(n,2);
end
steplength(:) = sqrt(deltax.^2 + deltay.^2);