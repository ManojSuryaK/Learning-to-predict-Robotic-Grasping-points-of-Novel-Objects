x=load('x.txt');    %load the data into matlab
t=load('y.txt');
display('loaded');
for i=1:length(t)   %%changing target vector from [-1 +1] to [0 +1]
    if(t(i)==-1)
        t(i)=0;
     end
 end
display('t changed')
x = x';
t = t';

start=7031; %tunable parameter based on the image fileNumber
finish=7037;    %tunable parameter based on the image fileNumber
img=1034;   %choose the image fileNumber
y1=net(x(:,start:finish));  %test the network over the data range
t1=t(start:finish);

for i=1:length(y1)  %remap the output vector to among the classes 0 or 1
    if(y1(i)>=0.5)
        y1(i)=1;
    else
        y1(i)=0;
    end
end

count=0;
for i=1:length(t1)  %count number of misclassifications
    if(y1(i)~=t1(i))
    count=count+1;
    end
end

misclass=count/length(t1);  % fraction of misclassification over the test range
disp(misclass);
rectPlot(y1,img);   %invoke grasping rectangle plotting function for the predicted rectangles
figure;
rectPlot(t1,img);   %invoke grasping rectangle plotting function for the actual rectangles