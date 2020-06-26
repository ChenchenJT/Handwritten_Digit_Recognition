load number_featurenet net;
kk_max=100;
iii=0;
for kk=0:kk_max-1
    m=strcat('D:\ChenchenJT\matlab_numberRecognition\nums\8\',int2str(kk),'.bmp');
    bw=imread(m,'bmp');
    bw=bmpResolve(bw);
    [pp,bwp]=getFeature(bw);
    [a,Pf,Af]=sim(net,pp);
    a=round(a);
    if a==8
        iii=iii+1;
        disp(kk);
    end
end
disp(iii);
disp(iii/kk_max);