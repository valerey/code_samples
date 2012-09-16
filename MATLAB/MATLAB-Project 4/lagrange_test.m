%
% lagrange_test.m:
%   Script to test the function polyval_lagrange, by calling it to 
%   interpolate the function exp(x^2) over the interval [-1,1], and 
%   then output the errors in that interpolation at the mid-points 
%   of each interval.
%
% Daniel R. Reynolds
% Math3315 / CSE3365
% Spring 2010
%

% start with a clean slate
clear

% set the number of data nodes
n = 11;

% compute the set of interpolation nodes
x = linspace(-1,1,n)';   % make a column vector

% compute the set of interpolation values
fx = exp(x.^2);
disp('   ')
disp('    data')
disp('      x                  f(x)')
for i = 1:n
   disp(sprintf('%16.10f   %16.10f   ', x(i), fx(i)))
end

% compute the set of evaluation points and function values
dx = x(2)-x(1);                     % interval width
z = linspace(-1+dx/2,1-dx/2,n-1)';  % midpoints of each interval
fz = exp(z.^2);                     % evaluate f at these points

% call polyval_lagrange to compute the polynomial interpolant, 
% and evaluate at each of the z values
for i=1:n-1
   p = polyval_lagrange(x,fx,z(i));
   % store the interpolant values
   pz(i,1) = p;
end

% compute the errors in the polynomial interpolation
error = abs(pz-fz);
disp('   ')
disp('    polyval_lagrange')
disp('      z                  f(z)               p(z)              error')
for i=1:n-1
   disp(sprintf('%16.10f   %16.10f   %16.10f     %g',...
       z(i),fz(i),pz(i),error(i)))
end
disp('   ')

