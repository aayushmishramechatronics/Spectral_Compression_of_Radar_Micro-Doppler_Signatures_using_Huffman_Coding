% ==============================================
% File: huffman_decode.m
% Author: Aayush Mishra
% Project: Lossless Compression of Micro-Doppler Data
% Description: Huffman Decoding and Verification
% ==============================================

function decoded = huffman_decode(encoded, dict)
    % Decode the Huffman-Encoded Signal
    decoded = huffmandeco(encoded, dict);
    
    fprintf('  - Huffman Decoding Completed\n');
    fprintf('  - Decoded Signal Length: %d Samples\n', length(decoded));
end
