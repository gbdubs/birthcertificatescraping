function [ charset ] = getCharSetForFieldName( fieldName )
    numbers = '0123456789';
    lowercase = 'abcdefghijklmnopqrstuvwxyz';
    uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    letters = [lowercase, uppercase, ' '];
    puctuation = '.,';

    charset = [letters, numbers, puctuation];
end

