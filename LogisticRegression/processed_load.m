x=load('x.txt');    %loading test data
t=load('y.txt');
x=x(1:4900,:);
t=t(1:4900,:);
display('loaded');
for i=1:length(t)   % changing range from [-1,+1] to [0,+1]
    if(t(i)==-1)
        t(i)=0;
    end
end
display('t changed')
w=zeros(1901,1);
display('train calling');ynew=logsig(x*w);
misclassification=0;
for i=1:length(ynew)    %classification into positive rectangle => 1 or negative rectangle => 0
    if ynew(i)>=0.5
        ynew(i)=1;
    else
        ynew(i)=0;
    end
    if(ynew(i)~=t(i))       %count the number of misclassifications
        misclassification=misclassification+1;
    end
end
display('missclassification');
display(misclassification/length(t));
w=train_logistic(w,x,t);    %invoke the training function