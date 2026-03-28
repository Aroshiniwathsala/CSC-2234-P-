function [root]= secant(x0,x1,tol,imax)
	f0=f(x0);
	f1=f(x1);
	xr=x1;
	i=1;
	error=100;
	while i<=imax && error>tol
		xr=x1-(f1*(x1-x0)/(f1-f0));

		if xr~=0
			error=abs((xr-x1)/xr);
		end
		i=i+1;
		x0=x1;
		f0=f1;
		x1=xr;
		f1=f(xr);
	end
	if i<imax
		root=xr;
	else
		disp('The method failed');
	end
end

function y=f(x)
	y=x^3+3*x^2-1;
end