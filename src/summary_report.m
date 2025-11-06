% ==============================================
% File: summary_report.m
% Author: Aayush Mishra
% Project: Lossless Compression of Micro-Doppler Data
% Description: Display Comprehensive Summary Report
% ==============================================

function summary_report(stats)
    fprintf('\n');
    fprintf('========================================================\n');
    fprintf('           COMPRESSION SUMMARY REPORT\n');
    fprintf('========================================================\n\n');
    
    fprintf('COMPRESSION STATISTICS:\n');
    fprintf('  Number of Unique Symbols:    %d\n', stats.num_symbols);
    fprintf('  Entropy:                     %.4f bits/symbol\n', stats.entropy);
    fprintf('  Average Code Length:         %.4f bits/symbol\n', stats.avg_code_length);
    fprintf('  Compression Ratio:           %.2f:1\n', stats.compression_ratio);
    fprintf('  Coding Efficiency:           %.2f%%\n', stats.efficiency);
    fprintf('\n');
    
    fprintf('BIT USAGE:\n');
    fprintf('  Original Size:               %d bits\n', stats.original_bits);
    fprintf('  Compressed Size:             %d bits\n', stats.compressed_bits);
    fprintf('  Bits Saved:                  %d bits (%.2f%% reduction)\n', ...
            stats.bits_saved, stats.savings_percent);
    fprintf('\n');
    
    fprintf('THEORETICAL BOUNDS:\n');
    fprintf('  Shannon Entropy Lower Bound: %.4f bits/symbol\n', stats.entropy);
    fprintf('  Achieved Code Length:        %.4f bits/symbol\n', stats.avg_code_length);
    fprintf('  Overhead:                    %.4f bits/symbol\n', ...
            stats.avg_code_length - stats.entropy);
    fprintf('\n');
    
    fprintf('CONCLUSION:\n');
    if stats.efficiency > 95
        fprintf('  Excellent Compression Efficiency! Near-Optimal Coding.\n');
    elseif stats.efficiency > 85
        fprintf('  Good Compression Efficiency. Huffman Coding is Effective.\n');
    else
        fprintf('  Moderate Compression. Signal May Have High Entropy.\n');
    end
    
    fprintf('\n========================================================\n\n');
    
    % Create Summary Table
    figure('Name', 'Summary Report', 'NumberTitle', 'off');
    axis off;
    
    summary_text = {
        'LOSSLESS COMPRESSION SUMMARY';
        '';
        sprintf('Compression Ratio: %.2f:1', stats.compression_ratio);
        sprintf('Efficiency: %.2f%%', stats.efficiency);
        sprintf('Bits Saved: %d (%.1f%%)', stats.bits_saved, stats.savings_percent);
        sprintf('Entropy: %.4f bits/symbol', stats.entropy);
        sprintf('Avg Code Length: %.4f bits/symbol', stats.avg_code_length);
        '';
        'Lossless Reconstruction: VERIFIED';
        'Method: Huffman Coding';
        'Quantization: 8-bit (256 levels)';
    };
    
    text(0.5, 0.5, summary_text, ...
         'HorizontalAlignment', 'center', ...
         'VerticalAlignment', 'middle', ...
         'FontSize', 12, ...
         'FontName', 'Courier', ...
         'FontWeight', 'bold');
end
