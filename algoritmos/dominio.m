clearvars
close all

im = imread("E:/nucleos.png");
im = im(:,:,2);

figure('name', 'original')
imshow(im)

%Limiarização
bin = im > 60;
figure('name', 'limiarização')
imshow(bin)

%Negativo
neg = 255-im;
figure('name', 'negativo')
imshow(neg)

%Potência
pot = double(im).^1.2;
figure('name', 'potencia')
imshow(uint8(pot))

%Fatiamento por nivel de intensidade
r = im;
g = im;
b = im;

r(im <= 30) = r(im <= 30)+100;
g(im > 30 & im < 100) = r(im > 30 & im < 100)+100;
b(im >= 100) = r(im >= 100)+100;

niv = r;
niv(:,:,2) = g;
niv(:,:,3) = b;

figure('name', 'Nivel de intensidade')
imshow(niv)


%Fatiamento bit a bit
for i=1:size(im,1)
    for j=1:size(im,2)
        byte = dec2bin(im(i,j),8);
        for c=1:8
            fatiamento(i,j,c) = byte(c) == '1';
        end
    end
end

figure('Name','Fatiamento');
for c=1:8
    subplot(2, 4, c)
    imshow(fatiamento(:,:,c))
end
