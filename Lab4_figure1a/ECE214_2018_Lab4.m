% Matlab m-file for ECE 214 Lab #4


addpath('D:\ECE214\CppSim\CppSimShared\HspiceToolbox');
clear variables;
hspc_filename = 'ECE214_2018_Lab4.hspc';

hspc_addline('.tran 10u 125m 25m', hspc_filename);
ngsim(hspc_filename); % run NGspice

%% load simulation results and extract time, Vout, and Vin
data = loadsig('simrun.raw');
time = evalsig(data, 'TIME');
Vout = evalsig(data,'vout');
Vin = evalsig(data, 'vin');

%% plot Vin and Vout as a function of time
fs = 16; % define font size
lw = 1.5; % define linewidth
Fig1 = figure('Position', [200, 75, 850, 600]); % figure size and location

subplot(2,1,1); % first subplot
plot(time.*1000,  Vin, 'linewidth',lw);
grid on; % add grid
set(gca, 'fontsize', fs); % set font size
ylabel('Voltage (V)', 'fontsize', lw); % label y-axis
title('ECE 214: Lab 4 -Inverting OPAmp (time domain)'); % title
legend('Voltage In'); % add legend
axis([30 31 -2 2]); % set axis limits

subplot(2,1,2); % second subplot
plot(time.*1000, Vout, 'linewidth',lw);
grid on; % add grid
set(gca, 'fontsize', fs); % set font size
xlabel('Time (ms)', 'fontsize', fs); % label x-axis
ylabel('Voltage (V)', 'fontsize', fs); % label y-axis
legend('Voltage Output'); % add legend
axis([30 31 -4 4]); %set axis limits

%% Post Lab - Frequency response of Low Pass Filter (ac analysis)
% 
% hspc_addline('.ac dec 200 100 1e5', hspc_filename); % change from transient to ac analysis
% ngsim(hspc_filename); % run NGspice
% 
% %% Load simulation results and extract Frequency and Vout
% data = loadsig('simrun.raw');
% frequency = evalsig(data, 'FREQUENCY');
% Vout = evalsig(data,'vout');
% 
% %% Plot amplitude and phase
% 
%Fig2 = figure('Position', [100, 75, 850, 600]);
% 
 %subplot(2,1,1)
 %semilogx(1e4, 20*log10(abs(Vout)), 'linewidth',lw);
 %grid on;
 %set(gca, 'fontsize', fs);
 %ylabel('dB Voltage', 'fontsize', fs);
 %title('ECE 214: Lab 3, Low Pass Filter (frequency response)');
 %legend('Filter Input'); % add legend
% 
 %subplot(2,1,2)
 %semilogx(1e4, phase(Vout)*180/pi, 'linewidth',lw);
 %grid on;
 %set(gca, 'fontsize', fs);
 %xlabel('Frequency (Hz)', 'fontsize', fs);
 %ylabel('Phase (degrees)', 'fontsize', fs);
 %legend('Filter Output'); % add legend

%% end of M file