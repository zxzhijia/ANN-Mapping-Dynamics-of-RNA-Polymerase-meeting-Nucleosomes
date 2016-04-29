close all
clear all
load Data1
move1=0;
%%%%%%----1,1----%%%%%
x1=CG9246_Nuc3_Position+move1;
x11=min(x1):1:max(x1);

y1=0.5*CG9246_Nuc3_RNAP;
tranf1=0;
amp1=700;

x2=Mcm10_Nuc3_Position+move1;
x22=min(x2):1:max(x2);

y2=0.5*Mcm10_Nuc3_RNAP;
tranf2=0;
amp2=550;

x3=bur_Nuc3_Position+move1;
x33=min(x3):1:max(x3);

y3=bur_Nuc3_RNAP;
tranf3=0;
amp3=240;

x4=CG9243_Nuc3_Position+move1;
x44=min(x4):1:max(x4);

y4=CG9243_Nuc3_RNAP/1.5;
tranf4=0;
amp4=100;

[Y4,I]=sort(y4);
X4=x4(I);

X = [x1 x2' x3 X4(end-2)];
T = [y1 y2' y3 Y4(end-2)];

Error13_tot=[];
Error14_tot=[];
Error15_tot=[];
Error16_tot=[];
start=5;
final=40;
% points=[1 15 50 100 200 300 400 500];
points=[1 5 10 15 20 25 30 35 40];
for neuron=points
eg = 0.001; % sum-squared error goal
sc = 1;    % spread constant
net = newrb(X,T,eg,sc,neuron);
close all
%%
fig=figure
% set (gcf,'Position',[400,100,300,300], 'color','w')
subplot(2,2,1)
plot(x1,2*y1,'blue');
xlabel('Input');
text(0.02,0.98,'\bf (a)','Units', 'Normalized', 'VerticalAlignment', 'Top')
Y = net(x1);

hold on;


plot(x1,2*Y,'red');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
m=mse(net,Y/max(Y),y1/max(Y))
clear Y
Y = net(x2');
subplot(2,2,2)
plot(x2,2*y2,'blue');
text(0.02,0.98,'\bf (b)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input');
hold on
plot(x2,2*Y,'r');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off;

m2=mse(net,Y/max(Y),y2/max(Y))
clear Y

Y=net(x3);
h=subplot(2,2,3);
plot(x3,y3,'blue');
text(0.02,0.98,'\bf (c)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input')
hold on
plot(x3,Y,'red');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
% set(h,'position',[0.1, 0.1, 0.35, 0.35]);

hold off
m3=mse(net,Y/max(Y),y3/max(Y))

clear Y
Y=sim(net,x4);
subplot(2,2,4)
plot(x4,1.5*y4,'blue');
text(0.02,0.98,'\bf (d)','Units', 'Normalized', 'VerticalAlignment', 'Top')
xlabel('Input')
hold on
plot(x4,1.5*Y,'black');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
m4=mse(net,Y/max(Y),y4/max(Y))
% p = fig2plotly(fig);
Error13_tot=[Error13_tot m];
Error14_tot=[Error14_tot m2];
Error15_tot=[Error15_tot m3];
Error16_tot=[Error16_tot m4];
end
set(0,'DefaultAxesFontName', 'Arial')
set(0,'DefaultAxesFontWeight','bold')
figure
subplot(3,1,3)
set(gcf,'unit','inches','position',[10 5 3.5 5]);
num_total=points;
% plot(num_total,Error1_tot)
% hold on
% plot(num_total,Error2_tot,'-y*')
% hold on
% plot(num_total,Error3_tot,'-b*')
% hold on
plot(num_total,100*Error16_tot,'-g*')
hold on
plot(num_total,100*mean([Error13_tot;Error14_tot;Error15_tot]),'-r*')

xlabel('Network size')
text(0.02,0.98,'\bf (c)','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize',10,'FontName','Arial')
ylabel('Error (%)')


