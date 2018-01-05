function [ output ] = idwt_3level( c1, c2, c3, h_phi )
%IDWT_3LEVEL recovers the image from a 3-level wavelet transform display
	[height, width] = size(c3);
    height = fix(height / 2);
    width = fix(width / 2);
    res = idwt_2(c3(1:height, 1:width), c3(1:height, (width+1):(2*width)), c3((height+1):(2*height), 1:width), c3((height+1):(2*height), (width+1):(2*width)), h_phi, mod(size(c2, 1) / 2 + 1, 2) + 1, mod(size(c2, 2) / 2 + 1, 2) + 1);
	
    [height, width] = size(c2);
    height = fix(height / 2);
    width = fix(width / 2);
    c2(1:height, 1:width) = res;
    res = idwt_2(c2(1:height, 1:width), c2(1:height, (width+1):(2*width)), c2((height+1):(2*height), 1:width), c2((height+1):(2*height), (width+1):(2*width)), h_phi, mod(size(c1, 1) / 2 + 1, 2) + 1, mod(size(c1, 2) / 2 + 1, 2) + 1);
	
    [height, width] = size(c1);
    height = fix(height / 2);
    width = fix(width / 2);
    c1(1:height, 1:width) = res;
    res = idwt_2(c1(1:height, 1:width), c1(1:height, (width+1):(2*width)), c1((height+1):(2*height), 1:width), c1((height+1):(2*height), (width+1):(2*width)), h_phi, 2, 2);
	
    output = res;
end

