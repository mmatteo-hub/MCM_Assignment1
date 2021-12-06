%% DirectGeometry Function 
% inputs: 
% - q : current links position;
% - biTri: transformation matrix from link i to link i+1 for qi=0; 
% - jointType: 0 for revolute, 1 for prismatic;
% output:
% biTei : transformation matrix from link i to link i+1 for the input qi.

function biTei = DirectGeometry(qi, biTri, linkType)

    %Initialize the transformation matrix as an identity one
    T_qi= eye(4);
    
    if(linkType == 0)           % revolute joint
        % Basic homogenous rotational matrix along z_i axis
        T_qi(1, :)= [cos(qi)   -sin(qi)  0   0]; 
        T_qi(2, :)= [sin(qi)    cos(qi)  0   0];
     
    elseif(linkType == 1)       % prismatic joint
        % Basic homogenous translational matrix along z_i axis
        T_qi(3, 4)= qi;
        
    else                    
        % error
        error('Unrecognized link type.')
        
    end
    
    biTei= biTri * T_qi;
   
end