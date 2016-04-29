close all
clear all
load Data1
move1=0;
%%%%%%----1,1----%%%%%
x1=Acon_Nuc1_Position+move1;
x11=min(x1):1:max(x1);

y1=Acon_Nuc1_RNAP;
tranf1=0;
amp1=3000;
%%%%%-----1.2----%%%%%%
x2=CG31627_Nuc1_Position+move1;
x22=min(x2):1:max(x2);

y2=30*CG31627_Nuc1_RNAP;
tranf2=0;
amp2=50;

x3=CG9246_Nuc1_Position+move1;
x33=min(x3):1:max(x3);

y3=CG9246_Nuc1_RNAP;
tranf3=0;
amp3=2000;

x4=Mcm10_Nuc1_Position+move1;
x44=min(x4):1:max(x4);

y4=Mcm10_Nuc1_RNAP;
tranf4=0;
amp4=500;

x5=bur_Nuc1_Position+move1;
x55=min(x5):1:max(x5);

y5=bur_Nuc1_RNAP;
tranf5=0;
amp5=5000;

x6=CG9243_Nuc1_Position+move1;
x66=min(x6):1:max(x6);

y6=CG9243_Nuc1_RNAP;
tranf6=0;
amp6=1000;

x7=CG9247_Nuc1_Position+move1;
x77=min(x7):1:max(x7);

y7=CG9247_Nuc1_RNAP;
tranf7=0;
amp7=8000;



X = [x1 x3 x4' x5 x6 x7];
T = [y1 y3 y4' y5 y6 y7];
eg = 0.001; % sum-squared error goal
sc = 1;    % spread constant
net = newrb(X,T,eg,sc);
subplot(4,2,1)
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

clear Y
Y = net(x2');
subplot(4,2,2)
plot(x2',y2');
text(0.02,0.98,'\bf (b)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input');
hold on
plot(x2',Y,'r');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off;


clear Y

Y=net(x3);
subplot(4,2,3)
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



clear Y
Y=sim(net,x4');
subplot(4,2,4)
plot(x4',10*y4');
text(0.02,0.98,'\bf (d)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input')
hold on
plot(x4',Y,'r');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off


clear Y
Y=sim(net,x5);
subplot(4,2,5)
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

clear Y
Y=sim(net,x6);
subplot(4,2,6)
plot(x6,y6);
text(0.02,0.98,'\bf (d)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input')
hold on
plot(x6,Y,'r');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off

clear Y
Y=sim(net,x7);
subplot(4,2,7)
plot(x7,y7);
text(0.02,0.98,'\bf (d)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input')
hold on
plot(x7,Y,'r');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off