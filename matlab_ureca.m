% Define parameters
fc = 2.1e9; % center frequency
fs = 10e9; % sampling frequency
numSamples = 1000; % number of samples
t = (0:numSamples-1)/fs; % time vector

% Generate test signal with spurious signals
signal = 0.5*sin(2*pi*fc*t) + 0.2*sin(2*pi*(fc+0.5e9)*t) + 0.2*sin(2*pi*(fc-0.5e9)*t) + 0.1*randn(size(t));
% Define filter parameters
order = 5; % filter order
Wn = [1.8e9 2.4e9]/(fs/2); % passband cutoff frequencies

% Butterworth filter
[b1,a1] = butter(order, Wn, 'bandpass');
output1 = filter(b1,a1,signal);

% Chebyshev Type I filter
[b2,a2] = cheby1(order, 0.5, Wn, 'bandpass');
output2 = filter(b2,a2,signal);

% Chebyshev Type II filter
[b3,a3] = cheby1(order, 0.5, Wn, 'bandpass');
output3 = filter(b3,a3,signal);

% Original Singal
figure
subplot(2,1,1);
plot(t, signal, 'b');
xlabel('Time (s)');
ylabel('Amplitude');
title('Filter Comparison');
legend('Original Signal');

subplot(2,1,2);
plot(f/(fs/2), abs(signal_fft(1:NFFT/2+1))','b');
xlabel('Normalized Frequency');
ylabel('Magnitude');
title('Frequency Response Comparison');
legend('Original Signal');


% Time-domain plots
figure;
subplot(3,1,1);
plot(t, signal, 'b', t, output1, 'r')
xlabel('Time (s)');
ylabel('Amplitude');
title('Filter Comparison');
legend('Original Signal', 'Butterworth Filter');

subplot(3,1,2);
plot(t, signal, 'b', t, output1, 'g')
xlabel('Time (s)');
ylabel('Amplitude');
title('Filter Comparison');
legend('Original Signal', 'Chebyshev Type I filter');

subplot(3,1,3);
plot(t, signal, 'b', t, output1, 'm')
xlabel('Time (s)');
ylabel('Amplitude');
title('Filter Comparison');
legend('Original Signal', 'Chebyshev Type II filter');


% Frequency-domain plot
NFFT = 2^nextpow2(numSamples);
f = fs/2*linspace(0,1,NFFT/2+1);
signal_fft = fft(signal, NFFT)/numSamples;
output1_fft = fft(output1, NFFT)/numSamples;
output2_fft = fft(output2, NFFT)/numSamples;
output3_fft = fft(output3, NFFT)/numSamples;


figure;
subplot(3,2,1);
plot(f/(fs/2), abs(signal_fft(1:NFFT/2+1))','b', f/(fs/2), abs(output1_fft(1:NFFT/2+1))','r');
xlabel('Normalized Frequency');
ylabel('Magnitude');
title('Frequency Response Comparison');
legend('Original Signal', 'Butterworth Filter');

subplot(3,2,3);
plot(f/(fs/2), abs(signal_fft(1:NFFT/2+1))','b', f/(fs/2), abs(output2_fft(1:NFFT/2+1))','g');
xlabel('Normalized Frequency');
ylabel('Magnitude');
title('Frequency Response Comparison');
legend('Original Signal', 'Chebyshev Type I filter');

subplot(3,2,5);
plot(f/(fs/2), abs(signal_fft(1:NFFT/2+1))','b', f/(fs/2), abs(output3_fft(1:NFFT/2+1))','m');
xlabel('Normalized Frequency');
ylabel('Magnitude');
title('Frequency Response Comparison');
legend('Original Signal', 'Chebyshev Type II filter');




% Plot phase response

subplot(3,2,2);
plot(f/(fs/2), angle(output1_fft(1:NFFT/2+1))','r');
xlabel('Normalized Frequency');
ylabel('Phase (rad)');
title('Phase Response Comparison');
legend('Butterworth Filter');

subplot(3,2,4);
plot(f/(fs/2), angle(output2_fft(1:NFFT/2+1))','g');
xlabel('Normalized Frequency');
ylabel('Phase (rad)');
title('Phase Response Comparison');
legend('Chebyshev Type I filter');

subplot(3,2,6);
plot(f/(fs/2), angle(output3_fft(1:NFFT/2+1))','m');
xlabel('Normalized Frequency');
ylabel('Phase (rad)');
title('Phase Response Comparison');
legend('Chebyshev Type II filter');

