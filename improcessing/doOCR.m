function [ txt ] = doOCR( im )
    ocrResult = ocr(wiener2(imadjust(im)));
    txt = ocrResult.Text(ocrResult.CharacterConfidences < 1);
end

