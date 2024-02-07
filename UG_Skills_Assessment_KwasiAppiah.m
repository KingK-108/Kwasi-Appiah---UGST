%% UG
% Skills Test
% Kwasi Appiah
%% 1
load ("UG_Skills_Test.mat")
UGST = UGSkillsTest;
%% 2
Right_eye_X = UGST.Right_Eye_X;
Right_eye_Y = UGST.Right_Eye_Y;
Left_eye_X = UGST.Left_Eye_X;
Left_eye_Y = UGST.Left_Eye_Y;
Time = UGST.Time_s;
%% 3 Generating calibration coefficent for each eye
r_5 = UGST(1:216,2:3); 
r_10 = UGST(217:429,2:3); 
r_15 = UGST(430:641, 2:3);  
l_5 = UGST(642:855,4:5);
l_10 = UGST(856:1069, 4:5);
l_15 = UGST(1070:1283, 4:5);
% Creating pixel values from extracted raw data(Despite the fact that there
% is no image to reference to in the handle, I can try and use this
% fucntion to extract the 6 pixel numbers.
% pr_5 = 
% pr_10 = 
% pr_15 = 
% pl_5 = 
% pl_10 = 
% pl_15 = 
% Finding a value to multiply any pixel number by to get prism diopters
% calibration_coefficient = ;
% pos = getpixelposition(p_5, "isrecursive");
% Parent object would be 
% I would use a for loop for this part. Iterating 3 times for each eye. 
% Converting calibration section to pixel value
% Converting raw pixel position to prism diopter
%% 4
% Filter data using butterworth filter
Order = 3;
fc = 1;
fs = 70;
[b,a] = butter(3,fc/(fs/2));
plot(b,a)
%% 5
% Center data around 0
N_RX = normalize(Right_eye_X, "center"); 
N_RY = normalize(Right_eye_Y, "center");
N_LX = normalize(Left_eye_X, "center");
N_LY = normalize(Left_eye_Y, "center");
%% 6
% Calibration using coefficeints
% d = newUnit("prism_diopter",(calibration_coefficeint).*(pos));
% disp(d)
%% 7
% Final Data
fdx = Right_eye_X - Left_eye_X;
fdy= Right_eye_Y - Left_eye_Y;
%% 8a(Figure 1)
figure(1);
subplot(2,2,1)
plot(Time, N_RY,"r-")
yyaxis("left")
title("Centered Data (Right Eye)")
xlabel("Centered X positions")
ylabel("Centered Y positions")
yyaxis("right")
hold on
plot(Time, N_RX,"r-")
yyaxis("left")
title("Centered Data (Right Eye)")
xlabel("Centered X positions")
ylabel("Centered Y positions")
plot(Time,N_LY,"b-")
yyaxis("right")
title("Centered Data")
xlabel("Centered X Positions")
ylabel("Centerd Y Positions")
plot(Time,N_LX, "b-")
yyaxis("right")
title("Centered Data")
xlabel("Centered X Positions")
ylabel("Centerd Y Positions")
subplot(2,2,2)
plot(Time, Right_eye_X,"r-")
yyaxis("left")
title("Raw Data")
xlabel("X positions")
ylabel("Y positions")
plot(Time, Right_eye_Y,"r-")
yyaxis("left")
xlabel("X positions")
ylabel("Y positions")
plot(Time, Left_eye_Y,"b-")
yyaxis("right")
xlabel("X positions")
ylabel("Y positions")
title("Raw Data")
plot(Time, Left_eye_X,"b-")
yyaxis("right")
xlabel("X positions")
ylabel("Y positions")
title("Raw Data")
subplot(2,2,3)
plot(b,a);
title("Filtered Data")
xlabel("X positions")
ylabel("Y positions")
hold off
% subplot(2,2,4)
% plot()
% xlabel("Calibrated X Positions")
% ylabel("Calibrated Y Positions")
% title("Calibrated Data (Right Eye)")
% yyaxis("left")
% plot()

%% 8b) Final Plots(Figure 2)
figure(2);
plot(fdx,fdy)
xlabel("Final X")
ylabel("Final Y")
legend("Final Data")


