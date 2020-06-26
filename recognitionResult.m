function label=recognitionResult(img)
load number_featurenet net;
bw=bmpResolve(img);
[pp,bwp]=getFeature(bw);
[a,Pf,Af]=sim(net,pp);
label=round(a);