function [ output ] = erode( A, B )
%ERODE 
    output = 1 - dilate(1 - A, B);
end

