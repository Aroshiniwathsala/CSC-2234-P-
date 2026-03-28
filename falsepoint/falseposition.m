function [root]=falseposition(xl,xu,tol,imax)
% xl- lower boundary
% xu- upper boundary
% tol- tolerance
% imax - maximum number of iteration
% i- iteration

    if f(xl)*f(xu)<0    % Initial check for the boundary points
        fl=f(xl);   % function value at xl
        fu=f(xu);   % function value at xu
        i=1		% set as 1
		xr=0	% intial value set as 0
		error=100 	% Initial value set as 100
		while(error > tol && i<=imax)
			xr_old=xr; % xr_old is used to calculate error
			xr=xu-(fu*(xu-xl)/(fu-fl));	% Compute the xr
			fr=f(xr);		% find the function value at xr
			
			% comupte the error
			if xr~=0		% xr can not be zero in the divition
				error=abs((xr-xr_old)/xr);
			end
			
			test = fl*fr	% test the product to reduce the range
			
			if test < 0
				xu=xr;	% select lower sub-interval
                fu=fr;
            elseif test>0
				xl=xr;	% select upper sub-interval
				fl=fr;
			else
				error=0
			end
			i=i+1;		% move to the next iteration		
		end	% end while
        
		root=xr;       % xr assigned to root
        
    else
    disp('Range is invalid');   
    end	% end if 
end	% end function 

function y=f(x)
    y=x^3+3*x^2-1;
end