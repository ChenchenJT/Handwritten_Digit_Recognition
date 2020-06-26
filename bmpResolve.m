function br=bmpResolve(bw)

%图像灰度化
if ndims(bw)==3
    bw=rgb2gray(bw);
end

%图像二值化
if isa(bw,'logical')
else
    bw=im2bw(bw);
end

%图像细化
%闭运算
se=strel('disk',1);
bw=~imclose(~bw,se);
%膨胀
se=strel('disk',1);
bw=~imdilate(~bw,se);
%细化
bw=~bwmorph(~bw,'thin',Inf);

%图像归一化
%截取是入图像中的数字部分
[x,y]=find(bw==0);
xymin=min(min(x),min(y));
xymax=max(max(x),max(y));
bw=bw(min(x):max(x),min(y):max(y));

%对输入文件变尺寸处理
rate=64/max(size(bw));
bw=imresize(bw,rate);
[x,y]=size(bw);
if x~=64
    bw=[ones(ceil((64-x)/2)-1,y);bw;ones(floor((64-x)/2)+1,y)];
end;
if y~=64
    bw=[ones(64,ceil((64-y)/2)-1),bw,ones(64,floor((64-y)/2)+1)];
end

br=bw;
