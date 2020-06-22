clc 
close all
clear all
profile on;
%f = @(t,y) t.*(y.^(0.5)); % ODE EJEMPLO 1
f = @(t,y) t./(y.^(2)); % ODE EJEMPLO 2

h = 0.01;
t0 = 0;
y0 = 1;
tf = 10;
n = ceil(tf/h);

%[yk,tk] = euler(f,t0,y0,h,n);
%[yk,tk] = RK2(f,t0,y0,h,n);
%[yk,tk] = RK4(f,t0,y0,h,n);
%[yk,tk] = multipaso2(f,t0,y0,h,n);
[yk,tk] = multipaso4(f,t0,y0,h,n);

%y = ((tk.^4)./16) + ((tk.^2)./4) + (1./4); % SOLUCIÓN ANALITICA EJEMPLO 1
y = (((3.*(tk.^2))+1)./(2)).^(1./3); % SOLUCIÓN ANALITICA EJEMPLO 2

format shortG
tabla = [yk,y,tk]
%yk es la aproximacion en un punto
%y es el valor analitico
%tk es el tiempo en el que se evalua

%GRAFICAS
%la grafica roja es la calculada y la azul la analitica
plot(tk,yk,'r')
hold on
plot(tk,y,'b')
grid on

xlabel('TIEMPO t');
ylabel('y(t)');

%error relativo
error = abs((y-yk)./y)
error_prom = mean(error)
desv = std(error)
profile off;
profile viewer
