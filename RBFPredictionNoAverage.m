close all
clear all
load Data1
move1=0;
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
eg = 0.001; % sum-squared error goal
sc = 1;    % spread constant
net = newrb(X,T,eg,sc);
subplot(2,2,1)
plot(x1,y1,'blue');
xlabel('Input');
text(0.02,0.98,'\bf (a)','Units', 'Normalized', 'VerticalAlignment', 'Top')
Y = net(x1);

hold on;


plot(x1,Y,'red');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
clear Y
Y = net(x2');
subplot(2,2,2)
plot(x2,y2,'blue');
text(0.02,0.98,'\bf (b)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input');
hold on
plot(x2,Y,'r');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off;


clear Y

Y=net(x3);
subplot(2,2,3)
plot(x3,y3,'blue');
text(0.02,0.98,'\bf (c)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input')
hold on
plot(x3,Y,'red');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off


clear Y
Y=sim(net,x4);
subplot(2,2,4)
plot(x4,y4,'blue');
text(0.02,0.98,'\bf (d)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input')
hold on
plot(x4,Y,'red');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off

