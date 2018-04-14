% Matlab m-file for ECE 214 Lab #6 modified for lab 7

addpath('D:\ECE214\CppSim\CppSimShared\HspiceToolbox');
clear variables;
hspc_filename = 'ECE214_2018_Lab3.hspc';

%% Specify NGspice control statement, and run NGspice

hspc_addline('.tran 1u 10m 0', hspc_filename);
ngsim(hspc_filename); % run NGspice

%% load simulation results and extract time and Voltages
data = loadsig('simrun.raw');
time = evalsig(data, 'TIME');
Vout = evalsig(data,'vout');

fs = 16; % define font size
lw = 1.5; % define linewidth
%% Plot the transient response
Fig1 = figure('Position', [200, 75, 850, 600]); % figure size and location

subplot(2,1,1); % first subplot
plot(time.*1000,  (Vout), 'linewidth',lw);
grid on; % add grid
set(gca, 'fontsize', fs); % set font size
ylabel('Voltage (V)', 'fontsize', fs); % label y-axis
xlabel('Time (ms)', 'fontsize', fs); % label x-axis
title('Output Voltage vs. time'); % title
legend('Vout'); % add legend

subplot(2,1,2); % first subplot
plot(time.*1000,  (Vout), 'linewidth',lw);
grid on; % add grid
set(gca, 'fontsize', fs); % set font size
ylabel('Voltage (V)', 'fontsize', fs); % label y-axis
xlabel('Time (ms)', 'fontsize', fs); % label x-axis
legend('Vout'); % add legend
axis([8 8.2 33.52 33.54]); % set axis limits

%% end of M file