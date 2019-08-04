x=load('x.txt');    %load the data files into matlab
t=load('y.txt');
display('loaded');
for i=1:length(t)   %changing target vector from [-1 +1] to [0 +1]
    if(t(i)==-1)
        t(i)=0;
    end
end
display('t changed')
wo=zeros(1901,1);
display('train calling');
lambda=0.237;       % parameter lambda is tunable for performance
w=train_logistic(wo,x,t,lambda);    %invoke logistic training function
ynew=logsig(x*w);
misclassification=0;
for i=1:length(ynew)    %remap the output vector to among the classes 0 or 1
    if ynew(i)>=0.5
        ynew(i)=1;
    else
        ynew(i)=0;
    end
    if(ynew(i)~=t(i))   %count number of misclassifications
        misclassification=misclassification+1;
    end
end
display('missclassification');
display(misclassification/length(t));   % fraction of misclassification in the training data
