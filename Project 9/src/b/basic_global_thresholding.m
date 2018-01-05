function [ output ] = basic_global_thresholding( input, delta )
%BASIC_GLOBAL_THRESHOLDING 
% Gonzalez DIP 10.3.2
    T = mean(mean(input));
    old = 0;
    while abs(T - old) > delta
        old = T;
        c1 = input(input <= T);
        c2 = input(input > T);
        m1 = mean(c1);
        m2 = mean(c2);
        T = (m1 + m2) / 2;
    end
    output = segment(input, T);
end

