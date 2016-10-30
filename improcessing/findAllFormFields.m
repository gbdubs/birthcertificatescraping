function [ formFieldToImgMap ] = findAllFormFields( cert )
    blankCert = getBlankCert();
    fieldNames = getFieldNames();
    resizeRatio = getResizeRatio();
    blankCertPoints = getBlankCertFieldMap();
    
    fullCert = maskOutBlackBackground(cert);

    formFieldToImgMap = containers.Map;

    cert = imresize(fullCert, resizeRatio);
    blankCert = imresize(blankCert, resizeRatio);
    xForm = imregcorr(blankCert, cert);
    
    movingReg = imwarp(blankCert,xForm,'FillValues', 255, 'OutputView',imref2d(size(cert)));

    figure, imshowpair(cert,movingReg,'falsecolor');
    
    for fieldName = fieldNames
        fieldNameStr = cell2mat(fieldName);
        boundingPts = blankCertPoints(fieldNameStr);
        xFormedBPts = xForm.transformPointsForward(boundingPts);
        mask = poly2mask(...
            xFormedBPts(:, 1), xFormedBPts(:, 2), ...
            size(cert,1), size(cert,2));
        mask = imresize(mask, 1 / resizeRatio);
        xRange = sum(mask, 2) > 0;
        yRange = sum(mask, 1) > 0;
        mask = mask(xRange, yRange);
        maskedCert = fullCert(xRange, yRange);
        modePixelValue = mode(mode(maskedCert));
        maskedCert(mask == 0) = modePixelValue;
        formFieldToImgMap(fieldNameStr) = maskedCert;
    end
end

