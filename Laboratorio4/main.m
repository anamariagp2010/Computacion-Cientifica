%CODIGO: ANA MARIA GARCIA POSSO
%der1 y der2 son las funciones originales que se toman de ejemplo para la
%derivacion
der1 = @(x)((sin(x.^2)+x).^(1./2));
der2 = @(x)((x.^2).*(log(x.^(1./2))));
%dfDer1 y dfDer2 son las derivadas correctas de der1 y der2 respectivamente
dfDer1 = @(x)(((2.*x.*cos(x.^2))+1)./(2.*((sin(x.^2)+x).^(1./2))));
dfDer2 = @(x)((2.*x).*log(x.^(1/2)) + (x./2));
%integ1 y integ2 son las funciones originales que se toman de ejemplo para la
%integracion
integ1 = @(x)((log(x))./(x.^3));
integ2 = @(x)((x.^2).*(exp(x)));
%a y b sera en rango en el que se van a mover las funciones calculadas
%tanto las derivadas como las integrales
a = 1;
b = 3;
%tabla sera una matriz con 4 columnas donde 3 de ellas indican los
%resultados de los metodos de derivacion y la cuarta columna indica el
%resultado real de la derivacion
tabla = zeros(20,4);
i = a;
j = 1;
%funcD indica la funcion original que se quiere derivar y der es la
%solucion real de la derivacion
%CALCULO DE CUADRATURA SIMPLE
exacta1 = integral(integ1,a,b)
puntoMedio1 = cuadraturaSimple(integ1,a,b,0)
trapezoide1 = cuadraturaSimple(integ1,a,b,1)
simpson1 = cuadraturaSimple(integ1,a,b,2)
exacta2 = integral(integ2,a,b)
puntoMedio2 = cuadraturaSimple(integ2,a,b,0)
trapezoide2 = cuadraturaSimple(integ2,a,b,1)
simpson2 = cuadraturaSimple(integ2,a,b,2)

%funcD indica la funcion (de los ejemplos anteriores) que se quiere
%derivar. der indica la derivada real respectiva de esta funcion. funcI es
%la funcion integral que se quiere evaluar en el ciclo.
funcD = der2;
der = dfDer2;
funcI = integ2;

%EN ESTE CICLO SE CALCULARAN LOS 3 METODOS DE DERIVACION, AL IGUAL QUE SE
%CALCULARA LA CUADRATURA COMPUESTA DE LA SIGUIENTE MANERA:
%Debido a que la cuadratura compuesta internamente tiene las mismas
%funciones que la cuadratura simple y la unica diferencia son los rangos, a
%traves de este ciclo se tomara cada rango (i,i+0.1) como un intervalo
%(a,b) con el que se llamara a la funcion de cuadratura
%La variable suma guardara el resultado final de cada uno de los metodos de
%integracion.
suma0 = 0;
suma1 = 0;
suma2 = 0;
aComp = a;
bComp = aComp+0.1;
while i<b
    %CALCULO DE METODOS DE DERIVADAS
    analitica = feval(der,i);
    adelante = difFin(funcD,i,0.01,0);
    atras = difFin(funcD,i,0.01,1);
    centrada = difFin(funcD,i,0.01,2);
    tabla(j,:) = [adelante,atras,centrada,analitica];
    %CALCULO DE INTEGRALES CON CUADRATURA COMPUESTA
    suma0 = suma0 + cuadraturaSimple(funcI,aComp,bComp,0);
    suma1 = suma1 + cuadraturaSimple(funcI,aComp,bComp,1);
    suma2 = suma2 + cuadraturaSimple(funcI,aComp,bComp,2);
    %actualizamos el rango (a,b)
    aComp = aComp+0.1;
    bComp = aComp+0.1;
    j = j+1;
    i = i+0.1;
end
disp("Integral Punto Medio - Cuadratura Compuesta")
suma0
disp("Integral Trapezoide - Cuadratura Compuesta")
suma1
disp("Integral Simpson - Cuadratura Compuesta")
suma2
disp("dif adelante")
tabla(:,1)
disp("dif atras")
tabla(:,2)
disp("centrada")
tabla(:,3)
disp("analitica")
tabla(:,4)

plot(a:0.1:(b-0.1),tabla(:,1),'r')
hold on
grid on
plot(a:0.1:(b-0.1),tabla(:,2),'g')
plot(a:0.1:(b-0.1),tabla(:,3),'y')
plot(a:0.1:(b-0.1),tabla(:,4),'b')
hold off

