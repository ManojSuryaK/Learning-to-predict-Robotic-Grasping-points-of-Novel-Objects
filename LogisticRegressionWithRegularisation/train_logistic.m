function w= train_logistic(w,x,t,lambda)
display('train_logistic called');
double y;
y=logsig(x*w);  %logistic sigmoid function
display('y calculated');
eta=0.0025;     %learning rate parameter tunable for faster error correction whenever possible(without causing error oscillations)
m=length(t);
[error,grad]=calc_cost_error(w,x,t,lambda); %calculate error initially
display('error calculated');
display(error);
fprintf('Program paused. Press enter to continue.\n');
pause;
iterations=0;
E=zeros(500000,0);
while(error>0.30)   %train until error is lesser than 0.3
    w=w-(eta*grad);
    y=logsig(x*w);
    [error,grad]=calc_cost_error(w,x,t,lambda); %calculate error for every iteration
    display(error);
    E(iterations+1)=error;
    if iterations>2
        if E(iterations+1)>E(iterations)        %implementation for early stopping 
            disp('early stopping');
            return;
        end
    end
    
    iterations=iterations+1;
    display(iterations);
end
end