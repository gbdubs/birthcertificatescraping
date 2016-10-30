function [ O ] = getCertificate( imageName , resizeRatio )
    O=imresize(maskOutBlackBackground(imread(imageName)), resizeRatio);
end

