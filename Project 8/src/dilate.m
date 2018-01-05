function [ output ] = dilate( A, B )
%DILATE 
    [H, W] = size(A);
    [h, w] = size(B);
    output = zeros(H, W);
    [x, y] = find(A == 1);
    for i = 1:size(x, 1)
        for j = -(h-1)/2:(h-1)/2
            for k=-(w-1)/2:(w-1)/2
                if x(i) + j >= 1 && x(i) + j <= H && y(i) + k >= 1 && y(i) + k <= W
                    output(x(i) + j, y(i) + k) = A(x(i) + j, y(i) + k) | B(j + (h+1)/2, k + (w+1)/2);
                end
            end
        end
    end
end

