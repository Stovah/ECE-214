%% Matlab m-file Template for ECE 214 Lab #2
freq = [100, 200, 400, 600, 800, 1000, 2000, 4000, 6000, 8000, 10000, 20000, 40000];

%% Create arrays for measured and simulated peak Vb
sim1 = [3.41, 3.32, 3.01, 2.64, 2.3, 2.01, 1.17, 0.611, 0.411, 0.31, 0.248, 0.124, 0.0623];
meas1 = [3.406, 3.281, 2.969, 2.625, 2.25, 1.953, 1.14, 0.6, 0.403, 0.303, 0.2437, 0.123, 0.0612];

%% Create arrays for measured and simulated phase shift
sim2 = [7.96, 15.6, 29.2, 40, 48.2, 54.4, 70.3, 79.8, 83.1, 84.7, 85.7, 87.6, 88.5];
meas2 = [3.096, 15.552, 28.512, 39.312, 49.536, 55.44, 72, 80.064, 81.648, 84.672, 85.69, 86.7, 87.552];  

%% Plot measured and simulated Vb as a function of frequency
Fig1 = figure('Position', [200, 75, 850, 600]);

semilogx(freq, sim1);
hold on;
semilogx(freq, meas1, '*');
grid on;
set(gca, 'fontsize', 16); %increase font size
xlabel('Frequency Hz', 'fontsize', 16);
ylabel('Peak Voltage V', 'fontsize', 16);
title('Peak Voltage Across the Capacitor');
legend('Simulated','Measured');

%% Plot measured and simulated phase shift as a function of frequency
Fig2 = figure('Position', [150, 75, 850, 600]);

semilogx(freq, sim2);
hold on;
semilogx(freq, meas2, '*');
grid on;
set(gca, 'fontsize', 16); %increase font size
xlabel('Frequency Hz', 'fontsize', 16);
ylabel('Phase Shift ^{o}', 'fontsize', 16);
title('Phase Shift Across the Capacitor');
legend('Simulated','Measured');

%% end of M file