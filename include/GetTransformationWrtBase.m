%% GetTransformatioWrtBase function
% inputs:
% - biTei: vector of matrices containing the transformation matrices from 
%          link i to link i+1 for the current q;
% - linkNumber: for which computing the transformation matrix;
% output:
% - bTi: transformation matrix from the manipulator base to the ith joint 
%        in the configuration identified by biTei;

function [bTi] = GetTransformationWrtBase(biTei, linkNumber)
    % Initialize bTi as the identity matrix
    bTi= eye(4);
    
    % Post-multiply all the matrices that are encountered  from the base to
    % the desired link
    for i= 1:linkNumber
        bTi= bTi * biTei(:, :, i);
    end
    
end