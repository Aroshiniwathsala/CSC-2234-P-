function [root]=bisection(xl,xu,tol,imax)

% input parameters given in curve brackets and output parameters are given
% in square brackets.

% xl -lower boundary
% xu -upper boundary
% tol - tollerence
% imax -maximum number of iterations

    if f(xl)*f(xu)<0    % initial check for the boundary point
        fl=f(xl);       % function value at xl
        i=1;            % set as 1
        xr=0;           % initial value set as 0 
        error=100;      % initial value set as 100

        while(error>tol && i<imax)
            xr_old=xr;       % xr_old is used to calculate error
            xr=(xu+xl)/2;    % compute the xr
            fr=f(xr);        % find the function value at xr
             
            % compute the error
            if xr~=0         % xr can not be zero in the division
                error=abs((xr-xr_old)/xr);
            end

            test=fl*fr;      % test the product to reduce the range
            if test<0
                xu=xr;       % select lower sub interval
            elseif test>0
                xl=xr;       % select upper sub interval
                fl=fr;
            else
                error=0;
            end
            i=i+1;           % move to next iteration
        end                  % end of while
        root=xr;             % xr assigned to root
    else
        disp('Range is invalid');
    end                      % end of if
end                          % end of function



function y=f(x)
    y=x^2-4*x+4;
end