function w= train_logistic(w,x,t)
display('train_logistic called');
double y;
y=logsig(x*w);
display('y calculated');
eta=0.003;     %eta can be tuned for performance
m=length(t);
error=calc_cost_error(w,x,t);   %calculate cost
display('error calculated');
display(error);
fprintf('Program paused. Press enter to continue.\n');
pause;
iteration=0;
E=[];
while(error>0.25)   %iterate until error is less than 0.25
    w=w-(eta*x'*(y-t)/m);
    y=logsig(x*w);
    error=calc_cost_error(w,x,t);
    display(error);
    E(iteration+1)=error;
    iteration=iteration+1;
    display(iteration);   
end
save('C:\Users\Pritesh J Shah\Desktop\processed\LogisticRegression\error0.25eta30.mat','w','y','E','iteration');    %save training weights for use during testing
plot(iteration(1:100:iteration),E(1:100:iteration));
xlabel('Number of iterations');
ylabel('Error');
title('eta = 0.0030');
end