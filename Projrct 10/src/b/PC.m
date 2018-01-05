function [ components, reconstruct ] = PC( input )
%PC = principal components
    c = size(input, 2);
    [h, w] = size(input{1, 1});
    data = zeros(c, h, w);
    for i = 1:c
        data(i, :, :) = input{1, i};
    end
    data = data(:, :);
    mx = mean(data, 2);
    cx = zeros(c, c);
    for i = 1:size(data, 2)
        cx = cx + data(:, i) * data(:, i)';
    end
    cx = cx / size(data, 2) - mx * mx';
    [A, D] = eig(cx);
    [D, I] = sort(diag(D), 'descend')
    A = A(:, I)';
    y = reshape(A * (data - mx), c, h, w);
    components = cell(1,6);
    for i = 1:c
        components{1, i} = reshape(y(i, :, :), h, w);
    end
    x_hat = A(1:2, :)' * A(1:2, :) * (data - mx) + mx;
    reconstruct = cell(1,6);
    for i = 1:c
        reconstruct{1, i} = reshape(x_hat(i, :, :), h, w);
    end
end

