phantSize = 501;

I = phantom(phantSize);


figure(1);
imshow(I,[]);

theta = 0:1:359;

R = radon(I,theta);
tic
iRad = iradon(R,theta,'ram-lak','linear');
toc
P = zeros(size(R));

dims = size(R);

for i=1:dims(2)
    projectValues = R(:,i);
    projectValues = projectValues';
    
    filteredProjectionValues = filterProjectionValues(projectValues, 'ram-lak', true, 0.01);
    
    P(:,i) = filteredProjectionValues';
end

figure(2);
imshow(P,[],'InitialMagnification','fit');

recon = zeros(phantSize);

K = length(theta);

projLength = dims(1);
iShift = floor(projLength/2);

figure(3);
tic

display = false;

for k = 1:K
    ang = theta(k);
    projValues = P(:,k)';
        
    d = (-phantSize/2 + 0.5):1:(phantSize/2 - 0.5);
    
    [x,y] = meshgrid(d,d);
    
    t = x.*cosd(ang) + y.*sind(ang);
        
    i = projLength/2 + t;
    iLow = floor(projLength/2 + t);
    iHigh = ceil(projLength/2 + t);
    
    iX = floor(x+(phantSize/2))+1;
    iY = floor(y+(phantSize/2))+1;
    
    validCoord = ...
        iLow < projLength & iHigh < projLength &...
        iLow > 0 & iHigh > 0 & iX > 0 &...
        iX <= phantSize & iY > 0 & iY <= phantSize;
    
    iLow(~validCoord) = 1;
    iHigh(~validCoord) = 1;
    iX(~validCoord) = 1;
    iY(~validCoord) = 1;
    
    lowHighEq = iLow == iHigh;
    
    dims = size(validCoord);
    len = dims(1)*dims(2);
    
    lowVals = reshape(projValues(reshape(iLow,1,len)),dims(1),dims(2));
    highVals = reshape(projValues(reshape(iHigh,1,len)),dims(1),dims(2));
    yVals = reshape(projValues(reshape(iX,1,len)),dims(1),dims(2));
    xVals = reshape(projValues(reshape(iY,1,len)),dims(1),dims(2));
    
    % get vals not requiring interpolation
    eqVals = iHigh == iLow;
    
    reconTemp1 = recon + ((validCoord & eqVals) .* lowVals);
        
    % get vals requiring interpolation
    riseVals = highVals - lowVals;
    runVals = iHigh - iLow;
    
    reconTemp2 = recon + (~eqVals & validCoord) .* (lowVals + (i - iLow).*(riseVals./runVals));
    
    recon(validCoord & eqVals) = reconTemp1(validCoord & eqVals);
    recon(validCoord & ~eqVals) = reconTemp2(validCoord & ~eqVals);
    
    if display
        imshow(recon,[],'InitialMagnification','fit');
        drawnow;
    end
end

toc
recon = recon .* (pi/K);

imshow(recon,[],'InitialMagnification','fit');

figure(4);
imshow(recon-flipud(I),[],'InitialMagnification','fit');

% figure(5);
% imshow(recon-flipud(iRad),[],'InitialMagnification','fit');