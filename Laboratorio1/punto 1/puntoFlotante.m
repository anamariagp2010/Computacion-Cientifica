%{
Entrada: Base (B) , precisión (t) , Rango del exponente [L,U]
         B,t,L,U enteros
Salida: representación grafica sistema de punto flotante normalizado
        con Base B, precisión t y rango del exponente [L,U]
%}
function puntoFlotante(B,t,L,U)

	N = (2*(B-1)*(B^(t-1))*(U-L+1))/2; %número de digitos a la derecha de la recta
	OFL = (B^(U+1))*(1-(B^-t)); %número más grande que puede ser representado
	UFL = B^L; % número más pequeño que puede ser representado
    
    R = rangos(UFL,OFL);
    numDiv = N/(length(R)-1);
    ejeX = 0; % el eje x de la grafica inicia con el cero
    i = 1;
   
    %{ 
    se calculan todos los numeros que van entre cada potencia de 2 
    iniciando desde UFL y terminando en OFL 
    %}
    while i < length(R)
        n = (R(i+1)-R(i))/numDiv;
        if R(i+1) == length(R)
            ejeX = [ejeX R(i)+n:n:OFL]; 
        else
            ejeX = [ejeX R(i)+n:n:R(i+1)-n]; 
        end
        i = i+1;
        
    end
    R(end) = []; % se elimina la ultima potencia de 2 que es mayor o igual a OFL

    ejeX = [ejeX*-1  ejeX R*-1 R]; % se añaden todos los valores calculados al eje x
	ejeY = zeros(1,length(ejeX));
    % se grafica
	plot(ejeX,ejeY,'.r')
    hold on
    grid on

end
