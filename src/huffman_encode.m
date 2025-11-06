% ==============================================
% File: huffman_encode.m
% Author: Aayush Mishra
% Project: Lossless Compression of Micro-Doppler Data
% Description: Huffman Encoding with Compression Statistics
% ==============================================

function [encoded, dict, stats] = huffman_encode(quantized, symbols)
    % Convert to uint8 for Huffman Encoding
    quantized = uint8(quantized);
    
    % Error Fixed - Keeping Symbols in Column Vector
    symbols = unique(symbols(:));  % Sort + Remove Duplicates
    
    % Calculate Symbol Probabilities
    N = length(quantized);

    % Compute Histogram Counts
    edges = double([symbols; max(symbols)+1]);  % Ensure Numeric & Column
    symbol_counts = histcounts(double(quantized), edges);
    
    probabilities = symbol_counts / N;

    % Remove Zero-Probability Symbols (Just In Case)
    valid_idx = probabilities > 0;
    symbols = symbols(valid_idx);
    probabilities = probabilities(valid_idx);
    
    % Create Huffman Dictionary
    dict = huffmandict(num2cell(symbols), probabilities);
    
    % Encode the Signal
    encoded = huffmanenco(num2cell(double(quantized)), dict);
    
    % Calculate Statistics
    entropy = -sum(probabilities(probabilities > 0) .* log2(probabilities(probabilities > 0)));
    original_bits = N * 8;
    compressed_bits = length(encoded);
    avg_code_length = compressed_bits / N;
    compression_ratio = original_bits / compressed_bits;
    efficiency = (entropy / avg_code_length) * 100;
    bits_saved = original_bits - compressed_bits;
    savings_percent = (bits_saved / original_bits) * 100;
    
    % Store Statistics
    stats = struct( ...
        'entropy', entropy, ...
        'original_bits', original_bits, ...
        'compressed_bits', compressed_bits, ...
        'avg_code_length', avg_code_length, ...
        'compression_ratio', compression_ratio, ...
        'efficiency', efficiency, ...
        'bits_saved', bits_saved, ...
        'savings_percent', savings_percent, ...
        'num_symbols', length(symbols) ...
    );
    
    % Display Code Length Distribution
    figure('Name', 'Huffman Encoding Statistics', 'NumberTitle', 'off');
    
    code_lengths = cellfun(@length, dict(:,2));
    subplot(2,1,1);
    histogram(code_lengths, 'FaceColor', 'g', 'EdgeColor', 'k');
    xlabel('Code Length (bits)');
    ylabel('Frequency');
    title('Distribution of Huffman Code Lengths');
    grid on;
    
    subplot(2,1,2);
    bar(1:min(20, length(symbols)), probabilities(1:min(20, length(symbols))));
    xlabel('Symbol Index');
    ylabel('Probability');
    title('Symbol Probability Distribution (First 20 Symbols)');
    grid on;
    
    fprintf('  - Huffman Encoding Completed\n');
    fprintf('  - Entropy: %.4f Bits/Symbol\n', entropy);
    fprintf('  - Compression Ratio: %.2f:1\n', compression_ratio);
    fprintf('  - Efficiency: %.2f%%\n', efficiency);
end
