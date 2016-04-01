function [ tformation ] = findImageTransformation( I, template )

    tformation = imregcorr(template, I);

end

