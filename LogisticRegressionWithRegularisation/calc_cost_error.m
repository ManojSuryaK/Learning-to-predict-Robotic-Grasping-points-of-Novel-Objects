function [J,grad] = calc_cost_error(w,x,t,lambda)
a=logsig(x*w);
n=length(w);
m=length(t);
reg = sum(w(2:n) .^ 2) * lambda / (2 * m);  %cross entropy function definition with regularisation factor
J=(-((t'*log(a))+((1-t)'*log(1-a)))/m)+reg;
regterm=(lambda/m)*w;
grad=((x'*(a-t))/m)+regterm;
grad(1)=grad(1)-((lambda/m)*w(1));
grad = grad(:);