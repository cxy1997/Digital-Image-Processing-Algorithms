function [ output ] = contraharmonic_mean_filter( input, h, w, Q )
%CONTRAHARMONIC_MEAN_FILTER 
    f = ones(h, w);
    output = filter2(f, input .^ (Q + 1)) ./ filter2(f, input .^ Q);
end

