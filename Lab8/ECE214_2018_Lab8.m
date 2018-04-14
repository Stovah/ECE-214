% Matlab m-file for ECE 214 Lab #6 modified for lab 8

addpath('D:\ECE214\CppSim\CppSimShared\HspiceToolbox');
clear variables;
hspc_filename = 'ECE214_2018_Lab3.hspc';

%% Specify NGspice control statement, and run NGspice
hspc_addline('.tran 1u 0.5m 0', hspc_filename);
ngsim(hspc_filename); % run NGspice

%% load simulation results and extract time and Voltages
data = loadsig('simrun.raw');
time = evalsig(data, 'TIME');
Vout = evalsig(data,'vout');
Vc1 = evalsig(data,'vc1');
Vc2 = evalsig(data,'vc2');

fs = 16; % define font size
lw = 1.5; % define linewidth
%% Plot the transient response
Fig1 = figure('Position', [200, 75, 850, 600]); % figure size and location

subplot(2,1,1); % first subplot
plot(time.*1000,  (Vout), 'linewidth',lw);
grid on; % add grid
set(gca, 'fontsize', fs); % set font size
ylabel('Voltage (V)', 'fontsize', fs); % label y-axis
title('Astable Multivibrator Transient Response'); % title
legend('Vout'); % add legend

subplot(4,1,3); % second subplot
plot(time.*1000,  (Vc1),'linewidth',lw);
grid on; % add grid
set(gca, 'fontsize', fs); % set font size
title('Astable Multivibrator Capacitor Voltages'); % titled
ylabel('Voltage (V)', 'fontsize', fs); % label y-axis
legend('Vc_1'); % add legend
axis([20 40 -10 15]); % set axis limits

subplot(4,1,4); % third subplot
plot(time.*1000,  (Vc2),'linewidth',lw);
grid on; % add grid
set(gca, 'fontsize', fs); % set font size
ylabel('Voltage (V)', 'fontsize', fs); % label y-axis
xlabel('Time (ms)', 'fontsize', fs); % label x-axis
legend('Vc_2'); % add legend
axis([20 40 -10 15]); % set axis limits

%% end of M file