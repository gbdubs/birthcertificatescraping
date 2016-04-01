fixed = imread('testset/d.jpg');
moving = imread('testset/k.jpg');

tformEstimate = imregcorr(moving,fixed);

Rfixed = imref2d(size(fixed));
movingReg = imwarp(moving,tformEstimate,'OutputView',Rfixed);
figure, imshowpair(fixed,movingReg,'montage');

figure, imshowpair(fixed,movingReg,'falsecolor');