# ENGR 845 Mini Project Assignment: Human Activity Classification Using Smartphone Data - Aaron Singh

## Introduction
The purpose of this assignment is to gain hands-on experience with the concepts taught in the ENGR 845 class, including human data processing, feature engineering, pattern classification, and parameter tuning.

## References
- Canvas -> Mini Project -> Reference Materials -> Collect Accelerometer Data from Smartphone (For Use in Matlab)
- Canvas -> Mini Project -> Reference Materials -> Adding Machine Learning to Signal Processing Application
- Canvas -> Mini Project -> Reference Materials -> EMG PR code 2.0
- Canvas -> Weekly Lecture Slides
- Professor Yuriah

## Project Organization
- The `Img` folder contains all the screenshots for the required Mini Project.

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
