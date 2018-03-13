% Matlab m-file for ECE 214 Lab #3

addpath('D:\ECE214\CppSim\CppSimShared\HspiceToolbox');
clear variables;
hspc_filename = 'ECE214_2018_Lab3.hspc';

%% Define variables, specify NGspice control statement, and run NGspice
hspc_addline('.tran 10u 125m 25m', hspc_filename);
ngsim(hspc_filename); % run NGspice

%% load simulation results and extract time, Vout, and Vin
data = loadsig('simrun.raw');
time = evalsig(data, 'TIME');
frequency = evalsig(data, 'freq');
Vc = evalsig(data,'vc');
Vin = evalsig(data, 'va');

%% Plot the FFT (Approximate Fourier Series)
fs = 16; % define font size
lw = 1.5; % define linewidth
Fig1 = figure('Position', [200, 75, 850, 600]); % figure size and location

subplot(2,1,1);
[freq, mag_in] = vt_to_vf(time, Vin); % generate Fourier components
semilogx(freq, mag_in, 'linewidth', lw);
grid on;
set(gca, 'fontsize', fs);
axis([100,1e5,-30,10]); % set axis limits
legend('Filter Input'); % add legend
ylabel('Voltage (dB)', 'fontsize', fs); % label y-axis
title('ECE 214: Lab 3 - Low Pass Filter (Fourier components of square wave)')

subplot(2,1,2);
[freq, mag_out] = vt_to_vf(time, Vc); % generate Fourier components
semilogx(freq, mag_out, 'linewidth', lw);
grid on;
set(gca, 'fontsize', fs);
axis([100,1e5,-40,10]);
legend('Filter Output'); % add legend
ylabel('Voltage (dB)', 'fontsize', fs); % label y-axis
xlabel('Frequency (Hz)', 'fontsize', fs); % label x-axis

%% Post Lab - Frequency response of Low Pass Filter (ac analysis)
% 
 hspc_addline('.ac dec 200 100 1e5', hspc_filename); % change from transient to ac analysis
 ngsim(hspc_filename); % run NGspice
% 
 %% Load simulation results and extract Frequency and Vout
%data = loadsig('simrun.raw');
%frequency = evalsig(data, 'FREQUENCY');
%Vout = evalsig(data,'vout');
% 
% %% Plot amplitude and phase
 
%Fig3 = figure('Position', [100, 75, 850, 600]);
 
%subplot(2,1,1)
%semilogx(frequency, 20*log10(abs(Vout)), 'linewidth',lw);
%grid on;
%set(gca, 'fontsize', fs);
%ylabel('dB Voltage', 'fontsize', fs);
%title('ECE 214: Lab 3, Low Pass Filter (frequency response)');
%legend('Filter Input'); % add legend
 
%subplot(2,1,2)
%semilogx(frequency, phase(Vout)*180/pi, 'linewidth',lw);
%grid on;
%set(gca, 'fontsize', fs);
%xlabel('Frequency (Hz)', 'fontsize', fs);
%ylabel('Phase (degrees)', 'fontsize', fs);
%legend('Filter Output'); % add legend

%% end of M file