bw=imread('C:\Users\Chen\Desktop\������.bmp');
%ͼ��ҶȻ�
if ndims(bw)==3
    bw=rgb2gray(bw);
end

%ͼ���ֵ��
if isa(bw,'logical')
else
    bw=im2bw(bw);
end

bw=bwmorph(bw,'majority',Inf);

imwrite(bw,'C:\Users\Chen\Desktop\������2.bmp');