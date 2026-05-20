% Load ECG signal data
% Assume signals E1, E2, E3 are in variables ecg_E1, ecg_E2, ecg_E3
% and the sampling rate is 128 Hz.
Fs = 128; % Sampling rate in Hz
T = 1/Fs; % Sampling interval

% Task 1: HR estimation and plot for noise-free signal E1
ecg_E1 = load('E1.mat'); % Replace 'E1.mat' with your actual data file
time = (0:length(ecg_E1)-1) * T;

% Find R-peaks (using a threshold or peak-detection algorithm)
[~, locs_E1] = findpeaks(ecg_E1, 'MinPeakHeight', mean(ecg_E1), 'MinPeakDistance', 0.6*Fs);

% Calculate heart rate
RR_intervals_E1 = diff(locs_E1) / Fs; % Time between peaks in seconds
HR_E1 = 60 ./ RR_intervals_E1; % Heart rate in bpm

% Interpolate to create HR as a function of time
time_HR_E1 = time(locs_E1(2:end)); % Time corresponding to HR values
HR_interp_E1 = interp1(time_HR_E1, HR_E1, time, 'linear', 'extrap');

% Plot HR for E1
figure;
plot(time, HR_interp_E1);
title('Heart Rate Estimation for Noise-Free Signal E1');
xlabel('Time (s)');
ylabel('Heart Rate (bpm)');
grid on;

% Task 2: Noise removal and HR estimation for E2 and E3
% Replace 'E2.mat' and 'E3.mat' with your actual data files
ecg_E2 = load('E2.mat');
ecg_E3 = load('E3.mat');

% Noise removal (e.g., bandpass filtering)
bpFilt = designfilt('bandpassiir', 'FilterOrder', 4, ...
    'HalfPowerFrequency1', 0.5, 'HalfPowerFrequency2', 45, ...
    'SampleRate', Fs);

ecg_E2_filtered = filtfilt(bpFilt, ecg_E2);
ecg_E3_filtered = filtfilt(bpFilt, ecg_E3);

% Find R-peaks for filtered signals
[~, locs_E2] = findpeaks(ecg_E2_filtered, 'MinPeakHeight', mean(ecg_E2_filtered), 'MinPeakDistance', 0.6*Fs);
[~, locs_E3] = findpeaks(ecg_E3_filtered, 'MinPeakHeight', mean(ecg_E3_filtered), 'MinPeakDistance', 0.6*Fs);

% Calculate HR for E2
RR_intervals_E2 = diff(locs_E2) / Fs;
HR_E2 = 60 ./ RR_intervals_E2;
time_HR_E2 = time(locs_E2(2:end));
HR_interp_E2 = interp1(time_HR_E2, HR_E2, time, 'linear', 'extrap');

% Calculate HR for E3
RR_intervals_E3 = diff(locs_E3) / Fs;
HR_E3 = 60 ./ RR_intervals_E3;
time_HR_E3 = time(locs_E3(2:end));
HR_interp_E3 = interp1(time_HR_E3, HR_E3, time, 'linear', 'extrap');

% Plot HR for E2
figure;
plot(time, HR_interp_E2);
title('Heart Rate Estimation for Noise-Filtered Signal E2');
xlabel('Time (s)');
ylabel('Heart Rate (bpm)');
grid on;

% Plot HR for E3
figure;
plot(time, HR_interp_E3);
title('Heart Rate Estimation for Noise-Filtered Signal E3');
xlabel('Time (s)');
ylabel('Heart Rate (bpm)');
grid on;