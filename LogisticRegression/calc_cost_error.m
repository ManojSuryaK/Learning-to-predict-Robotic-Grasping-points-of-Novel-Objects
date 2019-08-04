function error = calc_cost_error(w,x,t)
a=logsig(x*w);
error=sum(-t.*log(a+0.05)-(1-t).*log(1.05-a))/length(t);    %defining the cross-entropy function.
