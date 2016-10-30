function [ blankCertPoints ] = getBlankCertFieldMap( )
    if exist('blankCertPoints.mat', 'file')
        load('blankCertPoints.mat', 'blankCertPoints');
    else
        blankCertPoints = containers.Map;
    end
    fieldNames = getFieldNames();
    resizeRatio = getResizeRatio();
    blankCert = imresize(getBlankCert(), resizeRatio);
    imshow(blankCert);
    for fieldName = fieldNames
        fieldNameStr = cell2mat(fieldName);
        if ~isKey(blankCertPoints, fieldNameStr)
            disp(['NOW GETTING ', fieldNameStr]);
            blankCertPoints(fieldNameStr) = ginput(4);
        else
            disp(['LOADED ', fieldNameStr]);
        end 
    end
    save('blankCertPoints.mat', 'blankCertPoints');
    close all;
end