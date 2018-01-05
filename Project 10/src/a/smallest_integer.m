function [ output ] = smallest_integer( input )
%SMALLEST_INTEGER 
%   used for chain code
    l = size(input, 1);
    cnt = zeros(l, 1);
    if input(l) == 0
        cnt(l) = 1;
        for i = 1:l-1
            if input(i) == 0
                cnt(l) = cnt(l) + 1
            else
                break;
            end
        end
    end
    for i = l-1:-1:1
        if input(i) == 0
            cnt(i) = min(cnt(i + 1) + 1, l);
        end
    end
    pos = min(find(cnt == max(cnt)));
    output = [input(pos:l, 1); input(1:pos-1, 1)];
end

