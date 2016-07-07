chooser = uigetfile;
chooser2 = uigetfile;
circlefile = [chooser filesep];
gridfile = [chooser2 filesep];
circle = load(circlefile);
grid = load(gridfile);
%circle walker points
cx = circle.circleGrid(:,1);
cy = circle.circleGrid(:,2);
c3Dx = circle.totalMat(:,1);
c3Dy = circle.totalMat(:,2);
c3Dz = circle.totalMat(:,3);
%grid walker points
gx = grid.matGrid(:,1);
gy = grid.matGrid(:,2);
g3Dx = grid.totalMat2(:,1);
g3Dy = grid.totalMat2(:,2);
g3Dz = grid.totalMat2(:,2);
%plots for 2d
circle2D = figure;
plot(cx,cy);
grid2D = figure;
plot(gx,gy);
%plots for 3d
circle3D = figure;
plot3(c3Dx, c3Dy, c3Dz);
grid3D = figure;
plot3(g3Dx,g3Dy,g3Dz);
%going from 3d back to 2d
cnew2dgrid = zeros(10001,2);
gnew2dgrid = zeros(10001,2);
for n = 1:10000
cnew2dgrid(n,1) = circle.totalMat(n,1);
cnew2dgrid(n,2) = circle.totalMat(n,2);
gnew2dgrid(n,1) = grid.totalMat2(n,1);
gnew2dgrid(n,2) = grid.totalMat2(n,2);
end
%new 2d points
ncx = cnew2dgrid(:,1);
ncy = cnew2dgrid(:,2);
ngx = gnew2dgrid(:,1);
ngy = gnew2dgrid(:,2);
%plot for new 2d points
circlen2D = figure;
plot(ncx,ncy);
gridn2D = figure;
plot(ngx,ngy);
%saving everything
allsaver = uigetdir;
filename = [allsaver filesep 'All Simulations'];
 