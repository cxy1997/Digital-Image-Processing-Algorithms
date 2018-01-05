function [ output ] = translate_matrix( tx, ty )
%TRANSLATE_MATRIX 
    output = [1 0 0; 0 1 0; tx ty 1];
end

