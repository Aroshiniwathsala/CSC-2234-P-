function [root]=newtonRaphson(x0,tol,imax)
% xo- intitial guess/ starting value
% tol- tolerance
% imax - maximum number of iteration
% root- Approximated solution
% x1- newly calculated value
% i- Iteration

% error- calculated approximated relative error

i=1; %set the iteration as 1
x1=x0;
error =100;	% set the initial error as 100

	while error >tol && i<= imax
		fx=f(x0); % function value at x=x0
		fdx=df(x0); % f'(x0) at x=x0
		x1=x0-(fx/fdx);		% Formula to find the new x value
		
		if x1~=0
			error=abs((x1-x0)/x1); 	% Error calculation
		end
	
		i=i+1;	% Move to the next iteration
		
		x0=x1;	% current x1 become x0 in the next iteration
	end  % End while
	
	root=x1;
	
	if i> imax	% The condion to reach the solution 
				% within the maximum number of iteration.
		disp(' The method failed to reach the solution');
	end

end % end function newtonRaphson

function y=f(x) 
% To calculate the function value at x
y=x^3-2*x-5;
end %end f(x)

function y=df(x)
% To calculate the f'(x) value at x
y=3*x^2-2;
end %end df(x)