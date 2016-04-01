fixed = imread('testset/f.jpg');
moving = imread('testset/k.jpg');

tformEstimate = imregcorr(moving,fixed);

Rfixed = imref2d(size(fixed));
movingReg = imwarp(moving,tformEstimate,'OutputView',Rfixed);

figure, imshowpair(fixed,movingReg,'falsecolor');