function [ output ] = arithmatic_mean_filter( input, h, w )
%ARITHMATIC_MEAN_FILTER 
    f = ones(h, w) / h / w;
    output = filter2(f, input);
end

