%Aaron Krauss
%This script prints out 4 graphs of the step function from -1 to 1, and
%they compare the interpolated functions with 8 and 12 points of data and
%the spline graphs with 8 and 12 points of data

%determine base step function for 201 points
x = linspace(-1,1,201);
for i = 1:201
    if(x(i) < 0)
        y(i) = 1;
    else
        y(i) = 0;
    end
end


n = 8;
x2 = linspace(-1,1,n);

% compute the set of interpolation values
for i = 1:n
    if(x2(i) < 0)
        fx(i) = 1;
    else
        fx(i) = 0;
    end
end

for i=1:201
   p = polyval_lagrange(x2,fx,x(i));
   % store the interpolant values
   pz(i,1) = p;
   
end

subplot(2,2,1), plot(x,y, x, pz);
legend('f(x)','p(x)');

%%%%%%%%% repeat for n  = 12

n = 12;
x3 = linspace(-1,1,n);

% compute the set of interpolation values
for i = 1:n
    if(x3(i) < 0)
        fx2(i) = 1;
    else
        fx2(i) = 0;
    end
end

for i=1:201
   p = polyval_lagrange(x3,fx2,x(i));
   % store the interpolant values
   pz2(i,1) = p;
   
end
subplot(2,2,2), plot(x,y, x, pz2);
legend('f(x)','p(x)');


%%%%%%%%%%%%%%%%% graphs 3 and 4 - splines


pp = spline (x2,fx,x);
subplot(2,2,3), plot(x,y, x, pp);
legend('f(x)','spline - 8');
axis([-1 1 -.25 2]);


pp2 = spline (x3,fx2,x);
subplot(2,2,4), plot(x,y, x, pp2);
legend('f(x)','spline - 12');
axis([-1 1 -.25 2]);





