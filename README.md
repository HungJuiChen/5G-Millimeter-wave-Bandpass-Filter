# 5G Millimeter Wave Bandpass Filter Simulation

## Overview
This repository contains a MATLAB-based simulation of different bandpass filters (Butterworth, Chebyshev Type I, and Chebyshev Type II) applied to a 5G millimeter wave signal. The goal is to analyze their effectiveness in filtering out spurious signals and determine the most suitable filter for high-frequency communication systems.

## Contents
- **`matlab_ureca.m`**: MATLAB script that generates a 5G signal with spurious components and applies Butterworth, Chebyshev Type I, and Chebyshev Type II filters for comparison.
- **`EEE22025_Chen Hung-Jui.pdf`**: Research paper detailing the simulation methodology, results, and analysis.
- **`URECA_Poster.pdf`**: Presentation poster summarizing the key findings of the project.

## Project Description
### Background
5G networks rely on millimeter wave (mmW) technology, operating in the 30-300 GHz range, to achieve high data rates and low latency. However, these systems require efficient filtering mechanisms to suppress unwanted spurious signals.

### Simulation Approach
- A 5G signal centered at **2.1 GHz** is generated with additional spurious signals at **1.6 GHz and 2.6 GHz**.
- Three types of bandpass filters with a **5th-order design** and **600 MHz bandwidth** are implemented using MATLAB:
  - **Butterworth filter**: Smooth frequency response, wider transition band.
  - **Chebyshev Type I filter**: Steeper roll-off, passband ripple.
  - **Chebyshev Type II filter**: Superior stopband attenuation, stopband ripple.
- The signal is analyzed in **time-domain, frequency-domain, and phase response**.

### Key Findings
- All filters effectively suppress spurious signals.
- **Chebyshev filters** provide better stopband attenuation than the Butterworth filter.
- **Chebyshev Type II** filter is the best choice when **high rejection of spurious signals** is required.

## Usage
1. Open MATLAB and run `matlab_ureca.m`.
2. The script will generate plots for:
   - Original and filtered signals in time domain.
   - Frequency response comparison.
   - Phase response analysis.
3. Modify parameters (e.g., filter order, cutoff frequencies) to observe different filter behaviors.

## Dependencies
- MATLAB with Signal Processing Toolbox.

## References
For detailed analysis, please refer to:
- **`EEE22025_Chen Hung-Jui.pdf`** for a comprehensive research report.
- **`URECA_Poster.pdf`** for a visual summary of the results.
