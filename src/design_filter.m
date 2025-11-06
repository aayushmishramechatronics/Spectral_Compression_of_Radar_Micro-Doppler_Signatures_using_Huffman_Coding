% ==============================================
% File: design_filter.m
% Author: Aayush Mishra
% Project: Lossless Compression of Micro-Doppler Data
% Description: Design Butterworth Band-Pass IIR Filter
% ==============================================

function [b, a] = design_filter(Fs)
    % Filter specifications
    order = 4;                  % Filter Order
    f_low = 400;                % Lower Cutoff Frequency (Hz)
    f_high = 600;               % Upper Cutoff Frequency (Hz)
    
    % Normalize Frequencies to Nyquist Frequency
    Wn = [f_low f_high] / (Fs/2);
    
    % Design Butterworth Band-Pass Filter
    [b, a] = butter(order, Wn, 'bandpass');
    
    % Plot Frequency Response
    figure('Name', 'Filter Design', 'NumberTitle', 'off');
    
    % Magnitude and Phase Response
    subplot(2,2,1);
    freqz(b, a, 1024, Fs);
    title('Frequency Response');
    grid on;
    
    % Pole-Zero Plot
    subplot(2,2,2);
    zplane(b, a);
    title('Pole-Zero Plot');
    grid on;
    
    % Magnitude Response (Linear Scale)
    [H, f] = freqz(b, a, 1024, Fs);
    subplot(2,2,3);
    plot(f, abs(H), 'LineWidth', 2);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Magnitude Response');
    grid on;
    xline(f_low, '--r', 'Lower Cutoff');
    xline(f_high, '--r', 'Upper Cutoff');
    
    % Phase Response
    subplot(2,2,4);
    plot(f, angle(H)*180/pi, 'LineWidth', 2);
    xlabel('Frequency (Hz)');
    ylabel('Phase (degrees)');
    title('Phase Response');
    grid on;
    
    fprintf('  - Filter type: Butterworth Band-Pass\n');
    fprintf('  - Order: %d\n', order);
    fprintf('  - Passband: %d - %d Hz\n', f_low, f_high);
end
