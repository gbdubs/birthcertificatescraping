function [ data ] = findTextAreaOCR( I, tformation, mask )
    I = I + 1;
    mask = uint8(mask);
    transformedMask = imwarp(mask, tformation, 'OutputView', imref2d(size(I)));
    data = I .* transformedMask;
    data = floor((data - min(data(:))) * (255 / range(data(:))));
    data( ~any(data,2), : ) = [];  %rows
    data( :, ~any(data,1) ) = [];  %columns
    
    data( data == 0 ) = 255;
    
    data = imsharpen(data);
    
    imshow(data);
    
    
    
end

