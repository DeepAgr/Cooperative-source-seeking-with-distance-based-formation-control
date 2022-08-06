clc
clear all
close all
T=0:0.0001:0.02;

[t,x] = ode23(@qlf1,T,[25 10 12 -10 -10 40 -40 10 -10 10]);

x1=x(:,1);
x2=x(:,2);
x3=x(:,3);
x4=x(:,4);
x5=x(:,5);
x6=x(:,6);
x7=x(:,7);
x8=x(:,8);
x9=x(:,9);
x10=x(:,10);


ob=[50 60 24 70];
r=1; R=6;
k=1;

de12=15; de13=24.27051; de14=24.27051; de15=15;
de23=15; de24=24.27051; de25=24.27051;
de34=15; de35=24.27051;
de45=15;



d12=sqrt((x3-x1).^2+(x4-x2).^2);
d13=sqrt((x5-x1).^2+(x6-x2).^2); 
d14=sqrt((x7-x1).^2+(x8-x2).^2); 
d15=sqrt((x9-x1).^2+(x10-x2).^2);

d23=sqrt((x5-x3).^2+(x6-x4).^2);
d24=sqrt((x7-x3).^2+(x8-x4).^2);
d25=sqrt((x9-x3).^2+(x10-x4).^2);

d34=sqrt((x7-x5).^2+(x8-x6).^2);
d35=sqrt((x9-x5).^2+(x10-x6).^2);

d45=sqrt((x9-x7).^2+(x10-x8).^2);


vd1=sqrt((ob(1)-x1).^2+(ob(2)-x2).^2);
vd2=sqrt((ob(3)-x1).^2+(ob(4)-x2).^2);
v1=(min(0,(vd1.^2-R.^2)/(vd1.^2-r.^2))).^2+(min(0,(vd2.^2-R.^2)/(vd2.^2-r.^2))).^2;

vd3=sqrt((ob(1)-x3).^2+(ob(2)-x4).^2);
vd4=sqrt((ob(3)-x3).^2+(ob(4)-x4).^2);
v2=(min(0,(vd3.^2-R.^2)/(vd3.^2-r.^2))).^2+(min(0,(vd4.^2-R.^2)/(vd4.^2-r.^2))).^2;

vd5=sqrt((ob(1)-x5).^2+(ob(2)-x6).^2);
vd6=sqrt((ob(3)-x5).^2+(ob(4)-x6).^2);
v3=(min(0,(vd5.^2-R.^2)/(vd5.^2-r.^2))).^2+(min(0,(vd6.^2-R.^2)/(vd6.^2-r.^2))).^2;

vd7=sqrt((ob(1)-x7).^2+(ob(2)-x8).^2);
vd8=sqrt((ob(3)-x7).^2+(ob(4)-x8).^2);
v4=(min(0,(vd7.^2-R.^2)/(vd7.^2-r.^2))).^2+(min(0,(vd8.^2-R.^2)/(vd8.^2-r.^2))).^2;

vd9=sqrt((ob(1)-x9).^2+(ob(2)-x10).^2);
vd10=sqrt((ob(3)-x9).^2+(ob(4)-x10).^2);
v5=(min(0,(vd9.^2-R.^2)/(vd9.^2-r.^2))).^2+(min(0,(vd10.^2-R.^2)/(vd10.^2-r.^2))).^2;






e12=(1/2)*(((x3-x1).^2+(x4-x2).^2)-de12^2);
e13=(1/2)*(((x5-x1).^2+(x6-x2).^2)-de13^2); 
e14=(1/2)*(((x7-x1).^2+(x8-x2).^2)-de14^2); 
e15=(1/2)*(((x9-x1).^2+(x10-x2).^2)-de15^2);

e23=(1/2)*(((x5-x3).^2+(x6-x4).^2)-de23^2);
e24=(1/2)*(((x7-x3).^2+(x8-x4).^2)-de24^2);
e25=(1/2)*(((x9-x3).^2+(x10-x4).^2)-de25^2);

e34=(1/2)*(((x7-x5).^2+(x8-x6).^2)-de34^2);
e35=(1/2)*(((x9-x5).^2+(x10-x6).^2)-de35^2);

e45=(1/2)*(((x9-x7).^2+(x10-x8).^2)-de45^2);


figure(1)
plot(t,e12,t,e23,t,e34,t,e24,t,e14,t,e13,t,e15,t,e25,t,e35,t,e45,'Linewidth',1,'Markersize',3.5);
title('Error \psi between ith and jth agent');
xlabel('Time (in sec)');
ylabel('Error');
legend('1 and 2','2 and 3','3 and 4','2 and 4','1 and 4','1 and 3','1 and 5','2 and 5','3 and 5','4 and 5');


figure(2)
plot(t,d12,'-',t,d23,':',t,d34,'--',t,d24,'-.',t,d14,'-',t,d13,t,d15,t,d25,t,d35,t,d45,'Linewidth',1.5,'Markersize',3.5);
title('Distance between ith and jth agent');
xlabel('Time (in sec)');
ylabel('Distance');
legend('1 and 2','2 and 3','3 and 4','2 and 4','1 and 4','1 and 3','1 and 5','2 and 5','3 and 5','4 and 5');


figure (3)
plot(x1(end),x2(end),'o',x3(end),x4(end),'o',x5(end),x6(end),'o',x7(end),x8(end),'o',x9(end),x10(end),'o','Linewidth',2.5,'Markersize',3.5);

hold on;
plot([x1(end) x3(end)],[x2(end) x4(end)],'b--','Linewidth',0.5,'Markersize',3.5)
hold on;
plot([x3(end) x5(end)],[x4(end) x6(end)],'b--','Linewidth',0.5,'Markersize',3.5)
hold on;
plot([x5(end) x7(end)],[x6(end) x8(end)],'b--','Linewidth',0.5,'Markersize',3.5)
hold on;
plot([x7(end) x9(end)],[x8(end) x10(end)],'b--','Linewidth',0.5,'Markersize',3.5)
hold on;
plot([x9(end) x1(end)],[x10(end) x2(end)],'b--','Linewidth',0.5,'Markersize',3.5)
legend('Agent 1','Agent 2','Agent 3','Agent 4','Agent 5')
title('Final position of Agents');


figure (4)
plot(x1,x2,'-',x3,x4,':',x5,x6,'--',x7,x8,'-.',x9,x10,'Linewidth',2.5,'Markersize',3.5);
legend('Agent 1','Agent 2','Agent 3','Agent 4','Agent 5')
hold on;
plot(ob(1),ob(2),'o','Linewidth',2,'Markersize',8,'color','c');
hold on;
plot(ob(3),ob(4),'o','Linewidth',2,'Markersize',8,'color','c');
title('Path of Agents');

figure(5)
plot(x1,x2,'b-','Linewidth',2.5,'Markersize',3.5);
hold on;
plot(x3,x4,'r:','Linewidth',2.5,'Markersize',3.5);
hold on;
plot(x5,x6,'y--','Linewidth',2.5,'Markersize',3.5);
hold on;
plot(x7,x8,'k-.','Linewidth',2.5,'Markersize',3.5);
hold on;
plot(x9,x10,'g-.','Linewidth',2.5,'Markersize',3.5);
hold on;
plot(x1(end),x2(end),'o','Linewidth',2,'Markersize',20,'color','b');
hold on;
plot(x3(end),x4(end),'o','Linewidth',2,'Markersize',20,'color','r');
hold on;
plot(x5(end),x6(end),'o','Linewidth',2,'Markersize',20,'color','y');
hold on;
plot(x7(end),x8(end),'o','Linewidth',2,'Markersize',20,'color','k');
hold on;
plot(x9(end),x10(end),'o','Linewidth',2,'Markersize',20,'color','g');
hold on;
plot([x1(end) x3(end)],[x2(end) x4(end)],'m--','Linewidth',0.5,'Markersize',3.5)
hold on;
plot([x3(end) x5(end)],[x4(end) x6(end)],'m--','Linewidth',0.5,'Markersize',3.5)
hold on;
plot([x5(end) x7(end)],[x6(end) x8(end)],'m--','Linewidth',0.5,'Markersize',3.5)
hold on;
plot([x7(end) x9(end)],[x8(end) x10(end)],'m--','Linewidth',0.5,'Markersize',3.5)
hold on;
plot([x1(end) x9(end)],[x2(end) x10(end)],'m--','Linewidth',0.5,'Markersize',3.5)
hold on;
plot(ob(1),ob(2),'o','Linewidth',2,'Markersize',8,'color','c');
hold on;
plot(ob(3),ob(4),'o','Linewidth',2,'Markersize',8,'color','c');
legend('Agent 1','Agent 2','Agent 3','Agent 4','Agent 5', 'Obstacles')
legend('Location','southeast')
title('Final Result');


figure(6)
plot(t,v1,'Linewidth',1,'Markersize',3.5);



