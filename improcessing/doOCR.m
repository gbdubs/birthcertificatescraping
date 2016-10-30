function [ txt ] = doOCR( im , charset )
    ocrResult = ocr(wiener2(imadjust(im)), ...
        'CharacterSet', charset);
        txt = ocrResult.Text(ocrResult.CharacterConfidences < 1);
end

