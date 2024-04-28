% Split Data to Test and Train from 3 separate feature_table_WL%d_WInc%d.mat
% WL100,WInc 20 | WL150,WInc 30 | WL200, WInc40 |
% Define paths will be need to changed for feature type base
load('feature_table.mat');

% Define paths
data_path = 'Data';
train_folder = fullfile(data_path, 'train');
test_folder = fullfile(data_path, 'test');

% Create train and test folders if they don't exist
if ~exist(train_folder, 'dir')
    mkdir(train_folder);
end
if ~exist(test_folder, 'dir')
    mkdir(test_folder);
end

% Define the ratio of data for training  (70%  to 30% test split)
train_ratio = 0.7;

% Iterate over each activity class
activity_classes = unique(feature_table.labels);
for i = 1:length(activity_classes)
    activity = activity_classes{i};
    
    % Filter data for the current activity
    indices = strcmp(feature_table.labels, activity);
    activity_data = feature_table(indices, :);
    
    % Shuffle the data to ensure randomness
    shuffled_data = activity_data(randperm(size(activity_data, 1)), :);
    
    % Split the data into training and testing sets
    num_samples = size(shuffled_data, 1);
    num_train_samples = round(train_ratio * num_samples);
    num_test_samples = num_samples - num_train_samples;
    
    train_data = shuffled_data(1:num_train_samples, :);
    test_data = shuffled_data(num_train_samples+1:end, :);
    
    % Save training and testing data for the current activity
    train_file_name = fullfile(train_folder, [activity '_train.mat']);
    test_file_name = fullfile(test_folder, [activity '_test.mat']);
    
    save(train_file_name, 'train_data');
    save(test_file_name, 'test_data');
end
