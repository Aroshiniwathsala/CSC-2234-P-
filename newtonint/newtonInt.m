function [yint2]=newtonInt(x,y,xi)
%x=[1 2 4]
%y=[2 3 10]
%xi=3

n=length(x);%n=3
fdd=zeros(n);
%0 0 0 
%0 0 0 
%0 0 0

yint=zeros(n,1);
%0
%0

Ea=zeros(n-1,1);%2=row,1=column
fdd(:,1)=y(:);
%x        y       1st                                2nd

%1(1,1)    2 (1,2)     ( 3-2)/(2-1)=1 (1,3)       3.5-1/(4-1) (1,4) 
%2(2,1)        3 (2,2)     (10-3)/(4-2)=3.5 (1,1)
%4 (3,1)       10(3,2)

%fdd table
for j=2:n
    for i=1:n+1-j
        fdd(i,j)=(fdd(i+1,j-1)-fdd(i,j-1))/(x(i+j-1)-x(i));
    end
end
xterm=1
yint(1)=fdd(1,1)

for order=2:n
    xterm=xterm*(xi-x(order-1)) %(xi-x1)
    yint2=yint(order-1)+fdd(1,order)*xterm %find b2,b3
    Ea(order)=yint2-yint(order-1)%error fiding
    yint(order)=yint2 %changing the order

end

%f2(x)=b1+b2(xi-x1)+b2(xi-x1)(xi-x2)
end