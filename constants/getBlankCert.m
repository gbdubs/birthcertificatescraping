function [ result ] = getBlankCert( )
    global BlankCertificate;
    if numel(BlankCertificate) < 1000
        BlankCertificate = maskOutBlackBackground(...
            imread('constants/blank-cert.jpg'));
    end
    result = BlankCertificate;
end

