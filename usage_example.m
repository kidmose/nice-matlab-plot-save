%% Generate some data to plot - Sampling a Pareto distributions
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

%% Generelle plot parametre:
Lwidth = 1.5;           % Linetykkelse
Msize = 20;             % Marker størelse
Tsize = 16;             % Tekststørrelse
LTsize = 12;            % Legend Tekststørrelse
figureHeight = 500;     % Højde på figuren
figureWidth = 1400;      % Bredde på figuren
figurePosBottom = 10;  % Figurplacering relativt til bunden af skærmen
figurePosLeft = 10;    % Figurplacering relativt til venstre side af skærmen

%% ordinary plot
figure ('DefaultTextFontName', 'Times','DefaultTextFontSize', LTsize,'DefaultAxesFontName', 'Times','DefaultAxesFontSize', LTsize,'Position',[figurePosLeft figurePosBottom figureWidth figureHeight]);
figure
plot(x_sorted,y);
title('Title of ordinary plot'); 
xlabel('Packet number','Interpreter','latex','fontsize',Tsize);
ylabel('Interarrival time [ms]','Interpreter','latex','fontsize',Tsize);
title('Interarrival time pr. packet','Interpreter','latex','fontsize',Tsize);

set(gca,'Xlim',[0 107030])
set(gcf,'PaperPositionMode','auto');
plot_save = [import_file,'_time'];
saveas(gcf,plot_save,'png');  % Vælg andet format, eks. png hvis krævet

set(get(AX(1),'Ylabel'),'String','CPU forbrug [%]','fontsize',Tsize); 
set(get(AX(2),'Ylabel'),'String','DMUer [antal]','fontsize',Tsize);
set(get(AX(1),'Xlabel'),'String','Tid [m]','fontsize',Tsize);

%% loglog plot
loglog(x_sorted, y,'g-.','LineWidth',2);

title('Validation of Pareto sample generation');
set(gcf,'PaperPositionMode','auto');
saveas(gcf,'sample_verification.png','png');  % Choose another format, e.g. png, epsc if required

%% subplot















