function dx= qlf1(t,x)
x1=x(1);
x2=x(2);
x3=x(3);
x4=x(4);
x5=x(5);
x6=x(6);
x7=x(7);
x8=x(8);
x9=x(9);
x10=x(10);

ob=[50 60 24 70];
r=1; R=6;

de12=15; de13=24.27051; de14=24.27051; de15=15;
de23=15; de24=24.27051; de25=24.27051;
de34=15; de35=24.27051;
de45=15;



d12=sqrt((x3-x1)^2+(x4-x2)^2);
d13=sqrt((x5-x1)^2+(x6-x2)^2); 
d14=sqrt((x7-x1)^2+(x8-x2)^2);
d15=sqrt((x9-x1)^2+(x10-x2)^2);

d23=sqrt((x5-x3)^2+(x6-x4)^2);
d24=sqrt((x7-x3)^2+(x8-x4)^2); 
d25=sqrt((x9-x3)^2+(x10-x4)^2);

d34=sqrt((x7-x5)^2+(x8-x6)^2);
d35=sqrt((x9-x5)^2+(x10-x6)^2);

d45=sqrt((x7-x9)^2+(x8-x10)^2);


vd1=sqrt((ob(1)-x1)^2+(ob(2)-x2)^2);
vd2=sqrt((ob(3)-x1)^2+(ob(4)-x2)^2);
v1=(min(0,(vd1^2-R^2)/(vd1^2-r^2)))^2+(min(0,(vd2^2-R^2)/(vd2^2-r^2)))^2; 

vd3=sqrt((ob(1)-x3)^2+(ob(2)-x4)^2);
vd4=sqrt((ob(3)-x3)^2+(ob(4)-x4)^2);
v2=(min(0,(vd3^2-R^2)/(vd3^2-r^2)))^2+(min(0,(vd4^2-R^2)/(vd4^2-r^2)))^2; 

vd5=sqrt((ob(1)-x5)^2+(ob(2)-x6)^2);
vd6=sqrt((ob(3)-x5)^2+(ob(4)-x6)^2);
v3=(min(0,(vd5^2-R^2)/(vd5^2-r^2)))^2+(min(0,(vd6^2-R^2)/(vd6^2-r^2)))^2; 

vd7=sqrt((ob(1)-x7)^2+(ob(2)-x8)^2);
vd8=sqrt((ob(3)-x7)^2+(ob(4)-x8)^2);
v4=(min(0,(vd7^2-R^2)/(vd7^2-r^2)))^2+(min(0,(vd8^2-R^2)/(vd8^2-r^2)))^2; 

vd9=sqrt((ob(1)-x9)^2+(ob(2)-x10)^2);
vd10=sqrt((ob(3)-x9)^2+(ob(4)-x10)^2);
v5=(min(0,(vd9^2-R^2)/(vd9^2-r^2)))^2+(min(0,(vd10^2-R^2)/(vd10^2-r^2)))^2;



e12=(1/2)*(((x3-x1)^2+(x4-x2)^2)-de12^2);
e13=(1/2)*(((x5-x1)^2+(x6-x2)^2)-de13^2);
e14=(1/2)*(((x7-x1)^2+(x8-x2)^2)-de14^2); 
e15=(1/2)*(((x9-x1)^2+(x10-x2)^2)-de15^2); 

e23=(1/2)*(((x5-x3)^2+(x6-x4)^2)-de23^2);
e24=(1/2)*(((x7-x3)^2+(x8-x4)^2)-de24^2);
e25=(1/2)*(((x9-x3)^2+(x10-x4)^2)-de25^2);

e34=(1/2)*(((x7-x5)^2+(x8-x6)^2)-de34^2);
e35=(1/2)*(((x9-x5)^2+(x10-x6)^2)-de35^2);

e45=(1/2)*(((x7-x9)^2+(x8-x10)^2)-de45^2);


sigma_x1 = 30; sigma_x2 = 90;
sigma_y1 = 75; sigma_y2 = 25;
Ps = [70; 70];
P1 = [x1; x2]; P2 = [x3; x4]; P3 = [x5; x6]; P4 = [x7; x8]; P5 = [x9; x10];
A0 = 50;
H1 = [(1/(2*(sigma_x1)^2)) 0; 0 (1/(2*(sigma_y1)^2))];
H2 = [(1/(2*(sigma_x2)^2)) 0; 0 (1/(2*(sigma_y2)^2))];


u1 = A0*exp(-(transpose(P1-Ps))*H1*(P1-Ps)) + A0*exp(-(transpose(P1-Ps))*H2*(P1-Ps));
u2 = A0*exp(-(transpose(P2-Ps))*H1*(P2-Ps)) + A0*exp(-(transpose(P2-Ps))*H2*(P2-Ps));
u3 = A0*exp(-(transpose(P3-Ps))*H1*(P3-Ps)) + A0*exp(-(transpose(P3-Ps))*H2*(P3-Ps));
u4 = A0*exp(-(transpose(P4-Ps))*H1*(P4-Ps)) + A0*exp(-(transpose(P4-Ps))*H2*(P4-Ps));
u5 = A0*exp(-(transpose(P5-Ps))*H1*(P5-Ps)) + A0*exp(-(transpose(P5-Ps))*H2*(P5-Ps));


R1 = [(x3-x1) (x4-x2); (x5-x1) (x6-x2); (x7-x1) (x8-x2); (x9-x1) (x10-x2)];
b1 = [(u2-u1); (u3-u1); (u4-u1); (u5-u1)];
g1 = (inv((transpose(R1))*R1))*(transpose(R1))*b1;

R2 = [(x1-x3) (x2-x4); (x5-x3) (x6-x4); (x7-x3) (x8-x4); (x9-x3) (x10-x4)];
b2 = [(u1-u2); (u3-u2); (u4-u2); (u5-u2)];
g2 = (inv((transpose(R2))*R2))*(transpose(R2))*b2;

R3 = [(x1-x5) (x2-x6); (x3-x5) (x4-x6); (x7-x5) (x8-x6); (x9-x5) (x10-x6)];
b3 = [(u1-u3); (u2-u3); (u4-u3); (u5-u3)];
g3 = (inv((transpose(R3))*R3))*(transpose(R3))*b3;

R4 = [(x1-x7) (x2-x8); (x3-x7) (x4-x8); (x5-x7) (x6-x8); (x9-x7) (x10-x8)];
b4 = [(u1-u4); (u2-u4); (u3-u4); (u5-u4)];
g4 = (inv((transpose(R4))*R4))*(transpose(R4))*b4;

R5 = [(x1-x9) (x2-x10); (x3-x9) (x4-x10); (x5-x9) (x6-x10); (x7-x9) (x8-x10)];
b5 = [(u1-u5); (u2-u5); (u3-u5); (u4-u5)];
g5 = (inv((transpose(R5))*R5))*(transpose(R5))*b5;


kv=1;
ko=10000;
kt=10000;

dx = zeros(10,1);
dx(1)=kv*(2*e12*(x3-x1)+2*e13*(x5-x1)+2*e14*(x7-x1)+2*e15*(x9-x1))-ko*v1+kt*g1(1);
dx(2)=kv*(2*e12*(x4-x2)+2*e13*(x6-x2)+2*e14*(x8-x2)+2*e15*(x10-x2))-ko*v1+kt*g1(2);
dx(3)=kv*(2*e12*(x1-x3)+2*e23*(x5-x3)+2*e24*(x7-x3)+2*e25*(x9-x3))-ko*v2+kt*g2(1);
dx(4)=kv*(2*e12*(x2-x4)+2*e23*(x6-x4)+2*e24*(x8-x4)+2*e25*(x10-x4))-ko*v2+kt*g2(2);
dx(5)=kv*(2*e13*(x1-x5)+2*e23*(x3-x5)+2*e34*(x7-x5)+2*e35*(x9-x5))-ko*v3+kt*g3(1);
dx(6)=kv*(2*e13*(x2-x6)+2*e23*(x4-x6)+2*e34*(x8-x6)+2*e35*(x10-x6))-ko*v3+kt*g3(2);
dx(7)=kv*(2*e14*(x1-x7)+2*e24*(x3-x7)+2*e34*(x5-x7)+2*e45*(x9-x7))-ko*v4+kt*g4(1);
dx(8)=kv*(2*e14*(x2-x8)+2*e24*(x4-x8)+2*e34*(x6-x8)+2*e45*(x10-x8))-ko*v4+kt*g4(2);
dx(9)=kv*(2*e15*(x1-x9)+2*e25*(x3-x9)+2*e35*(x5-x9)+2*e45*(x7-x9))-ko*v5+kt*g5(1);
dx(10)=kv*(2*e15*(x2-x10)+2*e25*(x4-x10)+2*e35*(x6-x10)+2*e45*(x8-x10))-ko*v5+kt*g5(2);

end
