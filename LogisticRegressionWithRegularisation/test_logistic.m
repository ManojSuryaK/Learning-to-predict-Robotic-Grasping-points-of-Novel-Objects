x=load('x.txt');    %loading test data
t=load('y.txt');
x1=x(6328:6335,:);  %select range of rows for a given image fileNumber
t1=t(6328:6335,:);

display('loaded');
for i=1:length(t1)  % changing range from [-1,+1] to [0,+1]
    if(t1(i)==-1)
        t1(i)=0;
    end
end
display('t changed')
load('eta30er25.mat');  %load the trained weights file
y_test=logsig(x1*w);
misclassification=0;
for i=1:length(y_test)  %count the number of misclassifications
    if y_test(i)>=0.5
        y_test(i)=1;
    else
        y_test(i)=0;
    end
    if(y_test(i)~=t1(i))
        misclassification=misclassification+1;
    end
end
display('missclassification');
display(misclassification/length(t1));

rectPlot(y_test,903);   %plot the rectangle onto the image 
