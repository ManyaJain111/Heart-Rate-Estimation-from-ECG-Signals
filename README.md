# Heart Rate Estimation from ECG Signals

## Overview

This project focuses on estimating heart rate (HR) from ECG (Electrocardiogram) signals using signal processing techniques. The goal is to extract meaningful cardiac features from raw ECG data and compute heart rate accurately.

## Files in the Repository

* `ecg.m` → MATLAB script for ECG signal processing and heart rate estimation

## Methodology

The heart rate estimation pipeline generally includes:

1. **Signal Acquisition** – Loading ECG signal data
2. **Preprocessing** – Noise removal and signal smoothing (filtering)
3. **Peak Detection** – Detecting R-peaks in the ECG waveform
4. **RR Interval Calculation** – Measuring time between consecutive heartbeats
5. **Heart Rate Computation** – Converting RR intervals into beats per minute (BPM)

## Requirements

To run the MATLAB script:

* MATLAB (R2020 or later recommended)
* Signal Processing Toolbox

## How to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/ManyaJain111/Heart-Rate-Estimation-from-ECG-Signals.git
   ```

2. Open MATLAB and navigate to the project folder:

   ```matlab
   cd('Heart-Rate-Estimation-from-ECG-Signals')
   ```

3. Run the script:

   ```matlab
   ecg
   ```

## Output

* Estimated heart rate (BPM)
* Plots of ECG signal with detected peaks (if implemented in script)

## Applications

* Medical monitoring systems
* Wearable health devices
* Biomedical signal analysis

## Author

Manya Jain


