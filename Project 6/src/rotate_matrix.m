function [ output ] = rotate_matrix( angle )
%ROTATE_MATRIX 
    angle = degtorad(angle);
    output = [cos(angle) sin(angle) 0; -sin(angle) cos(angle) 0; 0 0 1];
end

