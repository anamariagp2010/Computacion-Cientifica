clc
clear all
close all
%punto 2
orden = 2;
t = [-1; -0.5; 0; 0.5; 1];
y = [1; 0.5; 0; 0.5; 2];
tc = [-1: 0.001: 1]';

%calcular matriz A
A = zeros(length(t),orden+1);
for i = 1:orden+1
    A(:,i) = t.^(i-1);
end
[A2,b2] = ortog(A,y);
x = solGaussSuperior(A2,b2);
  

y2 = zeros(length(tc),1);
for i = 1:orden+1
    y2 = y2+(x(i)*tc.^(i-1));
end
    
plot(t,y,'.r','MarkerSize',20)
hold on
grid on
plot(tc,y2,'.g')
