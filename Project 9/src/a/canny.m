function [ output ] = canny( input, n, D0, TL, TH )
%CANNY edge detector
    u = (1-n)/2:(n-1)/2;
    v = (1-n)/2:(n-1)/2;
    [V, U] = meshgrid(v, u);
    D = V.^2 + U.^2;
    gaussian_filter = exp(-D./(2*(D0^2)));
    output = filter2(gaussian_filter, input);
    gx = filter2([-1 -2 -1;0 0 0;1 2 1], output);
    gy = filter2([-1 0 1;-2 0 2;-1 0 1], output);
    M = sqrt(gx .^ 2 + gy .^ 2);
    alpha = atan2(gy, gx);
    d = mod(fix((alpha + pi * 9 / 8) / pi * 4), 4);
    [h, w] = size(input);
    gN = M;
    dir_x = [1 -1 -1 1 0 0 1 -1];
    dir_y = [0 0 -1 1 1 -1 -1 1];
    for i = 1:h
        for j = 1:w
            dir = d(i, j);
            for k = 1:2
                if i + dir_x(2 * dir + k) >= 1 && i + dir_x(2 * dir + k) <= h && j + dir_y(2 * dir + k) >= 1 && j + dir_y(2 * dir + k) <= w
                    if M(i, j) < M(i + dir_x(2 * dir + k), j + dir_y(2 * dir + k))
                        gN(i, j) = 0;
                    end
                end
            end
        end
    end
    gNL = threshold(gN, TL);
    gNH = threshold(gN, TH);
    output = gNH;
    queue_x = zeros(h * w, 1);
    queue_y = zeros(h * w, 1);
    [x, y] = find(gN > TH);
    queue_x(1:size(x, 1)) = x;
    queue_y(1:size(y, 1)) = x;
    tail = size(x, 1) + 1;
    head = 1;
    while head < tail
        x = queue_x(head);
        y = queue_y(head);
        head = head + 1;
        for k = 1:8
            i = x + dir_x(k);
            j = y + dir_y(k);
            if i > 0 && i <= h && j > 0 && j <= w
                if output(i,j) == 0 && (gNH(i,j) > 0 || gNL(i,j) > 0)
                    queue_x(tail) = i;
                    queue_y(tail) = j;
                    tail = tail + 1;
                    output(i,j) = 1;
                end
            end
        end
    end
end

