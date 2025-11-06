% ==============================================
% File: apply_filter.m
% Author: Aayush Mishra
% Project: Lossless Compression of Micro-Doppler Data
% Description: Apply Designed Filter to Input Signal
% ==============================================

function filtered = apply_filter(signal, b, a)
    % Apply Zero-Phase Digital Filtering
    filtered = filtfilt(b, a, signal);
    
    % Plot Original vs Filtered Signal
    t = (0:length(signal)-1) / 2000;  % Time vector (assuming Fs=2000)
    
    figure('Name', 'Filter Application', 'NumberTitle', 'off');
    
    subplot(2,1,1);
    plot(t, signal, 'b', 'LineWidth', 1);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Original Signal');
    grid on;
    xlim([0 0.5]);
    
    subplot(2,1,2);
    plot(t, filtered, 'r', 'LineWidth', 1);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Filtered Signal');
    grid on;
    xlim([0 0.5]);
    
    fprintf('  - Filtering Completed using filtfilt (zero-phase)\n');
end
