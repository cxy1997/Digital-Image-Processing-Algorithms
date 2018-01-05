function [ output_distribution ] = myEqualization( L, distribution )
%MYEQUALIZATION equalizes the histogram
%   It returns a mapping that equalizes the original distribution

    output_distribution = distribution;
    for i = 2:size(distribution);
        output_distribution(i) = output_distribution(i-1) + distribution(i);
    end
    output_distribution = output_distribution * (L - 1) / sum(distribution(:));


end

