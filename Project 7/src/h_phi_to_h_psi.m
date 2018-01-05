function [ output ] = h_phi_to_h_psi( input )
%H_PHI_TO_H_PSI calculates h_psi from h_phi
%   based on h_Phi(n) = (-1)^n h_phi(1-n)
    output = power(-1, 0:(size(input, 2)-1)) .* fliplr(input);
end

