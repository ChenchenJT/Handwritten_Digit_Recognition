load('mnist_all.mat');
type = 'train';
savePath = 'D:\ChenchenJT\matlab_numberRecognition\nums\';
for num = 0:1:9
    numStr = num2str(num);
    tempNumPath = strcat(savePath, numStr);
    mkdir(tempNumPath);
    tempNumPath = strcat(tempNumPath,'\');
    tempName = [type, numStr];
    tempFile = eval(tempName);
    [height, width]  = size(tempFile);
    for r = 1:1:height
        tempImg = reshape(tempFile(r,:),28,28)';
        tempImgPath = strcat(tempNumPath,num2str(r-1));
        tempImgPath = strcat(tempImgPath,'.bmp');
        tempImg=imresize(tempImg,64/28);
        %¶ÁÈ¡Í¼Ïñ³ß´ç
        [m,n]=size(tempImg); 
        %¸øÍ¼Ïñ¼ÓÔë
        Xnoised=imnoise(tempImg,'speckle',0.01); 
        %DCT±ä»»
        tempImg=dct2(Xnoised); 
        I=zeros(m,n);
        %¸ßÆµÆÁ±Î
        I(1:m/3,1:n/3)=1; 
        Ydct=tempImg.*I;
        %ÄæDCT±ä»»
        tempImg=uint8(idct2(Ydct)); 
        tempImg=im2bw(tempImg,0.5);
        [l,j]=size(tempImg);
        for i=1:l
            for j=1:j
                if tempImg(i,j)==0
                    tempImg(i,j)=1;
                else
                    tempImg(i,j)=0;
                end
            end
        end
        imwrite(tempImg,tempImgPath);
    end
end