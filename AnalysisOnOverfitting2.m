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

y5=4*CG9243_Nuc2_RNAP;
tranf5=0;
amp5=200;



X = [x1 x4 x2 x3];
T = [y1 y4 y2 y3];


Error1_tot=[];
Error2_tot=[];
Error3_tot=[];
Error4_tot=[];
Error5_tot=[];
start=10;
final=45;
points=[1 start:5:final];
for neuron=points
eg = 0.001; % sum-squared error goal
sc = 0.2;    % spread constant
net = newrb(X,T,eg,sc,neuron);
close all
%% plot figures
fig=figure
subplot(3,2,1)
plot(x1,y1);
axis([-100 140 0 20])
xlabel('Input');
text(0.02,0.98,'\bf (a)','Units', 'Normalized', 'VerticalAlignment', 'Top')
Y = net(x1);

hold on;


plot(x1,Y,'r');
axis([-100 140 0 20])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')

m=mse(net,Y/max(Y),y1/max(Y))

clear Y
Y = net(x2);
subplot(3,2,2)
plot(x2,y2);
axis([-100 140 0 10])
text(0.02,0.98,'\bf (b)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input');
hold on
plot(x2,Y,'r');
axis([-100 140 0 10])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off;
m2=mse(net,Y/max(Y),y2/max(Y))

clear Y

Y=net(x3);
subplot(3,2,3)
plot(x3,y3);
text(0.02,0.98,'\bf (c)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input')
hold on
plot(x3,Y,'r');
axis([-100 140 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off
m3=mse(net,Y/max(Y),y3/max(Y))


clear Y
Y=sim(net,x4);
subplot(3,2,4)
plot(x4,10*y4);
text(0.02,0.98,'\bf (d)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input')
hold on
plot(x4,10*Y,'r');
axis([-100 140 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off
m4=mse(net,10*Y/max(10*Y),10*y4/max(10*Y))

clear Y
Y=sim(net,x5);
subplot(3,2,5)
plot(x5,y5/4);
text(0.02,0.98,'\bf (e)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input')
hold on
plot(x5,(Y+4)/4,'black');
axis([-100 140 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off
m5=mse(net,((Y+4)/4)/max((Y+4)/4),(y5/4)/max((Y+4)/4))
Error1_tot=[Error1_tot m];
Error2_tot=[Error2_tot m2];
Error3_tot=[Error3_tot m3];
Error4_tot=[Error4_tot m4];
Error5_tot=[Error5_tot m5];
% p = fig2plotly(fig);
end
figure
num_total=points;

plot(num_total,Error5_tot,'-g*')
hold on
plot(num_total,mean([Error1_tot;Error2_tot;Error3_tot;Error4_tot]),'-r*')

xlabel('Network size (b.p)')
ylabel('Error')

