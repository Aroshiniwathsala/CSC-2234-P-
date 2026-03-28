function [sum]=lagrange(x,y,p)
	n=length(x);
	v=zeros(n,1);
	
	sum=0;
	for i=1:n
		product=y(i);
		for j=1:n
			if i~=j
				product=product*(p-x(j))/(x(i)-x(j));
			end
		end
		sum=sum+product;
	end		
end