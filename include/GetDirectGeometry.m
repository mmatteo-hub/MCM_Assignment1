%% GetDirectGeometryFunction
%inputs: 
% - q : links current position ; 
% - biTri : vector of matrices containing the transformation matrices from
% link i to link i+1 for q=0. The size of biTri is (4,4,numberOfLinks)];
% - linkType: vector of size numberOfLinks identifying the joint type: 0 for revolute, 1 for
% prismatic.
% outputs:
% - biTei: vector of matrices containing the transformation matrices from link i to link i+1 for the input q. The
% size of biTei is equal to (4,4,numberOfLinks).

function [biTei] = GetDirectGeometry(q, biTri, linkType)
    numberOfLinks_1= size(q, 1);
    numberOfLinks_2= size(biTri, 3);
    if(numberOfLinks_1 ~= numberOfLinks_2)
        % error
        error('Dimensions mismatch between q and biTri');
    end
    
    n= numberOfLinks_1;
    biTei= zeros(4, 4, n);
    for i= 1:n
        biTei(:, :, i)= DirectGeometry(q(i), biTri(:, :, i), linkType(i));
    end
end