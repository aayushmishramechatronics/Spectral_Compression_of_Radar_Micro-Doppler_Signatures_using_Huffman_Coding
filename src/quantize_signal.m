% ==============================================
% File: quantize_signal.m
% Author: Aayush Mishra
% Project: Lossless Compression of Micro-Doppler Data
% Description: Quantize Signal to 8-Bit Levels (256 Levels)
% ==============================================

function [quantized, symbols] = quantize_signal(signal)
    % Quantization Parameters
    num_levels = 256;       % 8-Bit Quantization
    
    % Normalize Signal to [0, 1]
    signal_norm = (signal - min(signal)) / (max(signal) - min(signal));
    
    % Quantize to num_levels
    quantized = round(signal_norm * (num_levels - 1));
    
    % Get Unique Symbols
    symbols = unique(quantized);
    
    % Plot Histogram of Quantized Values
    figure('Name', 'Signal Quantization', 'NumberTitle', 'off');
    
    subplot(2,1,1);
    t = (0:length(signal)-1) / 2000;
    plot(t, signal, 'b', 'LineWidth', 1);
    hold on;
    plot(t, quantized * (max(signal)-min(signal))/(num_levels-1) + min(signal), ...
         'r.', 'MarkerSize', 4);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Original vs Quantized Signal');
    legend('Original', 'Quantized', 'Location', 'best');
    grid on;
    xlim([0 0.1]);
    hold off;
    
    subplot(2,1,2);
    histogram(quantized, 50, 'FaceColor', 'b', 'EdgeColor', 'k');
    xlabel('Quantization Level');
    ylabel('Frequency');
    title('Histogram of Quantized Values');
    grid on;
    
    fprintf('  - Signal Quantized to %d Levels (8-Bit)\n', num_levels);
    fprintf('  - Number of Unique Symbols: %d\n', length(symbols));
end
