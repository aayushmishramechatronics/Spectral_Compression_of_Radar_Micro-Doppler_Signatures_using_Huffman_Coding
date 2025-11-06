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
micro-doppler-lossless-compression/
│
├── src/                         # MATLAB source files
│   ├── main.m                   # Entry point for running the full simulation
│   ├── generate_signals.m       # Creates synthetic bird and drone signals
│   ├── design_filter.m          # Designs a band-pass filter
│   ├── apply_filter.m           # Applies filtering to the signals
│   ├── compute_fft.m            # Computes FFT and frequency analysis
│   ├── compute_spectrogram.m    # Generates time-frequency spectrogram
│   ├── cross_correlation.m      # Performs signal correlation comparison
│   ├── quantize_signal.m        # Quantizes the filtered signals
│   ├── huffman_encode.m         # Huffman encoding for lossless compression
│   ├── huffman_decode.m         # Huffman decoding and verification
│   ├── plot_results.m           # Visualizes results and comparisons
│   └── summary_report.m         # Displays and logs compression metrics
│
├── data/                        # Input/output signal data
│   ├── bird_signal.mat
│   ├── drone_signal.mat
│   └── results/
│       ├── encoded_data.mat
│       ├── decoded_signal.mat
│       └── compression_stats.mat
│
├── results/                     # Generated plots and reports
│   ├── plots/
│   │   ├── spectrogram_bird.png
│   │   ├── spectrogram_drone.png
│   │   ├── fft_comparison.png
│   │   ├── filter_response.png
│   │   └── huffman_stats.png
│   └── report/
│       └── compression_summary.txt
│
├── utils/                       # Supporting functions and tools
│   ├── export_fig.m
│   ├── save_data.m
│   ├── plot_style.m
│   └── load_defaults.m
│
├── docs/                        # Documentation and reference materials
│   ├── project_overview.pdf
│   ├── block_diagram.png
│   ├── flowchart.png
│   └── theory_background.md
│
├── LICENSE
├── .gitignore
├── requirements.txt
└── README.md
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

## Example Output Metrics

| Metric               | Value            |
| -------------------- | ---------------- |
| Entropy              | 6.71 bits/symbol |
| Compression Ratio    | 1.8:1            |
| Efficiency           | 93.5%            |
| Reconstruction Error | 0 (Lossless)     |

---

## Core Concepts Used

* Micro-Doppler Modulation Modeling
* FIR/IIR Filter Design & System Analysis
* DFT and FFT-based Frequency Analysis
* Signal Correlation & Convolution
* Data Quantization and Entropy Measurement
* Huffman Coding for Lossless Compression

---

## How to Run

1. Open MATLAB and navigate to the `src` directory:

   ```matlab
   cd src
   ```
2. Run the main script:

   ```matlab
   main
   ```
3. The simulation will automatically generate all outputs, plots, and performance reports in the `/results/` folder.

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

## Optional Improvements/Add-Ons

[] Use real radar I/Q datasets for experimental validation
[] Build an interactive MATLAB GUI for real-time visualization
[] Extend to a Python-based implementation
[] Explore alternative compression methods like wavelet or PCA-based encoding

---

**Developed by:** Aayush Mishra
**Purpose:** A simulation-based DSP project to study and demonstrate radar signal analysis and lossless compression.
