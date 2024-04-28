% Split Data to Test and Train from 3 separate feature_table_WL%d_WInc%d.mat
% WL100,WInc 20 | WL150,WInc 30 | WL200, WInc40 |
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

% Define feature table files with corresponding names
feature_files = {'feature_table_WL100_WInc20.mat', 'feature_table_WL150_WInc30.mat', 'feature_table_WL200_WInc40.mat'};
file_names = {'WL100_WInc20', 'WL150_WInc30', 'WL200_WInc40'};

for i = 1:length(feature_files)
    % Load feature table
    load(fullfile(data_path, feature_files{i}));

    % Shuffle the data to ensure randomness
    shuffled_data = feature_table(randperm(size(feature_table, 1)), :);

    % Determine the number of samples for training and testing
    num_samples = size(shuffled_data, 1);
    num_train_samples = round(train_ratio * num_samples);

    % Split the data into training and testing sets
    train_data = shuffled_data(1:num_train_samples, :);
    test_data = shuffled_data(num_train_samples+1:end, :);

    % Save training and testing data with corresponding names
    train_file_name = fullfile(train_folder, ['train_data_' file_names{i} '.mat']);
    test_file_name = fullfile(test_folder, ['test_data_' file_names{i} '.mat']);

    save(train_file_name, 'train_data');
    save(test_file_name, 'test_data');
end
