function FFT(g)

% load image
%g = imread('Capture3.png');
g = imresize(g, [300 300]); 
g = rgb2gray(g);
%tampilkan image asal
figure
subplot(2,4,1)%1
imshow(g)
title('1');

%lakukan fft & shift hasilnya
fft_g = fft2(g);
fs = fftshift(fft_g);

%tampilkan image hasil fft
subplot(2,4,2) %2
imshow(log(abs(fft_g)),[])
title('2');

%kembalikan hasilnya ke image asal
balik = ifft2(fft_g);
subplot(2,4,3) %3
imshow(uint8(balik))
title('3');

% -----------------------------------
%coba lihat apa yang terjadi jika hasil fft dimodifikasi

fs1 = fs;
fs1(150:250,150:250) = 0;
%tampilkan image hasil fft
subplot(2,4,4) %4
imshow(log(abs(fs1)),[])
title('4');

%kembalikan hasilnya ke image asal
balik = ifft2(ifftshift(fs1));
subplot(2,4,5) %5
imshow(uint8(balik))
title('5');

mask = zeros(size(g));
mask(150:250,150:250) = 1;

hasil = mask.*fs;
%tampilkan image hasil fft
subplot(2,4,6) %6
imshow(log(abs(hasil)),[])
title('6');

%kembalikan hasilnya ke image asal
balik = ifft2(ifftshift(hasil));
subplot(2,4,7) %7
imshow(uint8(balik))
title('7');