function mask = createCircularMask(radius)
    maskSize = 2 * radius + 1;
    mask = false(maskSize);
    center = [radius+1, radius+1];
    
    [x, y] = meshgrid(1:maskSize, 1:maskSize);
    distance = sqrt((x - center(1)).^2 + (y - center(2)).^2);
    
    mask(distance <= radius) = true;
end
