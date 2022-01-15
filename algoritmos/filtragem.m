clearvars
%close all

im = imread("E:/dalan.png");
im = rgb2gray(im);

figure('name', 'original')
imshow(im)

filtroLaplaciano1 = [-1 -1 -1;
                    -1  8 -1;
                    -1 -1 -1];

filtroLaplaciano2 = [1  1  1;
                     1 -8  1;
                     1  1  1];

filtroLuan = [-2  1 -2;
               1  4  1;
              -2  1 -2];
                
filtroPrewitt1 = [-1 -1  0;
                  -1  0  1;
                  0  1  1];

filtroPrewitt2 = [1  1  1;
                  0  0  0;
                 -1 -1 -1];

filtroPrewitt3 = [-1  0  1;
                  -1  0  1;
                  -1  0  1];

filtroSobel1 = [-1 -2 -1;
                0  0  0;
                1  2  1];

filtroSobel2 = [-1  0  1;
                -2  0  2;
                -1  0  1];
       
imBlur = im;
imMedian = im;
imLaplaciano1 = im;
imLaplaciano2 = im;
imPrewitt1 = im;
imPrewitt2 = im;
imPrewitt3 = im;
imSobel1 = im;
imSobel2 = im;
imLuan = im;

for i=2:size(im,1)-1
    for j=2:size(im,2)-1
        viz = im(i-1:i+1, j-1:j+1);
        
        %Filtro passa-baixa linear (média)
        imBlur(i,j) = uint8(sum(sum(viz))/9);

        %Filtro passa-baixa não-linear (mediana)
        imMedian(i,j) = median(median(viz));
        
        imLaplaciano1(i,j) = sum(sum(double(viz).*filtroLaplaciano1));
        imLaplaciano2(i,j) = sum(sum(double(viz).*filtroLaplaciano2));
        imPrewitt1(i,j) = sum(sum(double(viz).*filtroPrewitt1));
        imPrewitt2(i,j) = sum(sum(double(viz).*filtroPrewitt2));
        imPrewitt3(i,j) = sum(sum(double(viz).*filtroPrewitt3));
        imSobel1(i,j) = sum(sum(double(viz).*filtroSobel1));
        imSobel2(i,j) = sum(sum(double(viz).*filtroSobel2));
        imLuan(i,j) = sum(sum(double(viz).*filtroLuan));
    end
end

figure('name', 'Filtro passa-baixa linear')
imshow(imBlur)

figure('name', 'Filtro passa-baixa não-linear')
imshow(imMedian)


figure('name', 'imLaplaciano1')
imshow(imLaplaciano1)

figure('name', 'imLaplaciano2')
imshow(imLaplaciano2)

figure('name', 'imPrewitt1')
imshow(imPrewitt1)

figure('name', 'imPrewitt2')
imshow(imPrewitt2)

figure('name', 'imPrewitt3')
imshow(imPrewitt3)

figure('name', 'imSobel1')
imshow(imSobel1)

figure('name', 'imSobel2')
imshow(imSobel2)

figure('name', 'imLuan')
imshow(imLuan)