========================================================
Lossless Compression of Micro-Doppler Sensor Data
Drone/Bird Classification Radar System
========================================================

Step 1: Generating micro-Doppler Signals
  - Bird Signal: 8.0 Hz Modulation, Fs = 2000 Hz
  - Drone Signal: 40.0 Hz Modulation, Fs = 2000 Hz
  - SNR: 25 dB

Step 2: Designing Butterworth Band-Pass Filter
  - Filter type: Butterworth Band-Pass
  - Order: 4
  - Passband: 400 - 600 Hz

Step 3: Applying Filter to Signals
  - Filtering Completed using filtfilt (zero-phase)
  - Filtering Completed using filtfilt (zero-phase)

Step 4: Computing FFT Spectra
  - FFT Computed for Bird Signal
  - Key Frequency Peaks Annotated
  - FFT Computed for Drone Signal
  - Key Frequency Peaks Annotated

Step 5: Computing Spectrograms
  - Spectrogram Generated for Bird (Filtered)
  - Window: Hamming (256), Overlap: 200, NFFT: 512
  - Spectrogram Generated for Drone (Filtered)
  - Window: Hamming (256), Overlap: 200, NFFT: 512

Step 6: Performing Cross-Correlation Analysis
  - Cross-Correlation Computed
  - Peak Correlation: 1997.6755 at Lag = 0 Samples
  - Low Correlation Indicates Distinct Signal Characteristics

Step 7: Quantizing Filtered Bird Signal
  - Signal Quantized to 256 Levels (8-Bit)
  - Number of Unique Symbols: 199

Step 8: Applying Huffman Encoding
  - Huffman Encoding Completed
  - Entropy: 5.9764 Bits/Symbol
  - Compression Ratio: 1.33:1
  - Efficiency: 99.63%

Step 9: Decoding Huffman-Encoded Signal
  - Huffman Decoding Completed
  - Decoded Signal Length: 4000 Samples

Step 10: Plotting Reconstruction Results
  - Reconstruction Metrics:
    * MSE: 0.000012
    * RMSE: 0.003465
    * Max Error: 0.005985
    * Verification: PASSED (Perfect Reconstruction in Quantized Domain)

Step 11: Generating Summary

========================================================
           COMPRESSION SUMMARY REPORT
========================================================

COMPRESSION STATISTICS:
  Number of Unique Symbols:    199
  Entropy:                     5.9764 bits/symbol
  Average Code Length:         5.9985 bits/symbol
  Compression Ratio:           1.33:1
  Coding Efficiency:           99.63%

BIT USAGE:
  Original Size:               32000 bits
  Compressed Size:             23994 bits
  Bits Saved:                  8006 bits (25.02% reduction)

THEORETICAL BOUNDS:
  Shannon Entropy Lower Bound: 5.9764 bits/symbol
  Achieved Code Length:        5.9985 bits/symbol
  Overhead:                    0.0221 bits/symbol

CONCLUSION:
  Excellent Compression Efficiency! Near-Optimal Coding.

========================================================


========================================================
Project Execution Successful!
========================================================
>> 
