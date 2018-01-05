function [ output ] = remap( input )
%REMAP 
    output = uint8((input - min(min(input))) / (max(max(input)) - min(min(input))) * 255);
end

