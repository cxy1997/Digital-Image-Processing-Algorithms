function [ output ] = remap_image( input )
%REMAP_IMAGE remaps the intensity to [0, 1]
    output = (input - min(min(input))) / (max(max(input)) - min(min(input)));

end

