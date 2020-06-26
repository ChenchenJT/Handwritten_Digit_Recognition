function [Feature,bwp]=getFeature(A) %获取图像A的特征，16维
A=ones(64,64)-A;
[x,y]=find(A==1);
xymin=min(min(x),min(y));
xymax=max(max(x),max(y));
A=A(min(x):max(x),min(y):max(y));  %截取是入图像中的数字部分
        
rate=64/max(size(A));
A=imresize(A,rate);  %对输入文件变尺寸处理
[x,y]=size(A);
if x~=64
    A=[zeros(ceil((64-x)/2)-1,y);A;zeros(floor((64-x)/2)+1,y)];
end
if y~=64
    A=[zeros(64,ceil((64-y)/2)-1),A,zeros(64,floor((64-y)/2)+1)];
end

%竖直1/2交点数
Vc=32;
VcNum=0;
for i=1:64
    VcNum=VcNum+A(i,Vc);
end
F(1)=VcNum;

%竖直1/4处
VcNum=0;
Vc=16;
for i=1:64
    VcNum=VcNum+A(i,Vc);
end
F(2)=VcNum;

%竖直3/4处
Vc=48;
VcNum=0;
for i=1:64
    VcNum=VcNum+A(i,Vc);
end
F(3)=VcNum;

%水平1/2交点数
Hc=32;
HcNum=0;
for i=1:64
    HcNum=HcNum+A(Hc,i);
end
F(4)=HcNum;

%水平1/4处交点数
Hc=16;
HcNum=0;
for i=1:64
    HcNum=HcNum+A(Hc,i);
end
F(5)=HcNum;

%水平3/4处交点数
Hc=48;
HcNum=0;
for i=1:64
    HcNum=HcNum+A(Hc,i);
end
F(6)=HcNum;

%0度交点数
x3=32;
sum3=0;
for i=0:32
    sum3=sum3+A(x3,x3+i);
end
F(7)=sum3;

%45度交点数
x4=1;
y4=64;
sum4=0;
for i=0:32
    sum4=sum4+A(x4+i,y4-i);
end
F(8)=sum4;

%90度交点数
sum4=0;
for i=1:32
    sum4=sum4+A(i,32);
end
F(9)=sum4;

%135度交点数
x1=1;
y1=1;
sum4=0;
for i=0:31
    sum4=sum4+A(x1+i,y1+i);
end
F(10)=sum4;

%180度交点数
x1=1;
sum4=0;
for i=0:31
    sum4=sum4+A(32,x1+i);
end
F(11)=sum4;

%225度交点数
x1=64;
y1=1;
sum4=0;
for i=0:32
    sum4=sum4+A(x1-i,y1+i);
end
F(12)=sum4;

%270度交点数
x1=32;
sum4=0;
for i=0:32
    sum4=sum4+A(x1+i,x1);
end
F(13)=sum4;

%270度交点数
y1=64;
x1=64;
sum4=0;
for i=0:32
    sum4=sum4+A(x1-i,y1-i);
end
F(14)=sum4;

%1/16点总数
sum4=0;
for i=1:16
    for j=1:16
        sum4=sum4+A(i,j);
    end
end
F(15)=sum4;

%2/16点总数
sum4=0;
for i=1:16
    for j=17:32
        sum4=sum4+A(i,j);
    end
end
F(16)=sum4;

%3/16点总数
sum4=0;
for i=1:16
    for j=33:48
        sum4=sum4+A(i,j);
    end
end
F(17)=sum4;

%4/16点总数
sum4=0;
for i=1:16
    for j=49:64
        sum4=sum4+A(i,j);
    end
end
F(18)=sum4;

%5/16点总数
sum4=0;
for i=17:32
    for j=1:16
        sum4=sum4+A(i,j);
    end
end
F(19)=sum4;

%6/16点总数
sum4=0;
for i=17:32
    for j=17:32
        sum4=sum4+A(i,j);
    end
end
F(20)=sum4;

%7/16点总数
sum4=0;
for i=17:32
    for j=33:48
        sum4=sum4+A(i,j);
    end
end
F(21)=sum4;

%8/16点总数
sum4=0;
for i=17:32
    for j=49:64
        sum4=sum4+A(i,j);
    end
end
F(22)=sum4;

%9/16点总数
sum4=0;
for i=33:48
    for j=1:16
        sum4=sum4+A(i,j);
    end
end
F(23)=sum4;

%10/16点总数
sum4=0;
for i=33:48
    for j=17:32
        sum4=sum4+A(i,j);
    end
end
F(24)=sum4;

%11/16点总数
sum4=0;
for i=33:48
    for j=33:48
        sum4=sum4+A(i,j);
    end
end
F(25)=sum4;

%12/16点总数
sum4=0;
for i=33:48
    for j=49:64
        sum4=sum4+A(i,j);
    end
end
F(26)=sum4;

%13/16点总数
sum4=0;
for i=49:64
    for j=1:16
        sum4=sum4+A(i,j);
    end
end
F(27)=sum4;

%14/16点总数
sum4=0;
for i=49:64
    for j=17:32
        sum4=sum4+A(i,j);
    end
end
F(28)=sum4;

%15/16点总数
sum4=0;
for i=49:64
    for j=33:48
        sum4=sum4+A(i,j);
    end
end
F(29)=sum4;

%16/16点总数
sum4=0;
for i=49:64
    for j=49:64
        sum4=sum4+A(i,j);
    end
end
F(30)=sum4;

%竖直1/4点总数
sum4=0;
for i=1:64
    for j=1:16
        sum4=sum4+A(i,j);
    end
end
F(31)=sum4;

%竖直2/4点总数
sum4=0;
for i=1:64
    for j=17:32
        sum4=sum4+A(i,j);
    end
end
F(32)=sum4;

%竖直3/4点总数
sum4=0;
for i=1:64
    for j=33:48
        sum4=sum4+A(i,j);
    end
end
F(33)=sum4;

%竖直4/4点总数
sum4=0;
for i=1:64
    for j=49:64
        sum4=sum4+A(i,j);
    end
end
F(34)=sum4;

%水平1/4点总数
sum4=0;
for i=1:16
    for j=1:64
        sum4=sum4+A(i,j);
    end
end
F(35)=sum4;

%水平2/4点总数
sum4=0;
for i=17:32
    for j=1:64
        sum4=sum4+A(i,j);
    end
end
F(36)=sum4;

%水平3/4点总数
sum4=0;
for i=33:48
    for j=1:64
        sum4=sum4+A(i,j);
    end
end
F(37)=sum4;

%水平3/4点总数
sum4=0;
for i=49:64
    for j=1:64
        sum4=sum4+A(i,j);
    end
end
F(38)=sum4;

Feature=F';
bwp=A;
