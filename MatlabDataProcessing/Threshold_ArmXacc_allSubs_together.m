%% Trial ARM C9 sensor X axis threshold application
load('T1.mat')
load('T2.mat')
load('T3.mat')

%remove counters
T1.globalPacketCounter=[];
T1.packetCounter_C9=[];
T1.packetCounter_AC=[];
T1.packetCounter_B5=[];
T1.packetCounter_B6=[];

T2.globalPacketCounter=[];
T2.packetCounter_C9=[];
T2.packetCounter_AC=[];
T2.packetCounter_B5=[];
T2.packetCounter_B6=[];

T3.globalPacketCounter=[];
T3.packetCounter_C9=[];
T3.packetCounter_AC=[];
T3.packetCounter_B5=[];
T3.packetCounter_B6=[];


% remove the subject information
T1(:, end) = []; 
T2(:, end) = []; 
T3(:, end) = []; 

% Extract the column of the Arm Sensor (C9) on the X axis 
ArmT1x=T1.Axel_X_C9; 
ArmT2x=T2.Axel_X_C9;
ArmT3x=T3.Axel_X_C9;

% THRESHOLD APPLICATION on X axis 
% in this way, the "break" from the movement is brought to 0 
% however, due to the different ranges of the accelerations in the three
% tasks the third task is penalized
% -> necessary to use a hard coded threshold to perform the same
% transformations also in the online application (cannot compute the
% baseline, disntiguish the shape etc.) 

% TASK 1 
lower_threshold = -1.5;
upper_threshold = 2.7;

for i=1:length(ArmT1x(:,1))
    if(ArmT1x(i)>lower_threshold && ArmT1x(i)<upper_threshold)
        ArmT1x(i,2)=0;
    else ArmT1x(i,2)=1; 
    end
end

% TASK 2

lower_threshold = -2.5;
upper_threshold = 2.5;

for i=1:length(ArmT2x(:,1))
    if(ArmT2x(i)>lower_threshold && ArmT2x(i)<upper_threshold)
        ArmT2x(i,2)=0;
    else ArmT2x(i,2)=1; 
    end
end

% TASK 3
lower_threshold = -5;
upper_threshold = 0.5;

for i=1:length(ArmT3x(:,1)) % applies the threshold only to column 13 (would be X axis of B5)
    if(ArmT3x(i)>lower_threshold && ArmT3x(i)<upper_threshold)
        ArmT3x(i,2)=0;
    else ArmT3x(i,2)=1; 
    end
end
clear i; 

% %% THRESHOLD applicaiton on Y axis
% lower_threshold=3;
% upper_threshold=8.5;
% 
% for i=1:length(ArmT1y(:,1))
%     if(ArmT1y(i)>lower_threshold && ArmT1y(i)<upper_threshold)
%         ArmT1y(i,2)=0;
%     else ArmT1y(i,2)=ArmT1y(i,1); 
%     end
% end
% 
% for i=1:length(ArmT2y(:,1))
%     if(ArmT2y(i)>lower_threshold && ArmT2y(i)<upper_threshold)
%         ArmT2y(i,2)=0;
%     else ArmT2y(i,2)=ArmT2y(i,1); 
%     end
% end
% 
% for i=1:length(ArmT3y(:,1)) % applies the threshold only to column 13 (would be X axis of B5)
%     if(ArmT3y(i)>lower_threshold && ArmT3y(i)<upper_threshold)
%         ArmT3y(i,2)=0;
%     else ArmT3y(i,2)=ArmT3y(i,1); 
%     end
% end
% 
% %% THRESHOLD applicaiton on Y axis
% lower_threshold=2;
% upper_threshold=3.5;
% 
% for i=1:length(ArmT1z(:,1))
%     if(ArmT1z(i)>lower_threshold && ArmT1z(i)<upper_threshold)
%         ArmT1z(i,2)=0;
%     else ArmT1z(i,2)=ArmT1z(i,1); 
%     end
% end
% 
% for i=1:length(ArmT2z(:,1))
%     if(ArmT2z(i)>lower_threshold && ArmT2z(i)<upper_threshold)
%         ArmT2z(i,2)=0;
%     else ArmT2z(i,2)=ArmT2z(i,1); 
%     end
% end
% 
% for i=1:length(ArmT3z(:,1)) % applies the threshold only to column 13 (would be X axis of B5)
%     if(ArmT3z(i)>lower_threshold && ArmT3z(i)<upper_threshold)
%         ArmT3z(i,2)=0;
%     else ArmT3z(i,2)=ArmT3z(i,1); 
%     end
% end

% Graph of the thresholded and not thresholded data to compare
tiledlayout(3,1);

nexttile 
plot(ArmT1x)
title("Arm C9 sensor X axis accelerations for T1")
legend ("T1")

nexttile 
plot(ArmT2x)
title("Arm C9 sensor X axis accelerations for T2")
legend ("T2")

nexttile 
plot(ArmT3x)
title("Arm C9 sensor X axis accelerations for T3")
legend ("T3")


% nexttile
% plot(ArmT1x(:,2))
% hold on 
% plot(ArmT2x(:,2))
% plot(ArmT3x(:,2))
% legend ('T1 thresholded', 'T2 thresholded', ' T3 thresholded')
% title("Arm C9 sensors X axis thresholded accelerations")
% hold off

% nexttile 
% plot(ArmT1y(:,1))
% hold on 
% plot(ArmT2y(:,1))
% plot(ArmT3y(:,1))
% title("Arm C9 sensor Y axis accelerations")
% legend ("T1", "T2", "T3")
% 
% nexttile
% plot(ArmT1y(:,2))
% hold on 
% plot(ArmT2y(:,2))
% plot(ArmT3y(:,2))
% legend ('T1 thresholded', 'T2 thresholded', ' T3 thresholded')
% title("Arm C9 sensors Y axis thresholded accelerations")
% hold off
% 
% nexttile 
% plot(ArmT1z(:,1))
% hold on 
% plot(ArmT2z(:,1))
% plot(ArmT3z(:,1))
% title("Arm C9 sensor Z axis accelerations")
% legend ("T1", "T2", "T3")
% 
% nexttile
% plot(ArmT1z(:,2))
% hold on 
% plot(ArmT2z(:,2))
% plot(ArmT3z(:,2))
% legend ('T1 thresholded', 'T2 thresholded', ' T3 thresholded')
% title("Arm C9 sensors Z axis thresholded accelerations")
% hold off

%% SAVING DATA
T1 = table2array(T1); 
T2 = table2array(T2); 
T3 = table2array(T3); 

T1 = [T1 ArmT1x(:,2)];
T2 = [T2 2*ArmT2x(:,2)];
T3 = [T3 3*ArmT3x(:,2)]; 

% Training dataset
A = T1(1:round(length(T1)*0.8),:); 
B = T2(1:round(length(T2)*0.8),:); 
C = T1(1:round(length(T3)*0.8),:); 
Data_train = [A; B; C];

% Test dataset
D = T1(round(length(T1)*0.8):end,:); 
E = T2(1:round(length(T2)*0.8),:); 
F = T3(1:round(length(T3)*0.8),:); 
Data_test = [D; E; F]; 

%save('Data_train.mat') % saves the workspace
%save('Data_test.mat')

writematrix(Data_test, "data_test_allSubs.csv") % saves the matrix as a csv file
writematrix(Data_train, "data_train_allSubs.csv")







