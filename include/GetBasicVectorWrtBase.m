%% GetBasicVectorWrtBase function 
% inputs :
% - biTei: vector of matrices containing the transformation matrices from link i to link i +1. The
% size of biTri is equal to (4,4,numberOfLinks)
% - linkNumber: number of link for which computing the basic vector from the
% base to the joint
% output:
% r : basic vector from the base to the input joint (so that we can then plot
%     all the vectors and check the robot's posture)

function [r]=GetBasicVectorWrtBase(biTei, linkNumber)

    bTi= GetTransformationWrtBase(biTei, linkNumber);
    r= bTi(1:3, 4);
end