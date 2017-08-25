function [] = openOptCtVistaRecon()
% [] = openOptCtVistaRecon()

%path = 'C:\Users\MPRadmin\Git Repos\OptCT Data\FSRT1_singlespot\FSRT1_HR.vff';
path = 'C:\Users\MPRadmin\Git Repos\OptCT Data\Brachy_with_cath\BTmicelledcatheterelectron_HR.vff';

dataSize = [256 256 256];

fid = fopen(path, 'r');
data = fread(fid, inf, '*uint8');
fclose(fid);

offset = size(data,1) - prod(dataSize) * 4 + 1;

imgData = data(offset:end);
imgData = typecast(imgData, 'single');
imgData = swapbytes(imgData);
imgData = reshape(imgData, dataSize);

figure(30);

for i=1:dataSize(3)
    imshow(imgData(:,:,i),[],'InitialMagnification','fit');
    
    pause(0.05);
end


end

