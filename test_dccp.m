clc
clear all
f=@(y) y.^2-0.6*y.^2;
gb=@(y,yk) 0.6*yk^2+1.2*yk*(y-yk);
y=-50:0.1:50;
plot(y,f(y),'b')
hold on
[a,b]=min(f(y));
val=y(b);

xk=-50;

for i=1:40
    yk=xk;
cvx_begin quiet
variable x
g=0.6*xk^2+1.2*xk*(x-xk);
yk;
plot(y,y.^2-gb(y,yk))
hold on
minimize x^2-g
subject to
x>=-30;
x<=10;
cvx_end
scatter(x,cvx_optval)
xk=x;
end
axis([-50 50 -10 1500])
