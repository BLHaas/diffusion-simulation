matGrid = gridWalker;
upperRadius = 3;
lowerRadius = 5;
circleHeight = pi * upperRadius;
upperBound = circleHeight / 2;
lowerBound = -circleHeight / 2;
circleWidth = 2 * pi * lowerRadius;
leftBound = circleWidth / 2;
rightBound = -circleWidth / 2;
%this program reates a boundary in which a certain thing can move. When this thing
%hits that boundary it shows up on the opposing side simulating as if it were in 3d
%there are two variables controling the size of this area. Diameter is half of the
%width and can be used to adjust the size of it. circWidth is the total width
%using the circomfrence fromula for a circle.
% otherGrid = circleWalker;
%Width
for gridlocation = 1:size(matGrid)
    if matGrid(gridlocation +1,1) > leftBound
        % move it back to the right side
        matGrid(gridlocation+1,1) = rightBound +1;
        matGrid(gridlocation+1,2) = matGrid(gridlocation,2);
    elseif matGrid(gridlocation +1,1) < rightBound
        % move it back to the left
        matGrid(gridlocation+1,1) = leftBound -1;
        matGrid(gridlocation+1,2) = matGrid(gridlocation,2);
    elseif matGrid(gridlocation+1,2) > upperBound
        matGrid(gridlocation+1,2) = lowerBound + 1;
        matGrid(gridlocation+1,1) = matGrid(gridloation,1);
    elseif matGrid(gridlocation+1,2) < lowerBound
        matGrid(gridlocation+1,2) = upperBound - 1;
        matGrid(gridlocation+1,1) = matGrid(gridloation,1);
    else
    end
end
% for circlelocation = 1:length(otherGrid)
%     if otherGrid(circlelocation+1,1) > leftBound
%         %move it back to the right edge of the right side.
%         otherGrid(circlelocation+1,2) = otherGrid(circlelocation,2);
%     elseif otherGrid(circlelocation+1,1) < rightBound
%         %move it back to the left edge
%         otherGrid(circlelocation+1,2) = otherGrid(circleLocation,2);
%     elseif otherGrid(circlelocation+1,2 > upperBound 
%         %continue where it was going on the botom.
%         otherGrid(circlelocation+1,1) = otherGrid(circlelocation,1);
%     elseif otherGrid(circlelocation+1,2) < lowerBound
%         %continue where it was going on the top.
%         otherGrid(circlelocation+1,1) = otherGrid(circlelocation,1);
%     else
%     end
% end


