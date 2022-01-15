im = imread("E:/degrade.jpg");
figure('name', 'original');
imshow(im);

im = double(im);

c = 1;
imLog = im2uint8(mat2gray(c*log(1+double(im))));

figure('name', 'log');
imshow(imLog);