reader = fopen('Element_Data.csv');
if reader == -1 
    disp('File open not succesful')
else
    calc = textscan(reader, '%s', 'headerlines', 1);
    closeresult = fclose(reader);
    if closeresult == 0
        disp('File close succesful')
    else
        disp('File close not succesful')
    end
end