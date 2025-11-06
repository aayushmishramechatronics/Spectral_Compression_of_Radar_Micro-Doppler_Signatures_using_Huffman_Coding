% ==============================================
% File: huffman_encode.m
% Author: Aayush Mishra
% Project: Lossless Compression of Micro-Doppler Data
% Description: Huffman Encoding with Compression Statistics
% ==============================================

function [encoded, dict, stats] = huffman_encode(quantized, symbols)
    % Convert to uint8 for Huffman Encoding
    quantized = uint8(quantized);
    symbols = uint8(symbols);
    
    % Calculate Symbol Probabilities
    N = length(quantized);
    symbol_counts = histcounts(quantized, [symbols; max(symbols)+1]);
    probabilities = symbol_counts / N;
    
    % Create Huffman Dictionary
    dict = huffmandict(symbols, probabilities);
    
    % Encode the Signal
    encoded = huffmanenco(quantized, dict);
    
    % Calculate Statistics
    % Entropy
    entropy = -sum(probabilities(probabilities > 0) .* log2(probabilities(probabilities > 0)));
    
    % Original Bits (8-Bit Quantization)
    original_bits = N * 8;
    
    % Compressed Bits
    compressed_bits = length(encoded);
    
    % Average Code Length
    avg_code_length = compressed_bits / N;
    
    % Compression Ratio
    compression_ratio = original_bits / compressed_bits;
    
    % Efficiency
    efficiency = (entropy / avg_code_length) * 100;
    
    % Bits Saved
    bits_saved = original_bits - compressed_bits;
    savings_percent = (bits_saved / original_bits) * 100;
    
    % Store Statistics
    stats.entropy = entropy;
    stats.original_bits = original_bits;
    stats.compressed_bits = compressed_bits;
    stats.avg_code_length = avg_code_length;
    stats.compression_ratio = compression_ratio;
    stats.efficiency = efficiency;
    stats.bits_saved = bits_saved;
    stats.savings_percent = savings_percent;
    stats.num_symbols = length(symbols);
    
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
