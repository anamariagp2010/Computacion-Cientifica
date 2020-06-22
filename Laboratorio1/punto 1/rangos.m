%{
 Entrada: OFL (max) y UFL (min)
 Salida: vector con OFL y todas las potencias de 2
         entre OFL y UFL incluyendo la potencia que sigue a UFL
         en caso de que UFL no se una potencia de 2
%}

function rang = rangos (min,max)
    i = 1;
    rang = min;
    while i < max
        if min < i
           rang = [rang i];
           min = i;
        end    
        i = i*2;
    end
    rang = [rang i];
end