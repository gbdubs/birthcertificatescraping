function [ fieldNameToFieldStringMap ] = extractFormValues( imageName )
    fieldNames = getFieldNames();
    formFieldToImgMap = findAllFormFields(imread(['images/',imageName]));
    
    fieldNameToFieldStringMap = containers.Map;
    
    for fieldName = fieldNames
        fieldNameStr = cell2mat(fieldName);
        fieldNameToFieldStringMap(fieldNameStr) = ...
            doOCR(formFieldToImgMap(fieldNameStr), ...
            getCharSetForFieldName(fieldName));
    end
    
end

