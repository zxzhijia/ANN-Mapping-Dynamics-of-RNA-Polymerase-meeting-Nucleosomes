% x are the position and y are the counts
% load x
% load y
clear all
load Data1
move1=35;

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

y4=bur_Nuc2_RNAP;
tranf4=0;
amp4=8050;

x5=CG9243_Nuc2_Position+move1;
x55=min(x5):1:max(x5);

y5=CG9243_Nuc2_RNAP;
tranf5=0;
amp5=200;




% sigma=4;
% mu=0.08;
% sigma_tot=-40:1:40;
% mu_tot=-0.4:0.01:0.4;

sigma_tot=1:1:80;
mu_tot=0.01:0.01:0.8;
error_tot=zeros(1,size(sigma_tot,2)*size(mu_tot,2));
indx=1;
for i=1:size(sigma_tot,2)
    for j=1:size(mu_tot,2)
        % y_sim is a vector that contains the values calculated by 
        % the distribution function you used while plugged in the
        % sigma_tot(i) and mu_tot(i)
     logn1= 1+amp1* lognpdf (x1+tranf1,sigma_tot(i),mu_tot(j));
     y_sim1=logn1; 
     error_tot1(indx)=sum((abs(log(y1+1)).*(y1-y_sim1)).^2)/99;
     
     
     logn2= 1+amp2* lognpdf (x2+tranf2,sigma_tot(i),mu_tot(j));
     y_sim2=logn2; 
     error_tot2(indx)=sum((abs(log(y2+1)).*(y2-y_sim2)).^2)/99;
     
     
     logn3= 1+amp3* lognpdf (x3+tranf3,sigma_tot(i),mu_tot(j));
     y_sim3=logn3; 
     error_tot3(indx)=sum((abs(log(y3+1)).*(y3-y_sim3)).^2)/99;
     
     
     logn4= 1+amp4* lognpdf (x4+tranf4,sigma_tot(i),mu_tot(j));
     y_sim4=logn4; 
     error_tot4(indx)=sum((abs(log(y4+1)).*(y4-y_sim4)).^2)/99;
     
     
     logn5= 1+amp5* lognpdf (x5+tranf5,sigma_tot(i),mu_tot(j));
     y_sim5=logn5; 
     error_tot5(indx)=sum((abs(log(y5+1)).*(y5-y_sim5)).^2)/99;
     
     
      
%      plot(x,logn,'red');   
%      hold on
%      plot(x,y,'blue');
%      hold on
      
     error_tot(indx)=(error_tot1(indx)+error_tot2(indx)+error_tot3(indx)+error_tot4(indx)+...
         +error_tot5(indx))/7;

%     error_tot(indx)=sum((y-y_sim).^2)/99;
     sigma_mu(:,indx)=[sigma_tot(i);mu_tot(j)];
     indx=indx+1; 
     clear logn
    end
end

[M,I]=min(error_tot);
optimal_sigma=sigma_mu(1,I)
optimal_mu=sigma_mu(2,I)



for i=1:size(x11,2)
logn1(i)= 1+amp1* lognpdf (x11(i),optimal_sigma,optimal_mu);
end

for i=1:size(x22,2)
logn2(i)= 1+amp2* lognpdf (x22(i),optimal_sigma,optimal_mu);
end

for i=1:size(x33,2)
logn3(i)= 1+amp3* lognpdf (x33(i),optimal_sigma,optimal_mu);
end
for i=1:size(x44,2)
logn4(i)= 1+amp4* lognpdf (x44(i),optimal_sigma,optimal_mu);
end

for i=1:size(x55,2)
logn5(i)= 1+amp5* lognpdf (x55(i),optimal_sigma,optimal_mu);
end


% 
% logn1= 5+amp1*lognpdf (x1+tranf1,optimal_sigma+0.3,optimal_mu);
set(0,'DefaultAxesFontName', 'Arial')
%set(0,'DefaultAxesFontSize', 10)
set(0,'DefaultAxesFontWeight','bold')
figure
set(gcf,'unit','inches','position',[10 5 3.5 5]);
subplot(4,2,1)
plot(x11-move1,logn1,'red'); 
text(0.02,0.98,'\bf (a)','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize',10,'FontName','Arial')

hold on 
plot(x1-move1,y1,'blue');
axis([-100 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')


%logn2= 1+amp2* lognpdf (x2+tranf2,optimal_sigma+0.3,optimal_mu);
subplot(4,2,2)
plot(x22-move1,logn2,'red'); 
text(0.02,0.98,'\bf (b)','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize',10,'FontName','Arial')

hold on 
plot(x2-move1,y2,'blue');
axis([-100 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')

%logn3= 5+amp3* lognpdf (x3+tranf3,optimal_sigma+0.3,optimal_mu);
subplot(4,2,3)
plot(x33-move1,logn3,'red'); 
text(0.02,0.98,'\bf (c)','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize',10,'FontName','Arial')

hold on 
plot(x3-move1,y3,'blue');
axis([-100 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')

%logn4= 1+amp4*lognpdf (x4+tranf4,optimal_sigma+0.3,optimal_mu);
subplot(4,2,4)
plot(x44-move1,logn4,'red'); 
text(0.02,0.98,'\bf (d)','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize',10,'FontName','Arial')

hold on 
plot(x4-move1,y4,'blue');
axis([-100 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')

%logn5= 1+amp5*lognpdf (x5+tranf5,optimal_sigma+0.3,optimal_mu);
subplot(4,2,5)
plot(x55-move1,logn5,'red'); 
text(0.02,0.98,'\bf (e)','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize',10,'FontName','Arial')

hold on 
plot(x5-move1,y5,'blue');
axis([-100 150 0 250])
axis 'auto y'
xlabel('Position [b.p.]')
ylabel('RNAP II [A.U.]')

