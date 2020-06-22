clc 
close all
clear all

profile on;

f = @(t,y) [y(2),2.*exp(t) - 2.*y(2) - y(1)]; % ODE EJEMPLO 1
m = 2;
h = 0.01;
t0 = 0;
y0 = [0;1];
tf = 10;
n = ceil(tf/h);

[yk,tk] = orden_sup(f,t0,y0,h,n,m);

y = sinh(tk); % SOLUCIÓN ANALITICA EJEMPLO 1

format shortG
tabla = [yk(:,1),y,tk]

%GRAFICAS

plot(tk,yk(:,1),'r')
hold on
plot(tk,y,'b')
grid on


xlabel('TIEMPO t');
ylabel('y(t)');

%error relativo
error = abs((y-yk(:,1))./y)
error_prom = mean(error)
desv = std(error)
profile off;
profile viewer

