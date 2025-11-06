% ==============================================
% File: main.m
% Author: Aayush Mishra
% Project: Lossless Compression of Micro-Doppler Data
% Description: Main Driver Script for the DSP Pipeline
% ==============================================

clear all; close all; clc;

fprintf('========================================================\n');
fprintf('Lossless Compression of Micro-Doppler Sensor Data\n');
fprintf('Drone/Bird Classification Radar System\n');
fprintf('========================================================\n\n');

%% 1. Generating the Signals 
fprintf('Generating micro-Doppler Signals\n');
[bird_signal, drone_signal, Fs] = generate_signals();

%% 2. Designing the Filter 
fprintf('\nDesigning Butterworth Band-Pass Filter\n');
[b, a] = design_filter(Fs);

%% 3. Applying Filter to Both Signals
fprintf('\nApplying Filter to Signals\n');
bird_filtered = apply_filter(bird_signal, b, a);
drone_filtered = apply_filter(drone_signal, b, a);

%% 4. Computing Fast-Fourier Transform
fprintf('\nComputing FFT Spectra\n');
compute_fft(bird_signal, bird_filtered, Fs, 'Bird');
compute_fft(drone_signal, drone_filtered, Fs, 'Drone');

%% 5. Computing the Spectrogram for Both
fprintf('\nComputing Spectrograms\n');
compute_spectrogram(bird_filtered, Fs, 'Bird (Filtered)');
compute_spectrogram(drone_filtered, Fs, 'Drone (Filtered)');

%% 6. Cross-Correlation for Analysing and Comparing the Signals 
fprintf('\nPerforming Cross-Correlation Analysis\n');
cross_correlation(bird_filtered, drone_filtered);

%% 7. Quantized Signal (Using Bird Signal for Compression Demo)
fprintf('\nQuantizing Filtered Bird Signal\n');
[quantized, symbols] = quantize_signal(bird_filtered);

%% 8. Huffman Encoding
fprintf('\nApplying Huffman Encoding\n');
[encoded, dict, stats] = huffman_encode(quantized, symbols);

%% 9. Huffman Decoding 
fprintf('\nDecoding Huffman-Encoded Signal\n');
decoded = huffman_decode(encoded, dict);

%% 10. Plotting the Reconstruction Results
fprintf('\nPlotting Reconstruction Results\n');
plot_results(bird_filtered, decoded);

%% 11. Displaying the Summary Report
fprintf('\nGenerating Summary\n');
summary_report(stats);

fprintf('\n========================================================\n');
fprintf('Project Execution Successful!\n');
fprintf('========================================================\n');

