%% Simple feature extraction
% Data collected from smartphone accelerometer 
% Below code converts the csv data to mat with label data and windows
% lenght will need to be changed I changed it to 100, 150, 200 and window
% increment will need to be changed I changed i to 20, 30 and 40.

% Load accelerometer data
data = readmatrix('Data\accel_data_labeled.csv');

% Extract accelerometer data for each axis
accel_x = data(:, 1);
accel_y = data(:, 2);
accel_z = data(:, 3);

% Define window length (WL) and window increment (WInc)
WL = 200; % window length will need to be changed I changed it to 100 150 and 200
WInc = 40;  % window increment will need to be changed I changed it to 20 30 40


% Initialize variables for feature matrices
num_windows = floor((size(data, 1) - WL) / WInc);
X_axis = zeros(num_windows, 1);
Y_axis = zeros(num_windows, 1);
Z_axis = zeros(num_windows, 1);

% Perform feature extraction for each window
for i = 1:num_windows
    % Extract windowed data for each axis
    window_x = accel_x((i-1)*WInc + 1 : (i-1)*WInc + WL);
    window_y = accel_y((i-1)*WInc + 1 : (i-1)*WInc + WL);
    window_z = accel_z((i-1)*WInc + 1 : (i-1)*WInc + WL);

    % Calculate mean for each axis
    X_axis(i) = mean(window_x);
    Y_axis(i) = mean(window_y);
    Z_axis(i) = mean(window_z);
end

% Combine features into a table
feature_table = table(X_axis, Y_axis, Z_axis);

% Save the feature table
% Save the feature table with WL and WInc in the filename
output_filename = sprintf('feature_table_WL%d_WInc%d.mat', WL, WInc);
save(output_filename, 'feature_table');
