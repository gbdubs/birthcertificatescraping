certificate = maskOutBlackBackground(imread('samples/1.jpg'));
certificate = imresize(certificate, .5);
blankTemplateCertificate = maskOutBlackBackground(imread('blank-cert.jpg'));
blankTemplateCertificate = imresize(blankTemplateCertificate, .5);

tformEstimate = imregcorr(blankTemplateCertificate,certificate);

Rfixed = imref2d(size(certificate));
movingReg = imwarp(blankTemplateCertificate,tformEstimate,'FillValues', 255, 'OutputView',Rfixed);

figure, imshowpair(certificate,movingReg,'falsecolor');