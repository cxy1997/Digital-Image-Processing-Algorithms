function [ c1, c2, c3, integrated ] = dwt_3level( input, h_phi )
%DWT_3LEVEL generates a 3-level wavelet transform display
    [ca1, chd1, cvd1, cdd1]=dwt_2(input, h_phi);
    [ca2, chd2, cvd2, cdd2]=dwt_2(ca1, h_phi);
    [ca3, chd3, cvd3, cdd3]=dwt_2(ca2, h_phi);
	[height, width] = size(ca3);
    integrated = zeros(size(ca3) * 8);
        
    integrated(1:height, 1:width) = ca3;
    integrated(1:height, (width+1):(2*width)) = chd3;
    integrated((height+1):(2*height), 1:width) = cvd3;
    integrated((height+1):(2*height), (width+1):(2*width)) = cdd3;
    
    height = height * 2;
    width = width * 2;
    integrated(1:size(ca2, 1), (width+1):(width+size(ca2, 2))) = chd2;
    integrated((height+1):(height+size(ca2, 1)), 1:size(ca2, 2)) = cvd2;
    integrated((height+1):(height+size(ca2, 1)), (width+1):(width+size(ca2, 2))) = cdd2;
    
    height = height * 2;
    width = width * 2;
    integrated(1:size(ca1, 1), (width+1):(width+size(ca1, 2))) = chd1;
    integrated((height+1):(height+size(ca1, 1)), 1:size(ca1, 2)) = cvd1;
    integrated((height+1):(height+size(ca1, 1)), (width+1):(width+size(ca1, 2))) = cdd1;
        
	[height, width] = size(ca1);
    c1 = zeros(size(ca1) * 2);
    c1(1:height, 1:width) = ca1;
    c1(1:height, (width+1):(2*width)) = chd1;
    c1((height+1):(2*height), 1:width) = cvd1;
    c1((height+1):(2*height), (width+1):(2*width)) = cdd1;
        
	[height, width] = size(ca2);
    c2 = zeros(size(ca2) * 2);
    c2(1:height, 1:width) = ca2;
    c2(1:height, (width+1):(2*width)) = chd2;
    c2((height+1):(2*height), 1:width) = cvd2;
    c2((height+1):(2*height), (width+1):(2*width)) = cdd2;
        
	[height, width] = size(ca3);
    c3 = zeros(size(ca3) * 2);
    c3(1:height, 1:width) = ca3;
    c3(1:height, (width+1):(2*width)) = chd3;
    c3((height+1):(2*height), 1:width) = cvd3;
    c3((height+1):(2*height), (width+1):(2*width)) = cdd3;
    
    
    c1(abs(c1)<0.01) = 0;
    c2(abs(c2)<0.01) = 0;
    c3(abs(c3)<0.01) = 0;
    integrated(abs(integrated)<0.01) = 0;
end

