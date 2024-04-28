%% Simple feature extraction
% Data collected from smartphone accelerometer 
% Below code converts the csv data to mat with label data and windows
% lenght will need to be changed I changed it to 100, 150, 200 and window
% increment will need to be changed I changed i to 20, 30 and 40.

% Load accelerometer data
data = readmatrix('Data\accel_data.csv');

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
start_idx = 1;
end_idx = WL;
for i = 1:num_windows
    % Extract windowed data for each axis
    window_x = accel_x(start_idx:end_idx);
    window_y = accel_y(start_idx:end_idx);
    window_z = accel_z(start_idx:end_idx);
    
    % Calculate mean for each axis
    X_axis(i) = mean(window_x);
    Y_axis(i) = mean(window_y);
    Z_axis(i) = mean(window_z);
    
    % Update indices for next window
    start_idx = start_idx + WInc;
    end_idx = end_idx + WInc;
end

% Define labels for each movement class
walking_label = repmat({'Walking'}, num_windows/4, 1);       % Movement class 1 (Walking)
running_label = repmat({'Running'}, num_windows/4, 1);       % Movement class 2 (Running)
dancing_label = repmat({'Dancing'}, num_windows/4, 1);       % Movement class 3 (Dancing)
standing_label = repmat({'Standing'}, num_windows/4, 1);     % Movement class 4 (Standing)
labels = vertcat(walking_label, running_label, dancing_label, standing_label); %  Estimated class labels for features

% Combine features and labels into a table
feature_table = table(X_axis, Y_axis, Z_axis, labels);

% Save the feature table with WL and WInc in the filename
output_filename = sprintf('feature_table_WL%d_WInc%d.mat', WL, WInc);
save(output_filename, 'feature_table');
