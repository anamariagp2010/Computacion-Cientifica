function res = difFin(f,x,h,metodo) 
	tmp = feval(f,x);
	tmp2 = feval(f,x+h);
	tmp3 = feval(f,x-h);
	if(metodo == 0) %diferencias finitas hacia adelante
		res =  (tmp2 - tmp)/h;
	elseif(metodo == 1) %diferencias finitas hacia atras
		res =  (tmp - tmp3)/h;
	else %diferencias centrada
		res =  (tmp2 - tmp3)/(2*h);
	end
end
