in=laod('x.txt'); %Load input files
target=load('y.txt');
Training=in(1:4900); %choosing 70% of the data for training
Group=target(1:4900);
SVMModel=fitcsvm(Training,Group);   %Train MOdel 
TestInput=in(4901:7037);    
TestOuput=predict(SVMModel,TestInput);  %Predict