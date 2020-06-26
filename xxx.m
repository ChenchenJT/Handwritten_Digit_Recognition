bw=imread('C:\Users\Chen\Desktop\¹ùµ¤ÒÇ.bmp');
%Í¼Ïñ»Ò¶È»¯
if ndims(bw)==3
    bw=rgb2gray(bw);
end

%Í¼Ïñ¶þÖµ»¯
if isa(bw,'logical')
else
    bw=im2bw(bw);
end

bw=bwmorph(bw,'majority',Inf);

imwrite(bw,'C:\Users\Chen\Desktop\¹ùµ¤ÒÇ2.bmp');