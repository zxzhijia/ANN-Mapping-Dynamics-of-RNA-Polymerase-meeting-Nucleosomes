close all
clear all
load Data1
move1=39;
%%%%%%----1,1----%%%%%
x1=CG9246_Nuc3_Position+move1;
x11=min(x1):1:max(x1);

y1=CG9246_Nuc3_RNAP;
tranf1=0;
amp1=700;

x2=Mcm10_Nuc3_Position+move1;
x22=min(x2):1:max(x2);

y2=Mcm10_Nuc3_RNAP;
tranf2=0;
amp2=550;

x3=bur_Nuc3_Position+move1;
x33=min(x3):1:max(x3);

y3=bur_Nuc3_RNAP;
tranf3=0;
amp3=240;

x4=CG9243_Nuc3_Position+move1;
x44=min(x4):1:max(x4);

y4=CG9243_Nuc3_RNAP;
tranf4=0;
amp4=100;



X = [x1 x2' x3];
T = [y1 y2' y3];
[Xsorted,I]=sort(X);
Ysorted=T(I);

startingP=min(Xsorted);
interval=3;
endP=ceil(max(Xsorted)/interval)*3;


% rest=mod(size(Xsorted,2),3);
% Ymatrix=reshape(Ysorted(1:end-rest),3,size(Ysorted(1:end-rest),2)/3);
% 
% Yaverage=sum(Ymatrix)./3;
clear y
yk=0;
Yk=[];
kpre=-1;
k_total=[];
for i=1:size(Xsorted,2)
k=ceil((Xsorted(i))/3);
if k==kpre
yk=yk+Ysorted(i);
else
k_total=[k_total 3*kpre];    
Yk=[Yk yk];    
yk=Ysorted(i);
end
kpre=k;
end
% Yaverage=[Yaverage sum(rest)/3];


eg = 0.01; % sum-squared error goal
 sc = 1.5;    % spread constant
% sc=5;
net = newrb(k_total,Yk./3,eg,sc,30);
subplot(2,2,1)
plot(x1,y1);
xlabel('Input');
text(0.02,0.98,'\bf (a)','Units', 'Normalized', 'VerticalAlignment', 'Top')
Y = net(x1);

hold on;


plot(x1,Y,'r');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
legend({'Desired output','Predicted output'})
m=mse(net,Y,y1)
clear Y
Y = net(x2');
subplot(2,2,2)
plot(x2,y2);
text(0.02,0.98,'\bf (b)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input');
hold on
plot(x2,Y,'r');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off;
legend({'Desired output','Output'})
m2=mse(net,Y,y2)

clear Y

Y=net(x3);
subplot(2,2,3)
plot(x3,y3);
text(0.02,0.98,'\bf (c)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input')
hold on
plot(x3,Y,'r');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off
legend({'Desired output','Output'})
m3=mse(net,Y,y3)

clear Y
Y=sim(net,x4);
subplot(2,2,4)
plot(x4,y4);
text(0.02,0.98,'\bf (d)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input')
hold on
plot(x4,Y,'r');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off
legend({'Desired output','Output'})
m4=mse(net,Y,y4)







