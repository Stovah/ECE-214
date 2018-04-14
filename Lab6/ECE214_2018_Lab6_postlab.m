% Matlab m-file for ECE 214 Lab #3 modified for lab 6

addpath('D:\ECE214\CppSim\CppSimShared\HspiceToolbox');
clear variables;
hspc_filename = 'ECE214_2018_Lab3.hspc';

%% Define variables, specify NGspice control statement, and run NGspice
% put your resistor and capacitor values here
R1 = 1.59e-7
R2 = 2.51
C = 0.336e-6
L = 1.005e-3
% label resistors as 'res1,' 'res2,' 'cap,' and 'ind' in your schematic
hspc_set_param('res1', R1, hspc_filename);
hspc_set_param('res2', R2, hspc_filename);
hspc_set_param('cap', C, hspc_filename);
hspc_set_param('ind', L, hspc_filename);

hspc_addline('.tran 0.1u 0.2m 10u', hspc_filename);
ngsim(hspc_filename); % run NGspice

%% load simulation results and extract time and Voltages
data = loadsig('simrun.raw');
time = evalsig(data, 'TIME');
Vc = evalsig(data,'vc');
Va = evalsig(data, 'va');
Vg = evalsig(data, 'vg');
Vi = Va - Vc;

fs = 16; % define font size
lw = 1.5; % define linewidth

%% Plot the step response
Fig1 = figure('Position', [200, 75, 850, 600]); % figure size and location

subplot(1,1,1); % first subplot
plot(time.*1000000,  (Vc), time.*1000000, (Va), time.*1000000, (Vg), time.*1000000, (Vi), 'linewidth',lw);
grid on; % add grid
set(gca, 'fontsize', fs); % set font size
ylabel('Voltage (V)', 'fontsize', fs); % label y-axis
xlabel('Time (\mus)', 'fontsize', fs); % label x-axis
title('Step Response (time domain)'); % title
legend('V_C', 'Vin', 'Vfg', 'V_L'); % add legend

%% Frequency stuff
% 
 hspc_addline('.ac dec 200 1000 1e6', hspc_filename); % change from transient to ac analysis
 ngsim(hspc_filename); % run NGspice
% 
% %% Load simulation results and extract Frequency and Voltages
 data = loadsig('simrun.raw');
 frequency = evalsig(data, 'FREQUENCY');
 Vc = evalsig(data,'vc');
 Va = evalsig(data, 'va');
 Vi = Va - Vc;
% 

  %% Plot voltages across capacitor and inductor
Fig2 = figure('Position', [150, 75, 850, 600]); % figure size and location

 subplot(2,1,1)
 semilogx(frequency, abs(Vc), frequency, abs(Va), frequency, abs(Vi), 'linewidth',lw);
 grid on;
 set(gca, 'fontsize', fs);
 ylabel('Voltage (V)', 'fontsize', fs);
 xlabel('Frequency (Hz)', 'fontsize', fs);
 title('Voltage Across Capacitor and Inductor');
 legend('V_C', 'Vin', 'V_L'); % add legend
 
 subplot(2,1,2)
 semilogx(frequency, angle(Vc)*180/pi, frequency, angle(Va)*180/pi, frequency, angle(Vi)*180/pi, 'linewidth',lw);
 grid on;
 set(gca, 'fontsize', fs);
 ylabel('Phase (^o)', 'fontsize', fs);
 xlabel('Frequency (Hz)', 'fontsize', fs);
 title('Phase of Capacitor and Inductor');
 legend('V_C', 'Vin', 'V_L'); % add legend

%% end of M file