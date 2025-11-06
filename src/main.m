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

%% 1. GENERATE SIGNALS
fprintf('Step 1: Generating micro-Doppler Signals\n');
[bird_signal, drone_signal, Fs] = generate_signals();

%% 2. DESIGN FILTER
fprintf('\nStep 2: Designing Butterworth Band-Pass Filter\n');
[b, a] = design_filter(Fs);

%% 3. APPLY FILTER TO BOTH SIGNALS
fprintf('\nStep 3: Applying Filter to Signals\n');
bird_filtered = apply_filter(bird_signal, b, a);
drone_filtered = apply_filter(drone_signal, b, a);

%% 4. COMPUTE FFT
fprintf('\nStep 4: Computing FFT Spectra\n');
compute_fft(bird_signal, bird_filtered, Fs, 'Bird');
compute_fft(drone_signal, drone_filtered, Fs, 'Drone');

%% 5. COMPUTE SPECTROGRAM
fprintf('\nStep 5: Computing Spectrograms\n');
compute_spectrogram(bird_filtered, Fs, 'Bird (Filtered)');
compute_spectrogram(drone_filtered, Fs, 'Drone (Filtered)');

%% 6. CROSS-CORRELATION ANALYSIS
fprintf('\nStep 6: Performing Cross-Correlation Analysis\n');
cross_correlation(bird_filtered, drone_filtered);

%% 7. QUANTIZE SIGNAL (Using Bird Signal for Compression Demo)
fprintf('\nStep 7: Quantizing Filtered Bird Signal\n');
[quantized, symbols] = quantize_signal(bird_filtered);

%% 8. HUFFMAN ENCODING
fprintf('\nStep 8: Applying Huffman Encoding\n');
[encoded, dict, stats] = huffman_encode(quantized, symbols);

%% 9. HUFFMAN DECODING
fprintf('\nStep 9: Decoding Huffman-Encoded Signal\n');
decoded = huffman_decode(encoded, dict);

%% 10. PLOT RECONSTRUCTION RESULTS
fprintf('\nStep 10: Plotting Reconstruction Results\n');
plot_results(bird_filtered, decoded);

%% 11. DISPLAY SUMMARY REPORT
fprintf('\nStep 11: Generating Summary\n');
summary_report(stats);

fprintf('\n========================================================\n');
fprintf('Project Execution Successful!\n');
fprintf('========================================================\n');

