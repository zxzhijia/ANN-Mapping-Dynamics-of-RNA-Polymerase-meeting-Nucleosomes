close all
clear all
load Data1
move1=0;
%%%%%%----1,1----%%%%%
x1=Acon_Nuc2_Position+move1;
x11=min(x1):1:max(x1);

y1=Acon_Nuc2_RNAP;
tranf1=0;
amp1=800;
%%%%%-----1.2----%%%%%%
x2=CG9246_Nuc2_Position+move1;
x22=min(x2):1:max(x2);

y2=CG9246_Nuc2_RNAP;
tranf2=0;
amp2=1000;

x3=Mcm10_Nuc2_Position+move1;
x33=min(x3):1:max(x3);

y3=Mcm10_Nuc2_RNAP;
tranf3=0;
amp3=440;

x4=bur_Nuc2_Position+move1;
x44=min(x4):1:max(x4);

y4=0.1*bur_Nuc2_RNAP;
tranf4=0;
amp4=8050;

x5=CG9243_Nuc2_Position+move1;
x55=min(x5):1:max(x5);

y5=CG9243_Nuc2_RNAP;
tranf5=0;
amp5=200;



X = [x2 x4 x1 x3];
T = [y2 y4 y1 y3];
eg = 0.001; % sum-squared error goal
sc = 1;    % spread constant
net = newrb(X,T,eg,sc,15);
subplot(3,2,1)
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
m=mse(net,Y,y1)
clear Y
Y = net(x2);
subplot(3,2,2)
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
m2=mse(net,Y,y2)

clear Y

Y=net(x3);
subplot(3,2,3)
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

m3=mse(net,Y,y3)

clear Y
Y=sim(net,x4);
subplot(3,2,4)
plot(x4,10*y4);
text(0.02,0.98,'\bf (d)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input')
hold on
plot(x4,10*Y,'r');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off
m4=mse(net,Y,y4)

clear Y
Y=sim(net,x5);
subplot(3,2,5)
plot(x5,y5);
text(0.02,0.98,'\bf (d)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input')
hold on
plot(x5,Y,'r');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off
m5=mse(net,Y,y5)

