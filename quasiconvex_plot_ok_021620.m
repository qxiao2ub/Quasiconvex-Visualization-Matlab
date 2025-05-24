% upper constr not included
% Pijt=Uijt=0~100
xi = 0:1:100; 
yi = 0:1:100;
% a=b=m=n=T=1,cijt=10,dijt=100
a=1;
b=1;
m=1;
n=1;
T=40;
cijt=10;
dijt=100;

[x,y]=meshgrid(xi,yi);

%./ is for division, .* for multiply(k=0)
z=(x.*(b.*dijt+cijt.*dijt.*m-n.*T.*y))./(a+b+m.*(cijt+x));


%constraints for Uijt <=dijt
idx=(b*dijt+cijt*dijt*m-(a+b+m*(cijt+x))*dijt)./(n*T)-y>0; %idx points not plot
x(idx)=nan;
y(idx)=nan;
z(idx)=nan;

%plot and see whether quasi-convex
%K=-44;
K=44;
idz=z>=K; %if z<K for any constant K is convex, then z is quasi-convex;idz points not plot
x(idz)=nan;
y(idz)=nan;
z(idz)=nan;

% plot 
surf(x,y,z); 
colormap(jet);

xlabel('Pijt');ylabel('Uijt');zlabel('obj');grid;
title('Quasi-convex plot');