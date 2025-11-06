% ==============================================
% File: generate_signals.m
% Author: Aayush Mishra
% Project: Lossless Compression of Micro-Doppler Data
% Description: Generate Synthetic micro-Doppler Signals for Bird and Drone
% ==============================================

function [bird_signal, drone_signal, Fs] = generate_signals()
    % Sampling parameters
    Fs = 2000;              % Sampling Frequency (Hz)
    T = 2;                  % Duration (Seconds)
    t = 0:1/Fs:T-1/Fs;      % Time Vector
    N = length(t);          % Number of Samples
    
    % Bird Signal Parameters (Low-Frequency Wing Flaps)
    f_bird = 8;             % Wing Flap Frequency (Hz)
    f_carrier = 500;        % Carrier Frequency (Hz)
    A_bird = 1;             % Amplitude
    
    % Drone Signal Parameters (High-Frequency Propeller Modulation)
    f_drone = 40;           % Propeller Modulation Frequency (Hz)
    A_drone = 1;            % Amplitude
    
    % Generate Bird Signal: Low-Frequency Sinusoidal Modulation
    bird_signal = A_bird * sin(2*pi*f_carrier*t) .* (1 + 0.5*sin(2*pi*f_bird*t));
    
    % Generate Drone Signal: High-Frequency Propeller Modulation
    drone_signal = A_drone * sin(2*pi*f_carrier*t) .* (1 + 0.5*sin(2*pi*f_drone*t));
    
    % Add White Gaussian Noise (SNR ≈ 25 dB)
    snr_db = 25;
    bird_signal = awgn(bird_signal, snr_db, 'measured');
    drone_signal = awgn(drone_signal, snr_db, 'measured');
    
    % Plot Both Signals
    figure('Name', 'Generated Micro-Doppler Signals', 'NumberTitle', 'off');
    
    subplot(2,1,1);
    plot(t, bird_signal, 'b', 'LineWidth', 1);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Bird Signal (Wing Flap ~8 Hz)');
    grid on;
    xlim([0 0.5]);  % Show First 0.5 Seconds for Clarity
    
    subplot(2,1,2);
    plot(t, drone_signal, 'r', 'LineWidth', 1);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Drone Signal (Propeller ~ 40 Hz)');
    grid on;
    xlim([0 0.5]);  % Show First 0.5 Seconds for Clarity
    
    fprintf('  - Bird Signal: %.1f Hz Modulation, Fs = %d Hz\n', f_bird, Fs);
    fprintf('  - Drone Signal: %.1f Hz Modulation, Fs = %d Hz\n', f_drone, Fs);
    fprintf('  - SNR: %d dB\n', snr_db);
end
