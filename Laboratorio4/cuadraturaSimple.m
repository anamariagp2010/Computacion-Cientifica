function res = cuadraturaSimple(f,a,b,metodo)
	fb = feval(f,b);
	fa = feval(f,a);
	fab2 = feval(f,(a+b)/2);
	if(metodo == 0) %punto medio 
		res =  (b-a)*fab2;
	elseif(metodo == 1) %trapezoide
		res = ((b-a)/2)*(fa+fb);
	else %simpson
		res = ((b-a)/6)*(fa + 4*fab2 + fb);
	end
end
