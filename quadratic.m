chooser = uigetfile;
file = [chooser filesep];
quadr = load(file);
matrixsize = size(quadr.matGrid,1)-1;
deltax = zeros(matrixsize,1);
deltay =zeros(matrixsize,1);
% deltax3D = zeros(matrixsize,1);
% deltay3D =zeros(matrixsize,1);
steplength = zeros(matrixsize,1);
% for n = 1:matrixsize
%     deltax(n) = quadr.matGrid(n+1,1) - quadr.matGrid(n,1);
%     deltay(n) = quadr.matGrid(n+1,2) - quadr.matGrid(n,2);
% end

for n = 1:matrixsize
    deltax(n) = quadr.totalMat2(n+1,1) - quadr.totalMat2(n,1);
    deltay(n) = quadr.totalMat2(n+1,2) - quadr.totalMat2(n,2);
end

steplength(:) = sqrt(deltax.^2 + deltay.^2);
% steplength3D(:) = sqrt(deltax.^2 + deltay.^2);

simulationPlacer = uigetdir;

file = [simulationPlacer filesep 'GridWalker 3D'];
writer = fopen([file '.csv'], 'wt');
if writer == -1
    disp('File not Open Correctly');
else
end


fprintf(writer, '%d,\n', steplength');

closer = fclose(writer);
if closer == -1
    disp('File did not close correctly');
else
end