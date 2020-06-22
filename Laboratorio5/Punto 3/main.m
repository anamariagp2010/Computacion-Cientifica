clc 
close all
clear all
profile on;

%f = @(t) 3.*(t.^2); % ODE EJEMPLO 1
f = @(t) (6.*t) + (t.^2); % ODE EJEMPLO 2

a = 0;
b = 1;
alpha = 0;
beta = 1;
n = 20;

%[yk,tk] = elem_finitos(f,a,b,alpha,beta,n);
[yk,tk] = dif_finitas(f,a,b,alpha,beta,n);

%y = ((tk.^4)./4)+ ((3./4).*tk); % SOLUCIÓN ANALITICA EJEMPLO 1
y = (tk.^3) + ((tk.^4)./12) - ((1./12).*tk); % SOLUCIÓN ANALITICA EJEMPLO 2

format shortG
tabla = [yk,y,tk]

%GRAFICAS
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
profile viewer;

