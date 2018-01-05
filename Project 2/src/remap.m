function [ output ] = remap( input, lb, ub )
%REMAP remaps a matrix to the interval [lb, ub]
%   lb = lower bound, ub = upper bound
    if max(max(input)) ~= min(min(input))
        output = (input - min(min(input))) / (max(max(input)) - min(min(input))) * (ub - lb) + lb;
    else
        output = input - input + (ub + lb) / 2;
    end
end

