# ENGR 845 Mini Project Assignment: Human Activity Classification Using Smartphone Data - Aaron Singh
![Activities Model](https://github.com/A-Singh15/Mini-Project-ENGR-845/blob/main/img/raw%202.png)

## Introduction
The purpose of this assignment is to gain hands-on experience with the concepts taught in the ENGR 845 class, including human data processing, feature engineering, pattern classification, and parameter tuning.

## References
- Canvas -> Mini Project -> Reference Materials -> Collect Accelerometer Data from Smartphone (For Use in Matlab)
- Canvas -> Mini Project -> Reference Materials -> Adding Machine Learning to Signal Processing Application
- Canvas -> Mini Project -> Reference Materials -> EMG PR code 2.0
- Canvas -> Weekly Lecture Slides
- Professor Yuriah

## Project Organization
- The `img` folder contains all the screenshots for the required Mini Project.
- The `data` folder contains all the data for the required Mini Project.
- The file `ENGR_845_MiniProject_Guideline.mlx` has all the required scripts and code for the Mini Project.
## Data Collection
In this assignment, 3-axis acceleration data from an *Android 13 Samsung A51 5G* for at least three different classes of human activities are collected from yourself. The motions are walking, running, dancing, and standing.

**Data Collection Procedure:**
1. **Placement of the Device:** The device is placed on the waist pocket of the body, ensuring consistency throughout the data collection procedure.
2. **Number of Trials:** At least two trials are collected for each activity, with each trial lasting at least 5 seconds.
3. **Sampling Frequency:** The sampling frequency for data collection needs to be specified.
4. **Experimental Procedure:** Each trial starts and ends after the predefined duration. Data from each trial is saved in CSV structured files based on each activity.

## Dataset Preparation
In this assignment, the dataset is located in the `Data` folder. For each activity class, there are 12 files stored in the folder. The dataset is partitioned into training and testing sets, stored in the `train` and `test` folders, respectively.

## Raw Data Visualization
Below is MATLAB code to plot some example trials for the activities:

```matlab
% MATLAB code for raw data visualization
% Based on the Example, code in this section to plot the raw data that was collected
% Load the acceleration data
data = readmatrix('Data\accel_data.csv');

% Assuming the data contains x, y, and z acceleration in three columns
x_accel = data(:, 1);
y_accel = data(:, 2);
z_accel = data(:, 3);

% Plot the x, y, and z acceleration data
figure;

% Plot x acceleration
subplot(3, 1, 1);
plot(x_accel);
title('X Acceleration');
xlabel('Time');
ylabel('Acceleration');

% Plot y acceleration
subplot(3, 1, 2);
plot(y_accel);
title('Y Acceleration');
xlabel('Time');
ylabel('Acceleration');

% Plot z acceleration
subplot(3, 1, 3);
plot(z_accel);
title('Z Acceleration');
xlabel('Time');
ylabel('Acceleration');
```
![Raw Data](https://github.com/A-Singh15/Mini-Project-ENGR-845/raw/main/img/raw_data.png)
## Conclusion
This outlines the steps followed for the ENGR 845 Mini Project Assignment, including data collection, dataset preparation, raw data visualization, feature extraction, and conclusion. Further analysis and experimentation with different parameter combinations and classification algorithms will be conducted as part of the project.
