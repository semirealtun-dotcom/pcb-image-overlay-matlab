clc; clear; close all;

%% Görüntüleri oku
bos = imread('boskart.png');
dolu = imread('dolukart.png');

%% Griye çevir
bosGray  = im2gray(bos);
doluGray = im2gray(dolu);

%% Kontrastı artır (ÇOK ÖNEMLİ)
bosGray  = adapthisteq(bosGray);
doluGray = adapthisteq(doluGray);

%% Özellik noktalarını bul (SURF)
pointsBos  = detectSURFFeatures(bosGray);
pointsDolu = detectSURFFeatures(doluGray);

%% En güçlü noktaları seç
pointsBos  = pointsBos.selectStrongest(500);
pointsDolu = pointsDolu.selectStrongest(500);

%% Özellikleri çıkar
[featuresBos, validBos]   = extractFeatures(bosGray, pointsBos);
[featuresDolu, validDolu] = extractFeatures(doluGray, pointsDolu);

%% Eşleşmeleri bul
indexPairs = matchFeatures(featuresBos, featuresDolu, ...
    'Unique', true, 'MaxRatio', 0.6);

matchedBos  = validBos(indexPairs(:,1));
matchedDolu = validDolu(indexPairs(:,2));

%% Affine dönüşümü hesapla
tform = estimateGeometricTransform2D( ...
    matchedDolu, matchedBos, 'affine');

%% Dolu kartı hizala
doluAligned = imwarp(dolu, tform, ...
    'OutputView', imref2d(size(bos)));

%% Overlay
overlay = 0.5*im2double(bos) + 0.5*im2double(doluAligned);

%% Sonucu göster
figure;
imshow(overlay);
title('Feature-Based Hizalanmış PCB Overlay');
Add PCB image overlay and registration code
