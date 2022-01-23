pkg load image

% Prova 2
% Aluno: Enuch Santos

clear all
close all

im = imread('E:/UFRN - TADS/PDI/Provas/cores.jpg');
figure('Name', 'Original');
imshow(im);

% Filtrando formas pelas cores
for i=1 :size(im, 1)
  for j=1 :size(im, 2)
     if(im(i, j, 1) > 100 && im(i, j, 3) < 100)
      
     else
      im(i, j, :) = 255;
     endif
  endfor
endfor

figure('Name', 'filtrando formas');
imshow(im);

% Criando imagem binaria
for i=1 :size(im, 1)
  for j=1 :size(im, 2)
    if(im(i, j, 3) < 110)
      binaria(i, j) = true;
    else
      binaria(i, j) = false;
    endif
  endfor
endfor

figure('Name', 'Binaria');
imshow(binaria);

% Elemento estruturante
EE = [false true true true false
      true true true true true
      true true true true true
      true true true true true
      false true true true false];
      
dilatacao = binaria;            
      
for i=3 :size(binaria, 1)-2
  for j=3 :size(binaria, 2)-2
    if(binaria(i, j))
      vizinhos = binaria(i-2:i+2, i-2:i+2);
      vizinhos(1,1) = 0;
      vizinhos(1,5) = 0;
      vizinhos(5,1) = 0;
      vizinhos(5,5) = 0;
      if(sum(sum(vizinhos == EE))~=21) 
        dilatacao(i-2:i+2,j-2:j+2)=dilatacao(i-2:i+2,j-2:j+2)|EE;
      endif
    endif
  endfor
endfor

figure('Name', 'Imagem dilatada');
imshow(dilatacao);

figure('name', 'borda externa')
imshow(dilatacao - binaria);

borda = dilatacao - binaria;

im = im - uint8(borda) .* 255;

bordaCor = im - uint8(dilatacao);
figure('Name', 'imagem com cor e borda')
imshow(im);

