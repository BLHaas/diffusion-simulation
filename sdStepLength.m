<<<<<<< HEAD
geter = uigetfile;reader = fopen(geter,'r');if reader == -1   disp('File open not succesful')else  ray = textscan(reader, '%d', 'headerlines',1);  closeresult = fclose(reader);  if closeresult == -1      disp('File close not succesful')  else  endend    refMat = ray(:,1);randomRandy = randi([1,10000]);    stepLength = refMat(randomRandy);
=======
function stepLength = sdStepLengthreader = fopen('Rayleigh random116-06-15 15-17-03.csv','r');if reader == -1   disp('File open not succesful')else  ray = textscan(reader, '%f');  closeresult = fclose(reader);  if closeresult == -1      disp('File close not succesful')  else  endend    refMat = ray{1,1}(:,1);stepLength = refMat(randi([1 1000]));end
>>>>>>> master
