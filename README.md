# PCB Image Overlay using MATLAB

Bu projede boş ve dolu PCB kartlarının MATLAB ortamında
özellik tabanlı (SURF) görüntü hizalama yöntemiyle
üst üste bindirilmesi gerçekleştirilmiştir.

## Kullanılan Yöntem
- Feature-based image registration (SURF)
- Affine dönüşüm
- Alpha blending ile overlay

## Dosyalar
- pcb_overlay.m : MATLAB kodu
- boskart.png   : Boş PCB görüntüsü
- dolukart.png  : Dolu PCB görüntüsü

## Çalıştırma
MATLAB klasörüne tüm dosyaları ekleyip:
```matlab
pcb_overlay
