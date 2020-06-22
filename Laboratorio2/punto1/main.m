clc
clear all
close all
%punto 1
orden = 2;
t = [-1; -0.5; 0; 0.5; 1];
y = [1; 0.5; 0; 0.5; 2];
tc = [-1: 0.001: 1]';

x = minimosCuadrados(t,y,orden);
%Calcular la funcion principal
y2 = zeros(length(tc),1);
for i = 1:orden+1
    y2 = y2+(x(i)*tc.^(i-1));
end

plot(t,y,'.r','MarkerSize',20)
hold on
grid on
plot(tc,y2,'.g')
