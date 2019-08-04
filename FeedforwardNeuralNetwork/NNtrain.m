x=load('x.txt'); %load the data into matlab
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

trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.

hiddenLayerSize = [30 10]; % 30 and 10 hidden layer neurons in the two layers
net = patternnet(hiddenLayerSize);
view(net)

net.divideFcn='divideind';  %divide data based on indices into training, validation and test data
net.divideParam.trainInd = 1:4200;  %   60% of the data
net.divideParam.valInd = 4201:4900; %   10% of the data
net.divideParam.testInd = 4901:7037;    %   30% of the data

net.layers{1}.transferFcn = 'logsig';
net.layers{2}.transferFcn = 'logsig';

[net,tr] = train(net,x,t);  % Train the Network
view(net)

y = net(x); % Test the Network
e = gsubtract(t,y);
figure, ploterrhist(e); %lot error histogram

for i=1:length(y)   %remap the output vector to among the classes 0 or 1
    if(y(i)>=0.5)
        y(i)=1;
    else
        y(i)=0;
    end
end
e = gsubtract(t,y);
performance = perform(net,t,y)
tind = vec2ind(t);
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);

view(net)   % View the Network

figure, plotperform(tr) %performance plot
figure, plottrainstate(tr)  %training state plot
figure, ploterrhist(e); % error histogram plot

count=0;
for i=4901:length(t)    %count number of misclassifications
if(y(i)~=t(i))
count=count+1;
end
end

display((0.3*length(t)-count)/(0.3*length(t))); % fraction of misclassification in the test data