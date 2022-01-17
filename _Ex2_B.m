clear variables;
close all;

%%question 1
x=-5:1:5;
y=x;
figure(1);
a=4;b=9;c=0;d=0;e=0;f=-36;
h=ezplot(@(x,y)myfun(x,y,a,b,c,d,e,f));
set(h,'color','k');

question=input('asteroide : ');

switch question
    case 1
        xi=[-1.25;-1.1;-0.932;-0.746;-0.542;-0.32;-0.074;0.194;0.49;0.786];
        yi=[3.178;3.046;2.93;2.834;2.754;2.696;2.658;2.642;2.654;2.698];
    case 2
        xi=[-2.5815;-2.0762;-1.3565;-0.5279;1.0265;2.7484;3.5944;4.6929];
        yi=[0.0847;0.3172;0.6058;0.9590;1.2828;0.8756;0.5226;0.1792];
end

n=length(xi);

A=[xi.^2,xi.*yi,xi,yi,ones(n,1)];
b=[yi.^2];
z=inv(A'*A)*A'*b;

h=ezplot(@(x,y)myfun(x,y,z(1),-1,z(2),z(3),z(4),z(5))); %aX²+cXY+dX+eY+f=-Y²
hold on
set(h,'color','k');
plot(xi,yi,'r*')

norm(b-(A*z))
