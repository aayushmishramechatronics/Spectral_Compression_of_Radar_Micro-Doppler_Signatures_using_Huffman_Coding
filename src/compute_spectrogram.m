% ==============================================
% File: compute_spectrogram.m
% Author: Aayush Mishra
% Project: Lossless Compression of Micro-Doppler Data
% Description: Generate and Display Signal Spectrogram
% ==============================================

function compute_spectrogram(signal, Fs, label)
    % Spectrogram Parameters
    window = hamming(256);      % Window Function
    noverlap = 200;             % Overlap Samples
    nfft = 512;                 % FFT Points
    
    % Compute Spectrogram
    figure('Name', ['Spectrogram - ' label], 'NumberTitle', 'off');
    spectrogram(signal, window, noverlap, nfft, Fs, 'yaxis');
    title(['Spectrogram: ' label]);
    colorbar;
    ylabel('Frequency (Hz)');
    xlabel('Time (s)');
    ylim([0 800]);
    
    fprintf('  - Spectrogram Generated for %s\n', label);
    fprintf('  - Window: Hamming (256), Overlap: 200, NFFT: 512\n');
end
