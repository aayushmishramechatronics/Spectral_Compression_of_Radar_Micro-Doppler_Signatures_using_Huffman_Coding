% ==============================================
% File: plot_results.m
% Author: Aayush Mishra
% Project: Lossless Compression of Micro-Doppler Data
% Description: Visual Comparison of Original and Reconstructed Signals
% ==============================================

function plot_results(original, reconstructed)
    % Convert Reconstructed Back to Original Scale
    quantized_orig = round((original - min(original)) / (max(original) - min(original)) * 255);
    reconstructed_scaled = double(reconstructed) * (max(original)-min(original))/255 + min(original);
    
    % Time Vector
    t = (0:length(original)-1) / 2000;
    
    % Create Comparison Plots
    figure('Name', 'Reconstruction Results', 'NumberTitle', 'off');
    
    % Time Domain Comparison
    subplot(3,1,1);
    plot(t, original, 'b', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Original Filtered Signal');
    grid on;
    xlim([0 0.5]);
    
    subplot(3,1,2);
    plot(t, reconstructed_scaled, 'r', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Reconstructed Signal (After Huffman Decode)');
    grid on;
    xlim([0 0.5]);
    
    % Error Signal
    subplot(3,1,3);
    error = original - reconstructed_scaled;
    plot(t, error, 'k', 'LineWidth', 1);
    xlabel('Time (s)');
    ylabel('Error');
    title('Reconstruction Error (Quantization Noise)');
    grid on;
    xlim([0 0.5]);
    
    % Calculate Metrics
    mse = mean(error.^2);
    rmse = sqrt(mse);
    max_error = max(abs(error));
    
    fprintf('  - Reconstruction Metrics:\n');
    fprintf('    * MSE: %.6f\n', mse);
    fprintf('    * RMSE: %.6f\n', rmse);
    fprintf('    * Max Error: %.6f\n', max_error);
    
    % Verify Lossless Compression (In Quantized Domain)
    if isequal(quantized_orig(:), double(reconstructed(:)))
        fprintf('    * Verification: PASSED (Perfect Reconstruction in Quantized Domain)\n');
    else
        fprintf('    * Verification: WARNING (Minor Differences Detected)\n');
    end
end
