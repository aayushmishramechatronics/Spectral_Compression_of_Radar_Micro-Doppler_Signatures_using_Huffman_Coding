% ==============================================
% File: cross_correlation.m
% Author: Aayush Mishra
% Project: Lossless Compression of Micro-Doppler Data
% Description: Compute Cross-Correlation Between Two Signals
% ==============================================

function cross_correlation(signal1, signal2)
    % Compute Cross-Correlation
    [xcorr_result, lags] = xcorr(signal1, signal2);
    
    % Find Peak Correlation
    [max_corr, max_idx] = max(abs(xcorr_result));
    lag_at_max = lags(max_idx);
    
    % Compute Normalized Correlation
    xcorr_normalized = xcorr_result / max(abs(xcorr_result));
    
    % Plot Cross-Correlation
    figure('Name', 'Cross-Correlation Analysis', 'NumberTitle', 'off');
    
    subplot(2,1,1);
    plot(lags, xcorr_result, 'b', 'LineWidth', 1);
    xlabel('Lag (samples)');
    ylabel('Correlation');
    title('Cross-Correlation: Bird vs Drone Signals');
    grid on;
    hold on;
    plot(lag_at_max, xcorr_result(max_idx), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    text(lag_at_max, xcorr_result(max_idx), ...
         sprintf('  Peak at Lag = %d', lag_at_max), ...
         'VerticalAlignment', 'bottom');
    hold off;
    
    subplot(2,1,2);
    plot(lags, xcorr_normalized, 'r', 'LineWidth', 1);
    xlabel('Lag (samples)');
    ylabel('Normalized Correlation');
    title('Normalized Cross-Correlation');
    grid on;
    
    fprintf('  - Cross-Correlation Computed\n');
    fprintf('  - Peak Correlation: %.4f at Lag = %d Samples\n', max_corr, lag_at_max);
    fprintf('  - Low Correlation Indicates Distinct Signal Characteristics\n');
end
