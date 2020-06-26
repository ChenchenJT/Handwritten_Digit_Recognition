clear all;
kk_max=1000;
'TRAINING...'
for kk=0:kk_max-1
    m=strcat('D:\ChenchenJT\matlab_numberRecognition\nums\',int2str(kk),'.bmp');
    bw=imread(m,'bmp');
    bw=bmpResolve(bw);
    p(:,kk+1)=getFeature(bw);
    t(kk+1)=floor(kk/100);
end
'LODA OK.'
t;
save number_featurePT p t;
 
clear all;
load number_featurePT p t;
for i=1:38
    pr(i,1)=min(p(i,:));
    pr(i,2)=max(p(i,:));
end
net=newff(pr,[64,1],{'logsig' 'purelin'},'traingdx','learngdm');
net.trainParam.epochs=25000;
net.trainParam.goal=0.001;
net.trainParam.show=100;
net.trainParam.lr=0.1;
net=train(net,p,t);
'TRAIN OK.'

save number_featurenet net;
