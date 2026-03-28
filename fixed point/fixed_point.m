function [root]=fixed_point(x0,tol,imax)

	% x0 - initial value
	% tol - tolerence
	% imax - maximum number of iterations
	% i - iteration

	i=1; % set as first

	% xr_old - previous calculated value
	% xr - newly calculated value
	
	error=100; % set initial value 100
	xr_old=x0; % set initial value

	while i<= imax && error>tol
		xr=g(xr_old); % call the function g(x)
		if xr~=0
			error=abs((xr-xr_old)/xr); % error calculation
		end
		xr_old=xr;
		i=i+1; % count the iteration
	end

	if i<imax
		root=xr;
	else
		disp('It is not converges');
	end
end

% This is the function g(x) in the converted or developed formula x=g(x)

function y=g(x)
	%y=(2*x^3+2)/7;
	y=(7*x-2)/(2*x^2);

end