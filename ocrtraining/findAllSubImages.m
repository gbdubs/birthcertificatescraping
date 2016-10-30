allSubImages = cell(1, 17 * numel(getFieldNames()));
index = 1;
for i = 1 : 17
    map = findAllFormFields(imread(['images/',num2str(i),'.jpg']));
    for fieldName = getFieldNames()
        fieldNameStr = cell2mat(fieldName);
        allSubImages(index) = {map(fieldNameStr)};
        imwrite(cell2mat(allSubImages(index)), ...
            ['ocrtraining/data/',num2str(i),fieldNameStr,'.jpg']);
        index = index + 1;
    end
   
end