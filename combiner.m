chooser = uigetfile;
chooser2 = uigetfile;
chooser3 = uigetfile;
allsaver = uigetdir;
filename = [allsaver filesep 'circle2d'];
filename2 = [allsaver filesep 'circle3d'];
filename3 = [allsaver filesep 'grid2d'];
filename4 = [allsaver filesep 'grid3d'];
filename5 = [allsaver filesep 'circlenew2d'];
filename6 = [allsaver filesep 'gridnew2d'];
filename7 = [allsaver filesep 'sf2D'];
filename8 =[allsaver filesep 'sf3D'];
filename9 = [allsaver filesep 'sfnew2D'];
circlefile = [chooser filesep];
gridfile = [chooser2 filesep];
stepfreqfile = [chooser3 filesep];
circle = load(circlefile);
grid = load(gridfile);
sfreq = load(stepfreqfile);
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
%step freq points
sfx = sfreq.newMat(:,1);
sfy = sfreq.newMat(:,2);
sf3Dx = sfreq.totalMat3(:,1);
sf3Dy = sfreq.totalMat3(:,2);
sf3Dz = sfreq.totalMat3(:,3);
%plots for 2d
circle2D = figure;
plot(cx,cy);
savefig(filename);
grid2D = figure;
plot(gx,gy);
savefig(filename3);
figure;
plot(sfx,sfy);
savefig(filename7);
%plots for 3d
circle3D = figure;
plot3(c3Dx, c3Dy, c3Dz);
savefig(filename2);
grid3D = figure;
plot3(g3Dx,g3Dy,g3Dz);
savefig(filename4);
figure;
plot3(sf3Dx,sf3Dy,sf3Dz);
savefig(filename8);
%going from 3d back to 2d
cnew2dgrid = zeros(10001,2);
gnew2dgrid = zeros(10001,2);
sfnew2dgrid = zeros(501,2);
for n = 1:10000
cnew2dgrid(n,1) = circle.totalMat(n,1);
cnew2dgrid(n,2) = circle.totalMat(n,2);
gnew2dgrid(n,1) = grid.totalMat2(n,1);
gnew2dgrid(n,2) = grid.totalMat2(n,2);
end
for n = 1:500
    sfnew2dgrid(n,1) = sfreq.totalMat3(n,1);
    sfnew2dgrid(n,2) = sfreq.totalMat3(n,2);
end
%new 2d points
ncx = cnew2dgrid(:,1);
ncy = cnew2dgrid(:,2);
ngx = gnew2dgrid(:,1);
ngy = gnew2dgrid(:,2);
nsfx = sfnew2dgrid(:,1);
nsfy = sfnew2dgrid(:,2);
%plot for new 2d points
circlen2D = figure;
plot(ncx,ncy);
savefig(filename5)
gridn2D = figure;
plot(ngx,ngy);
savefig(filename6)
figure;
plot(nsfx,nsfy);
savefig(filename9);
%saving everything
