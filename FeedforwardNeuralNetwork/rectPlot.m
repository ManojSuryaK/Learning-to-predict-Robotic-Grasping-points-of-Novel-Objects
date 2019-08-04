function rectPlot(y,fileNumber) %plots the rectangles by getting the coordinates from the files pcdFILENUMBERcpos.txt and pcdFILENUMBERcneg.txt on the image pcdFILENUMBER.png
    if(fileNumber<10)   %padding zeros to get the appropriate file name from the dataset
        positive= fopen(strcat('C:\Users\Pritesh J Shah\Desktop\ML-GraspRect\Dataset\CombinedData\pcd000',num2str(fileNumber),'cpos.txt'),'r');
        negative= fopen(strcat('C:\Users\Pritesh J Shah\Desktop\ML-GraspRect\Dataset\CombinedData\pcd000',num2str(fileNumber),'cneg.txt'),'r');
        img=imread(strcat('C:\Users\Pritesh J Shah\Desktop\ML-GraspRect\Dataset\CombinedData\pcd000',num2str(fileNumber),'r.png'));
    elseif(fileNumber<100)
        positive= fopen(strcat('C:\Users\Pritesh J Shah\Desktop\ML-GraspRect\Dataset\CombinedData\pcd00',num2str(fileNumber),'cpos.txt'),'r');
        negative= fopen(strcat('C:\Users\Pritesh J Shah\Desktop\ML-GraspRect\Dataset\CombinedData\pcd00',num2str(fileNumber),'cneg.txt'),'r');
        img=imread(strcat('C:\Users\Pritesh J Shah\Desktop\ML-GraspRect\Dataset\CombinedData\pcd00',num2str(fileNumber),'r.png'));
    elseif(fileNumber<1000)
        positive= fopen(strcat('C:\Users\Pritesh J Shah\Desktop\ML-GraspRect\Dataset\CombinedData\pcd0',num2str(fileNumber),'cpos.txt'),'r');
        negative= fopen(strcat('C:\Users\Pritesh J Shah\Desktop\ML-GraspRect\Dataset\CombinedData\pcd0',num2str(fileNumber),'cneg.txt'),'r');
        img=imread(strcat('C:\Users\Pritesh J Shah\Desktop\ML-GraspRect\Dataset\CombinedData\pcd0',num2str(fileNumber),'r.png'));
    else
        positive= fopen(strcat('C:\Users\Pritesh J Shah\Desktop\ML-GraspRect\Dataset\CombinedData\pcd',num2str(fileNumber),'cpos.txt'),'r');
        negative= fopen(strcat('C:\Users\Pritesh J Shah\Desktop\ML-GraspRect\Dataset\CombinedData\pcd',num2str(fileNumber),'cneg.txt'),'r');
        img=imread(strcat('C:\Users\Pritesh J Shah\Desktop\ML-GraspRect\Dataset\CombinedData\pcd',num2str(fileNumber),'r.png'));
    end
imshow(img);
hold on;
points=fscanf(positive,'%f');   %open the positive and negative rectangle coordinate files and concatenate to the 1D-array 'points'
rect=5; % assuming 5 positive rectangles for an image, to be modified based on the image to be tested on.
points=points(1:rect*8);
points=[points; fscanf(negative,'%f')];

count=1;
[rows,columns]=size(points);
for i=0:8:rows-1        %plotting rectangles 
    if(y(count)==1)
        plot([points(i+1),points(i+3)],[points(i+2), points(i+4)],'r');
        plot([points(i+3),points(i+5)],[points(i+4), points(i+6)],'r');
        plot([points(i+5),points(i+7)],[points(i+6), points(i+8)],'r');
        plot([points(i+7),points(i+1)],[points(i+8), points(i+2)],'r');
    else
        plot([points(i+1),points(i+3)],[points(i+2), points(i+4)],'b');
        plot([points(i+3),points(i+5)],[points(i+4), points(i+6)],'b');
        plot([points(i+5),points(i+7)],[points(i+6), points(i+8)],'b');
        plot([points(i+7),points(i+1)],[points(i+8), points(i+2)],'b');
    end
    if(count<(rows/4))
        count=count+1;
    end
end
hold off;
fclose(positive);       %closing data files
fclose(negative);