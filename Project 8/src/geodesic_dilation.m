function [ output ] = geodesic_dilation( F, G )
%GEODESIC_DILATION 
    output = F;
    old = zeros(size(F));
    while (~isequal(output, old))
        old = output;
        output = dilate(output, ones(3, 3)) & G;
    end
end

