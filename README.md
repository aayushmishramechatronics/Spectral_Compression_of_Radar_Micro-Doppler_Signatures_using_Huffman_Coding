# Lossless Compression of Micro-Doppler Sensor Data using Huffman Coding

This Project demonstrates the Lossless Compression of micro-Doppler Radar Signals, such as those Reflected from Drones and Birds, using Huffman Coding in combination with Core Digital Signal Processing (DSP) techniques like Filtering, FFT Analysis, and Spectrogram Generation.
It is a MATLAB-based Simulation that Explores how Radar Signal Data can be Compressed Efficiently while Maintaining Complete Fidelity.

---

## Objective

The Goal of this Project is to Build a Complete Signal Processing and Compression Pipeline that:

1. Simulates micro-Doppler Signals of Drones and Birds.
2. Filters and Analyzes these Signals using DSP Techniques.
3. Compresses the Processed Data using Huffman Coding for Efficient Storage or Transmission.
4. Verifies that the Reconstructed Signal Matches the Original without Loss of Information.

---

## Features

* Simulation of Synthetic micro-Doppler Radar Signals
* Band-Pass Filtering using IIR or FIR Filters for Doppler Isolation
* FFT and Spectrogram-based Frequency-Domain Analysis
* Cross-Correlation for Comparing Target Signatures
* Quantization of Processed Data
* Huffman Coding for Lossless Compression and Decompression
* Measurement of Compression Performance (Entropy, Compression Ratio, Efficiency)

---

## Project Structure (Mono-Repo Layout)

This Repository uses a Modular Layout, where Each Component of the Pipeline is Built and Maintained Independently for Scalability.

```
Directory Structure:
└── aayushmishramechatronics-spectral_compression_of_radar_micro-doppler_signatures_using_huffman_coding/
    ├── README.md
    ├── LICENSE
    ├── implementation_data/
    │   └── result.mat
    └── src/
        ├── apply_filter.m
        ├── compute_fft.m
        ├── compute_spectrogram.m
        ├── cross_correlation.m
        ├── design_filter.m
        ├── generate_signals.m
        ├── huffman_decode.m
        ├── huffman_encode.m
        ├── main.m
        ├── plot_results.m
        ├── quantize_signal.m
        └── summary_report.m

```

---

## How It Works

1. **Signal Generation** : Simulated Radar return Signals for Drones and Birds are Created based on Realistic micro-Doppler Motion Patterns.
2. **Filtering** : A Butterworth Band-Pass Filter is applied to isolate Doppler Frequency components while Removing Noise.
3. **Frequency Analysis** : The FFT and Spectrograms show how the Frequency Content varies with Time, Representing micro-Doppler Effects.
4. **Correlation** : Cross-Correlation is performed to compare similarities or differences between signal types.
5. **Quantization and Compression** : The Processed Signals are Quantized and Encoded using Huffman Coding to Achieve Lossless Compression.
6. **Decoding and Verification** – The Signal is Decoded and Compared with the Original to Confirm Zero Information Loss.

---

## Core Concepts Used

* Micro-Doppler Modulation Modeling
* FIR/IIR Filter Design & System Analysis
* DFT and FFT-based Frequency Analysis
* Signal Correlation & Convolution
* Data Quantization and Entropy Measurement
* Huffman Coding for Lossless Compression

---

## Requirements

* MATLAB R2022a or Later
* Signal Processing Toolbox
* Communications Toolbox
> Note: (No Additional Hardware is Required for Now, Since the Project uses Fully Simulated Data.) 

---

## License

This project is distributed under the **GNU General Public License v2.0**. You can freely use, modify, and distribute it with proper credit.

---

**Developed by:** Aayush Mishra
**Purpose:** A simulation-based DSP project to study and demonstrate radar signal analysis and lossless compression.
