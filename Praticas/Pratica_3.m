pkg load image

% Prática 3
clear all
close all

% 1 - Ler a imagem soja.jpg na variável im (Imagem1) e mostrar em uma janela com o título “Imagem original: soja”;
soja = imread('E:/UFRN - TADS/PDI/soja.jpg');
figure('Name', 'Imagem original: soja');
imshow(soja);

% 2 - Converter a imagem im para tons de cinza (Imagem2) e mostrar seu histograma (imagem3);
% Convertendo imagem da soja para tons de cinza
soja_gray = rgb2gray(soja);
figure('Name', 'Imagem cinza: soja');
imshow(soja_gray);

% Mostrando histograma da imagem soja
figure('Name', 'Histograma');
imhist(soja_gray);

% 3 - Realizar a limiarização da imagem soja a partir do corte do histograma (Imagem4). Verifique, observando o histograma,
% qual seria o melhor valor para utilizar como corte (limiar) e faça a limiarização utilizando este valor (fixo)

% Limiarização da imagem soja em tons de cinza
for i=1 :size(soja_gray, 1)
  for j=1 :size(soja_gray, 2)
    if (soja_gray(i, j, 1) > 50)
      soja_limiar(i, j) = false;
    else
      soja_limiar(i, j) = true;
    endif
  endfor
endfor

figure('Name', 'Soja limiar');
imshow(soja_limiar);

% 4 - Segmente a imagem original (Imagem1) utilizando a imagem limiarizada (Imagem4) como máscara, gerando a imagem final (Imagem5). Mostre a imagem final.
soja_segmentada = soja;

% Segmentação da imagem da soja
for i=1 :size(soja, 1)
  for j=1 :size(soja, 2)
    if (soja_limiar(i, j) == true)
      soja_segmentada(i, j, :) = 255;
    endif
  endfor
endfor

figure('Name', 'soja segmentada');
imshow(soja_segmentada);

% 5 - Ler a imagem objetos1.jpg na variável im2 (Imagem6) e mostrar em uma janela com o título “Imagem original: objetos PB”;
objetos = imread('E:/UFRN - TADS/PDI/objetos1.jpg');
figure('Name', 'Imagem original: objetos');
imshow(objetos);

% 6 - Transformar a imagem original (im2) em uma imagem binária (imBW), considerando 1-branco e 0-preto (não utilizar a função im2bw do Octave)
for i=1 :size(objetos, 1)
  for j=1 :size(objetos, 2)
    if (objetos(i, j) > 126)
      objetos_binaria(i, j) = 1;
    else
      objetos_binaria(i, j) = 0;
    endif
  endfor
endfor

figure('Name', 'objetos binarizada');
imshow(objetos_binaria);

% 7 - Mostrar, em intensidades de cinza diferentes, os objetos individuais da imagem conforme Imagem3. Para este passo, observe as informações a seguir:
objetos_2 = objetos;
rot = 1;
for i=2 :size(objetos_binaria, 1)
  for j=2 :size(objetos_binaria, 2)
    if (objetos_binaria(i, j) == 0)
    
    elseif (objetos_binaria(i, j) == 1)
      if (objetos_binaria(i-1, j) == 0 && objetos_binaria(i, j-1) == 0)
        rot = rot + rot;
        objetos_2(i, j) = rot;
      elseif ((objetos_binaria(i-1, j) == 1 && objetos_binaria(i, j-1) == 0) | objetos_binaria(i-1, j) == 0 && objetos_binaria(i, j-1) == 1)
        if(objetos_binaria(i-1, j) == 1 && objetos_binaria(i, j-1) == 0)
          objetos_2(i, j) = objetos_binaria(i-1, j);
        elseif(objetos_binaria(i-1, j) == 0 && objetos_binaria(i, j-1) == 1)
          objetos_2(i, j) = objetos_binaria(i, j-1);
        endif
      elseif ((objetos_binaria(i-1, j) == 1 && objetos_binaria(i, j-1) == 1) && (objetos_2(i-1, j) == objetos_2(i, j-1)))
        objetos_2(i, j) = objetos_binaria(i-1, j);
      elseif (objetos_binaria(i-1, j) == 1 && objetos_binaria(i, j-1) == 1 && (objetos_2(i-1, j) ~= objetos_2(i, j-1)))
        objetos_2(i, j) = objetos_binaria(i-1, j);
      endif
    endif
  endfor
endfor

figure('Name', 'imagem rotulado');
imshow(objetos_2);
