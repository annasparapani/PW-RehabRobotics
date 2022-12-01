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

ArmT1x_sub1 = T1.Axel_X_C9(T1.Subject==1); 
ArmT1x_sub2 = T1.Axel_X_C9(T1.Subject==2); 
ArmT1x_sub3 = T1.Axel_X_C9(T1.Subject==3); 
ArmT1x_sub4 = T1.Axel_X_C9(T1.Subject==4); 
ArmT1x_sub5 = T1.Axel_X_C9(T1.Subject==5); 

ArmT2x_sub1 = T2.Axel_X_C9(T2.Subject==1); 
ArmT2x_sub2 = T2.Axel_X_C9(T2.Subject==2); 
ArmT2x_sub3 = T2.Axel_X_C9(T2.Subject==3); 
ArmT2x_sub4 = T2.Axel_X_C9(T2.Subject==4); 
ArmT2x_sub5 = T2.Axel_X_C9(T2.Subject==5); 

ArmT3x_sub1 = T3.Axel_X_C9(T3.Subject==1); 
ArmT3x_sub2 = T3.Axel_X_C9(T3.Subject==2); 
ArmT3x_sub3 = T3.Axel_X_C9(T3.Subject==3); 
ArmT3x_sub4 = T3.Axel_X_C9(T3.Subject==4); 
ArmT3x_sub5 = T3.Axel_X_C9(T3.Subject==5); 


%% THRESHOLD APPLICATION on X axis 
% in this way, the "break" from the movement is brought to 0 
% however, due to the different ranges of the accelerations in the three
% tasks the third task is penalized
% -> necessary to use a hard coded threshold to perform the same
% transformations also in the online application (cannot compute the
% baseline, disntiguish the shape etc.) 

% TASK 1 [SUB 1]
lower_threshold = 0;
upper_threshold = 1.5;

for i=1:length(ArmT1x_sub1(:,1))
    if(ArmT1x_sub1(i)>lower_threshold && ArmT1x_sub1(i)<upper_threshold)
        ArmT1x_sub1(i,2)=0;
    else ArmT1x_sub1(i,2)=1; 
    end
end

% TASK 1 [SUB 2]
lower_threshold = -0.5;
upper_threshold = 1;

for i=1:length(ArmT1x_sub2(:,1))
    if(ArmT1x_sub2(i)>lower_threshold && ArmT1x_sub2(i)<upper_threshold)
        ArmT1x_sub2(i,2)=0;
    else ArmT1x_sub2(i,2)=1; 
    end
end

% TASK 1 [SUB 3]
lower_threshold = -1;
upper_threshold = 1.2;

for i=1:length(ArmT1x_sub3(:,1))
    if(ArmT1x_sub3(i)>lower_threshold && ArmT1x_sub3(i)<upper_threshold)
        ArmT1x_sub3(i,2)=0;
    else ArmT1x_sub3(i,2)=1; 
    end
end

% TASK 1 [SUB 4]
lower_threshold = 1.5;
upper_threshold = 3;

for i=1:length(ArmT1x_sub4(:,1))
    if(ArmT1x_sub4(i)>lower_threshold && ArmT1x_sub4(i)<upper_threshold)
        ArmT1x_sub4(i,2)=0;
    else ArmT1x_sub4(i,2)=1; 
    end
end

% TASK 1 [SUB 5]
lower_threshold = 0.2;
upper_threshold = 1.2;

for i=1:length(ArmT1x_sub5(:,1))
    if(ArmT1x_sub5(i)>lower_threshold && ArmT1x_sub5(i)<upper_threshold)
        ArmT1x_sub5(i,2)=0;
    else ArmT1x_sub5(i,2)=1; 
    end
end

% TASK 2 [SUB 1]
lower_threshold = -0.5;
upper_threshold = 0.5;

for i=1:length(ArmT2x_sub1(:,1))
    if(ArmT2x_sub1(i)>lower_threshold && ArmT2x_sub1(i)<upper_threshold)
        ArmT2x_sub1(i,2)=0;
    else ArmT2x_sub1(i,2)=1; 
    end
end

% TASK 2 [SUB 2]
lower_threshold = -2;
upper_threshold = -0.5;

for i=1:length(ArmT2x_sub2(:,1))
    if(ArmT2x_sub2(i)>lower_threshold && ArmT2x_sub2(i)<upper_threshold)
        ArmT2x_sub2(i,2)=0;
    else ArmT2x_sub2(i,2)=1; 
    end
end

% TASK 2 [SUB 3]
lower_threshold = -1.5;
upper_threshold = 0.7;

for i=1:length(ArmT2x_sub3(:,1))
    if(ArmT2x_sub3(i)>lower_threshold && ArmT2x_sub3(i)<upper_threshold)
        ArmT2x_sub3(i,2)=0;
    else ArmT2x_sub3(i,2)=1; 
    end
end

% TASK 2 [SUB 4]
lower_threshold = -1;
upper_threshold = 1.5;

for i=1:length(ArmT2x_sub4(:,1))
    if(ArmT2x_sub4(i)>lower_threshold && ArmT2x_sub4(i)<upper_threshold)
        ArmT2x_sub4(i,2)=0;
    else ArmT2x_sub4(i,2)=1; 
    end
end

% TASK 2 [SUB 5]
lower_threshold = -0.5;
upper_threshold = 0.7;

for i=1:length(ArmT2x_sub5(:,1))
    if(ArmT2x_sub5(i)>lower_threshold && ArmT2x_sub5(i)<upper_threshold)
        ArmT2x_sub5(i,2)=0;
    else ArmT2x_sub5(i,2)=1; 
    end
end

% TASK 3 [SUB 1]
lower_threshold = -4;
upper_threshold = -2.2;

for i=1:length(ArmT3x_sub1(:,1))
    if(ArmT3x_sub1(i)>lower_threshold && ArmT3x_sub1(i)<upper_threshold)
        ArmT3x_sub1(i,2)=0;
    else ArmT3x_sub1(i,2)=1; 
    end
end

% TASK 3 [SUB 2]
lower_threshold = -1.5;
upper_threshold = 0.2;

for i=1:length(ArmT3x_sub2(:,1))
    if(ArmT3x_sub2(i)>lower_threshold && ArmT3x_sub2(i)<upper_threshold)
        ArmT3x_sub2(i,2)=0;
    else ArmT3x_sub2(i,2)=1; 
    end
end

% TASK 3 [SUB 3]
lower_threshold = -1.5;
upper_threshold = 0;

for i=1:length(ArmT3x_sub3(:,1))
    if(ArmT3x_sub3(i)>lower_threshold && ArmT3x_sub3(i)<upper_threshold)
        ArmT3x_sub3(i,2)=0;
    else ArmT3x_sub3(i,2)=1; 
    end
end

% TASK 3 [SUB 4]
lower_threshold = 0;
upper_threshold = 0.7;

for i=1:length(ArmT3x_sub4(:,1))
    if(ArmT3x_sub4(i)>lower_threshold && ArmT3x_sub4(i)<upper_threshold)
        ArmT3x_sub4(i,2)=0;
    else ArmT3x_sub4(i,2)=1; 
    end
end

% TASK 3 [SUB 5]
lower_threshold = -3;
upper_threshold = 1;

for i=1:length(ArmT3x_sub5(:,1))
    if(ArmT3x_sub5(i)>lower_threshold && ArmT3x_sub5(i)<upper_threshold)
        ArmT3x_sub5(i,2)=0;
    else ArmT3x_sub5(i,2)=1; 
    end
end

%% concatenate all different subjects together
ArmT1x=[ArmT1x_sub1;ArmT1x_sub2;ArmT1x_sub3; ArmT1x_sub4;ArmT1x_sub5];
ArmT2x=[ArmT2x_sub1;ArmT2x_sub2;ArmT2x_sub3; ArmT2x_sub4;ArmT2x_sub5];
ArmT3x=[ArmT3x_sub1;ArmT3x_sub2;ArmT3x_sub3; ArmT3x_sub4;ArmT3x_sub5];


%% Graph of the thresholded and not thresholded data to compare
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


%% SAVING DATA

% remove the subject information (leave just the data) 
T1(:, end) = []; 
T2(:, end) = []; 
T3(:, end) = []; 

T1 = table2array(T1); 
T2 = table2array(T2); 
T3 = table2array(T3); 

T1 = [T1 ArmT1x(:,2)];
T2 = [T2 2*ArmT2x(:,2)];
T3 = [T3 3*ArmT3x(:,2)]; 

Entire_dataset=[T1;T2;T3];

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

writematrix(Entire_dataset,"data_entire_eachSub.csv")
writematrix(Data_test, "data_test_eachSub.csv") % saves the matrix as a csv file
writematrix(Data_train, "data_train_eachSub.csv")







