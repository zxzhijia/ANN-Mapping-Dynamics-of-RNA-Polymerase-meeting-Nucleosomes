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
eg = 0.001; % sum-squared error goal
sc = 1;    % spread constant
net = newrb(X,T,eg,sc,500);
close all
%%
set(0,'DefaultAxesFontName', 'Arial')
set(0,'DefaultAxesFontWeight','bold')
fig=figure
% set (gcf,'Position',[400,100,300,300], 'color','w')
set(gcf,'unit','inches','position',[10 5 3.5 5]);
subplot(4,2,1)
plot(x1,2*y1,'blue');
xlabel('Input');
text(0.02,0.98,'\bf (a)','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize',10,'FontName','Arial')
Y = net(x1);

hold on;


plot(x1,2*Y,'red');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
clear Y
Y = net(x2');
subplot(4,2,2)
plot(x2,2*y2,'blue');
text(0.02,0.98,'\bf (b)','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize',10,'FontName','Arial')
xlabel('Input');
hold on
plot(x2,2*Y,'r');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
hold off;


clear Y

Y=net(x3);
h=subplot(4,2,3);
plot(x3,y3,'blue');
text(0.02,0.98,'\bf (c)','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize',10,'FontName','Arial')
xlabel('Input')
hold on
plot(x3,Y,'red');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
% set(h,'position',[0.1, 0.1, 0.35, 0.35]);

hold off


clear Y
Y=sim(net,x4);
subplot(4,2,4)
plot(x4,1.5*y4,'blue');
text(0.02,0.98,'\bf (d)','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize',10,'FontName','Arial')
xlabel('Input')
hold on
plot(x4,1.5*Y,'black');
axis([-10 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')
p = fig2plotly(fig);

