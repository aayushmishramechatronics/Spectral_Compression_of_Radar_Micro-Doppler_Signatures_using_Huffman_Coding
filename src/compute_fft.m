% ==============================================
% File: compute_fft.m
% Author: Aayush Mishra
% Project: Lossless Compression of Micro-Doppler Data
% Description: Compute and Display FFT Magnitude Spectrum
% ==============================================

function compute_fft(original, filtered, Fs, label)
    N = length(original);
    
    % Compute FFT for Original Signal
    fft_orig = fft(original);
    f = (0:N-1) * (Fs/N);
    mag_orig = abs(fft_orig) / N;
    mag_orig = mag_orig(1:N/2+1);
    mag_orig(2:end-1) = 2*mag_orig(2:end-1);
    f = f(1:N/2+1);
    
    % Compute FFT for Filtered Signal
    fft_filt = fft(filtered);
    mag_filt = abs(fft_filt) / N;
    mag_filt = mag_filt(1:N/2+1);
    mag_filt(2:end-1) = 2*mag_filt(2:end-1);
    
    % Plot FFT Spectra
    figure('Name', ['FFT Spectrum - ' label], 'NumberTitle', 'off');
    
    subplot(2,1,1);
    plot(f, mag_orig, 'b', 'LineWidth', 1.5);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title([label ' - Original Signal FFT']);
    grid on;
    xlim([0 800]);
    
    subplot(2,1,2);
    plot(f, mag_filt, 'r', 'LineWidth', 1.5);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title([label ' - Filtered Signal FFT']);
    grid on;
    xlim([0 800]);
    
    % Find and Annotate Peak Frequencies in Filtered Signal
    [peaks, locs] = findpeaks(mag_filt, 'MinPeakHeight', max(mag_filt)*0.3, 'NPeaks', 3);
    hold on;
    plot(f(locs), peaks, 'ro', 'MarkerSize', 8, 'LineWidth', 2);
    for i = 1:length(locs)
        text(f(locs(i)), peaks(i), sprintf('  %.1f Hz', f(locs(i))), ...
             'VerticalAlignment', 'bottom', 'FontSize', 9);
    end
    hold off;
    
    fprintf('  - FFT Computed for %s Signal\n', label);
    fprintf('  - Key Frequency Peaks Annotated\n');
end
