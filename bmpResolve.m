function br=bmpResolve(bw)

%ͼ��ҶȻ�
if ndims(bw)==3
    bw=rgb2gray(bw);
end

%ͼ���ֵ��
if isa(bw,'logical')
else
    bw=im2bw(bw);
end

%ͼ��ϸ��
%������
se=strel('disk',1);
bw=~imclose(~bw,se);
%����
se=strel('disk',1);
bw=~imdilate(~bw,se);
%ϸ��
bw=~bwmorph(~bw,'thin',Inf);

%ͼ���һ��
%��ȡ����ͼ���е����ֲ���
[x,y]=find(bw==0);
xymin=min(min(x),min(y));
xymax=max(max(x),max(y));
bw=bw(min(x):max(x),min(y):max(y));

%�������ļ���ߴ紦��
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
