function  nmps_save( fig , fname)
%nmps_save Export a figure to a file
%   fig:    Figure handle (try: gcf)
%   fname:  File name of output
    nmps_settings; 
    set(fig,'PaperPositionMode','auto',...
        'Position', [figurePosBottom, figurePosLeft, figureWidth, figureHeight]);
    saveas(fig,fname,outputFormat);  % Vælg andet format, eks. png hvis krævet
end

