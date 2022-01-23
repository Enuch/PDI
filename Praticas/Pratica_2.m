pkg load image

% Prática 2

clear all
close all

% 1 - Ler a imagem rgb.jpg na variável im (Imagem1), mostrando em uma janela com o título 
% “Imagem original: RGB;

im = imread('E:/UFRN - TADS/PDI/rgb.jpg');
figure('Name', 'Imagem orignal RGB');
imshow(im);

% 2 - Aplicar a segmentação por cor, gerando as imagens 2, 3 e 4;

red = im;
green = im;
yellow = im;
colorida = im;

% Vermelho
for i=1 :size(im, 1)
  for j=1 :size(im, 2)
   if(im(i, j, 1) > 50 && im(i, j, 2) < 50)
      
   else
    red(i, j, :) = 255;
   endif
  endfor
endfor

figure('Name', 'Apenas vermelho');
imshow(red);

% Verde
for i=1 :size(im, 1)
  for j=1 :size(im, 2)
   if(im(i, j, 2) > 50 && im(i, j, 1) < 50)
      
   else
    green(i, j, :) = 255;
   endif
  endfor
endfor

figure('Name', 'Apenas verde');
imshow(green);

% Amarelo
for i=1 :size(im, 1)
  for j=1 :size(im, 2)
   if(im(i, j, 2) > 50 && im(i, j, 1) > 50)
      
   else
    yellow(i, j, :) = 255;
   endif
  endfor
endfor

figure('Name', 'Apenas amarelo');
imshow(yellow);

% Elabore uma nova imagem com as cores originais modificadas (utilize cores que ainda não tenham sido utilizadas) e grave no disco

for i=1 :size(im, 1)
  for j=1 :size(im, 2)
   if(im(i, j, 2) > 50 && im(i, j, 1) > 50)
      
   else
    colorida(i, j, 3) = 255;
   endif
  endfor
endfor

figure('Name', 'colorida');
imshow(colorida);
