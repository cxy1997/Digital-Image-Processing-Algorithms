function [ output ] = geometric_mean_filter( input, h, w )
%GEOMETRIC_MEAN_FILTER 
    f = ones(h, w) / h / w;
    output = real(exp(filter2(f, log(input))));
end

