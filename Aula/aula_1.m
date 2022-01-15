pkg load image

% Aula 1

close all
clear all

im = zeros(10, 10); % Cria matriz de 10x10
im = uint8(im); % converter para uint8, formato de img lido pelo octave (profundidade de intensidades de cinzas)

im(:, 1) = 100; % Alterando valor de todas as linhas na coluna 1
im(:, 10) = 100; % Alterando valor de todas as linhas na coluna 10
im(1, :) = 100; % Alterando valor de todas as colunas na linha 1
im(10, :) = 100; % Alterando valor de todas as colunas na linha 10

for i=1:size(im, 1) % Percorre de 1 até a quantidade de linhas da img
  for j=1:size(im, 2) % Percorre de 1 até a quantidade de colunas da img
    if(im(i, j) > 90)
      im(i, j) = 200;
    endif
  endfor
endfor

figure(1); % Criar uma tela para abrir uma imagem
imshow(im); % Mostra a imagem na tela criada


