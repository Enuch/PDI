pkg load image

% Aula 2

clear all
close all

cruz = uint8(zeros(20, 20)); % Criando imagem preta

% Fazendo uma coluna cinza na imagem
for i=1 :size(cruz, 1) 
  for j=6 :15
    cruz(:, j) = 200;
  endfor
endfor
% Fazendo uma linha cinza na imagem
for i=1 :size(cruz, 1)
  for j=6 :15
    cruz(j, :) = 200;
  endfor
endfor

figure('Name', "Cruz"); % Coloca nome para a tela da imagem
imshow(cruz);

cruzColor(:, :, 1) = cruz; % Canal RED
cruzColor(:, :, 2) = cruz; % Canal GREEN
cruzColor(:, :, 3) = cruz; % Canal BLUE

% Pintando quadrado de cima a direita de vermelho
for i=1 :5
  for j=16 : 20
    cruzColor(i, j, 1) = 255;
  endfor
endfor

figure('Name', 'Cruz colorida');
imshow(cruzColor);