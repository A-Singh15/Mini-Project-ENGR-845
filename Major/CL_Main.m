% Based on the Example, code in this section to plot the raw data that was collected
% Load accelerometer data

data = readmatrix('accel_data.csv');

% Extract accelerometer data for each axis
accel_x = data(:, 1);
accel_y = data(:, 2);
accel_z = data(:, 3);

% Define window length (wl) and window increment (wi)
wl = 200; % window length
wi = 20;  % window increment

% Initialize variables for feature matrices
num_windows = floor((size(data, 1) - wl) / wi);
X_axis = zeros(num_windows, 1);
Y_axis = zeros(num_windows, 1);
Z_axis = zeros(num_windows, 1);

% Perform feature extraction for each window
start_idx = 1;
end_idx = wl;
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
    start_idx = start_idx + wi;
    end_idx = end_idx + wi;
end

% Define labels for each movement class
walking_label = repmat({'Walking'}, num_windows/4, 1);       % Movement class 1 (Walking)
running_label = repmat({'Running'}, num_windows/4, 1);       % Movement class 2 (Running)
dancing_label = repmat({'Dancing'}, num_windows/4, 1);       % Movement class 3 (Dancing)
standing_label = repmat({'Standing'}, num_windows/4, 1);     % Movement class 4 (Standing)
labels = vertcat(walking_label, running_label, dancing_label, standing_label); % Estimated class labels for features

% Combine features and labels into a table
feature_table = table(X_axis, Y_axis, Z_axis, labels);

% Save the feature table
save('feature_table.mat', 'feature_table');
