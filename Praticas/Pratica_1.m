pkg load image

% Prática 1

close all
clear all

% 1 - Criar imagem vazia

im = zeros(100, 256);
im = uint8(im);

figure(1);
imshow(im);

% 2 - Percorrer a imagem gerando um degradê de 256 tons de cinza (Imagem 1)

for i=1:size(im, 1)
  for j=1:size(im, 2)
    im(:, j) = j;
  endfor
endfor

% Forma mais simples de se fazer

for j=1:size(im, 2)
    im(:, j) = j;
endfor

% 3 - Abrir uma nova janela e mostrar a imagem em degradê

figure(2);
imshow(im);

% 4 - Ler a imagem Lena,jpg na variável im (Imagem 2)

lena = imread('E:/UFRN - TADS/PDI/Lena.jpg');

% 5 - Transformar a imagem Lena para tons de cinza criando uma nova imagem LenaGray (Imagem 3)

r = lena(:, :, 1) * 0.3;
g = lena(:, :, 2) * 0.59;
b = lena(:, :, 3) * 0.11;

lenaGray = r + g + b;

figure(3);
imshow(lenaGray);

% Função do octave para fazer o mesmo algoritmo acima: lenaGray = rgb2gray(lena);

% 6 - Criar e mostrar a imagem lenaDegrade inferindo em lena um degradê 
% de tal forma que a imagem varie do escuro para o claro (Imagem 4)

lenaDegrade = lenaGray;
for i=1 :512
    lenaDegrade(:, i) = lenaDegrade(:, i) + (-255 + i);
endfor

imwrite(lenaDegrade, 'E:/UFRN - TADS/PDI/Praticas/lenaDegrade.jpg')
figure(4);
imshow(lenaDegrade);

% 7 - Aumentar o valor de cada pixel da imagem lenaGray em 40% gerando uma saida2 (Imagem 5) e diminuir
% o valor de cada pixel de im2 em 40% gerando a imagem de saida3 utilizando ambas as operações:  o laço de repetição for

t = tic

lenaGrayLight = lenaGray;
lenaGrayDark = lenaGray;

% Aumentando brilho
for i=1 :size(lenaGray, 1)
  for j=1 :size(lenaGray, 2)
    lenaGrayLight(i, j) = (lenaGrayLight(i, j) * 0.40) + lenaGrayLight(i, j);
  endfor
endfor
% Abaixando brilho
for i=1 :size(lenaGray, 1)
  for j=1 :size(lenaGray, 2)
    lenaGrayDark(i, j) = lenaGrayDark(i, j) * 0.40;
  endfor
endfor

toc(t);

figure(5);
imshow(lenaGrayLight);

figure(6);
imshow(lenaGrayDark);

% 8 -  Executar novamente o passo anterior substituindo os laços utilizados por atribuições diretas

t = tic; % Começa contagem de tempo do códgio a partir daqui

lenaGrayDark1 = lenaGray(:, :) * 0.40; % Mesma função do algoritmo da questão 7 usando atribuição direta
lenaGrayLight1 = (lenaGray(:, :) * 0.40) + lenaGray(:, :);

toc(t); % Termina contagem e printa na tela 

figure(7);
imshow(lenaGrayLight1);

figure(8);
imshow(lenaGrayDark1);

 
