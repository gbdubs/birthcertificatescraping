function [ croppedIM ] = maskOutBlackBackground( IM )
    [y, x] = size(IM);
    colorThreshold = 128;
    percentageThreshold = .4;
    mask = IM < colorThreshold;
    horizontal = sum(mask, 1) / x;
    vertical = sum(mask, 2) / y;
    horizontal = find(horizontal < percentageThreshold);
    vertical = find(vertical < percentageThreshold);
    croppedIM = IM(min(vertical):max(vertical), min(horizontal):max(horizontal));
end

