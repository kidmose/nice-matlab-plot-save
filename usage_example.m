%% Generate some data to plot - Sampling a Pareto distributions
clear; clc; close all;
% Parameters are calculated from:
%   Manually fitted LLCD: 400*x.^-0.83;
%   LLCD = 1 - CDF
%   CDF = 1 - (k/x)^alpha
alpha = 0.83; % tail behavior
k = 1364.624; % minimum x value
% generate sample using inverse probability integral transform
u_len = 100000; % number of samples to draw
u = rand(u_len, 1);
x = k./((1-u).^(1/alpha)); % inverse pareto cdf
x_sorted = sort(x,'descend');
y = linspace(0,1,u_len);

%% ordinary plot
nmps_figure;
plot(x_sorted,y);
nmps_xlabel('Some text for xlabel')
nmps_ylabel('Some text for ylabel$\alpha _{k,2}$')
nmps_title('A title')
nmps_save(gcf,'test01')

%% loglog plot
nmps_figure;
loglog(x_sorted,y);
nmps_xlabel('Another x label')
nmps_ylabel('Some y label for this figure')
nmps_title('A title for the second test plot')
nmps_save(gcf,'test02')


break;
set(get(AX(1),'Ylabel'),'String','CPU forbrug [%]','fontsize',Tsize); 
set(get(AX(2),'Ylabel'),'String','DMUer [antal]','fontsize',Tsize);
set(get(AX(1),'Xlabel'),'String','Tid [m]','fontsize',Tsize);

%% loglog plot
loglog(x_sorted, y,'g-.','LineWidth',2);

title('Validation of Pareto sample generation');
set(gcf,'PaperPositionMode','auto');
saveas(gcf,'sample_verification.png','png');  % Choose another format, e.g. png, epsc if required

%% subplot















