clearvars
close all

im = rgb2gray(imread("E:/objetos.png"));
im = im < 120;

figure('name', 'original')
imshow(im)

imErodida = im;
imErodida(:,:) = false;

imDilatada = im;

EE = [true true true;
      true true true;
      true true true];

%Erosão e dilatação
for i=2:size(im,1)-1
    for j=2:size(im,2)-1
        if(im(i,j))
            viz = im(i-1:i+1, j-1:j+1);
            if(sum(sum(EE == viz)) == 9) %São iguais
                imErodida(i,j) = true;
            else %São diferentes
               	imDilatada(i-1:i+1, j-1:j+1) = EE;
            end
        end
    end    
end

figure('name', 'erodida')
imshow(imErodida)

figure('name', 'dilatada')
imshow(imDilatada)

%Detecção de bordas
figure('name', 'borda interna')
imshow(im - imErodida)

figure('name', 'borda externa')
imshow(imDilatada - im)

%Abertura e fechamento

