%% Matlab m-file Template for ECE 214 Lab #1 (Post-Lab Part A)
% In this example, we will plot the two functions:
%     exp^(-at)
% and 
%     exp^(-at) * cos(wt - 90 degrees)
% on both a linear and semi-logarithmic graph

%% Clear variables and define variables
clear variables; % clear all variables
a = 130; % define variable 'a'
w = 2.*pi.*1000; % define variable 'w'
Rlin = linspace(10, 1e6, 300); % create a linear time vector 'Tlin' between 0 and 10ms
Rlog = logspace(1, 6, 300);  % create a logarithmic time vector 'Tlog' between 10u and 10m

%% Define functions
V1a = 1.*Rlin./(Rlin.*2); % first function 'V1' with a linear time scale
V1b = 1.*Rlog./(Rlog.*2); % first function 'V1' with a logarithmic time scale
legendname1 = 'Node Voltage Vout1'; % legend name for first function

V2a =  abs(1./(1+(Rlin+50-j*0.0016).*((Rlin+656130-j*475000)./(Rlin.*(656130-j*475000))))); % second function 'V2' with a linear time scale 
V2b =  abs(1./(1+(Rlog+50-j*0.0016).*((Rlog+656130-j*475000)./(Rlog.*(656130-j*475000))))); % second function 'V2' with a logarithmic time scale
legendname2 = 'Node Voltage Vout2'; % legend name for second function
legendname3 = 'Vout @ 10\Omega';
legendname4 = 'Vout @ 10k\Omega';
legendname5 = 'Vout @ 1M\Omega';

%% Plot on a linear scale
FigHandle = figure('Position', [200, 75, 850, 600]); % create figure and set size and location
plot(Rlin, V1a, '-^', 'markersize', 3, 'linewidth',1.2, 'displayname', legendname1);
hold on; % hold on for multiple plots
plot(Rlin, V2a, '-o', 'markersize', 3, 'linewidth',1.2, 'displayname', legendname2);
plot(10, .138, '-o', 'markersize', 3, 'linewidth',3, 'displayname', legendname3);
plot(1e4, .5, '-o', 'markersize', 3, 'linewidth',3, 'displayname', legendname4);
plot(1e6, .3234, '-o', 'markersize', 3, 'linewidth',3, 'displayname', legendname5);
grid on; % turn on grid
set(gca, 'fontsize', 16); % set font size
legend show % show legend
xlabel('Resistance (\Omega)'); % label x-axis
ylabel('Voltage (V)'); % label y-axis
title('Linear plot of V1 and V2 as a function of resistance') % add title

%% Plot on a semilog-x scale
FigHandle = figure('Position', [150, 75, 850, 600]); % create 2nd figure and set size and location
semilogx(Rlog, V1b, '-^', 'markersize', 3, 'linewidth',1.2, 'displayname', legendname1);
hold on; % hold on for multiple plots
semilogx(Rlog, V2b, '-o', 'markersize', 3, 'linewidth',1.2, 'displayname', legendname2);
plot(10, .138, '-o', 'markersize', 3, 'linewidth',3, 'displayname', legendname3);
plot(1e4, .5, '-o', 'markersize', 3, 'linewidth',3, 'displayname', legendname4);
plot(1e6, .3234, '-o', 'markersize', 3, 'linewidth',3, 'displayname', legendname5);
grid on; % turn on grid
set(gca, 'fontsize', 16); % set font size
legend show % show legend
xlabel('Resistance (\Omega)'); % label x-axis
ylabel('Voltage (V)'); % label y-axis
title('Semilog plot of V1 and V2 as a function of resistance'); % add title

%% End of .m file