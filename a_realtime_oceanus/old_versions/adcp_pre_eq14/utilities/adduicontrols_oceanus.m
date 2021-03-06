function [guihands,plotinfo]=adduicontrols_oceanus(plotinfo,h0)
%
% This code defines the GUI parameters that are used when plotting realtime
% ADCP data on board the Oceanus
%
% Originally written by Sasha Perlin
% updated and commented by Sally Warner, January 2014
%
%


% define gui box locations (in normalized plot units i.e. between 0 and 1)
x0 = 0.94;
y0 = 0.9;

% define box sizes
dx = 0.05;
dy = 0.05;

% define color
backcol = [1 1 1];      % white
forecol = [0 0 0];      % black
        
% define font size
fs = 14;


%%%%%%%%%%% MAXIMUM DEPTH WH300 %%%%%%%%%%%
% GUI control for the box that determines the maximum depth of the WH300 (1) 
% and the corresponding text: "Max depth WH300" (2)
guihands(1) =  uicontrol('Parent',h0,...        
           'Units','normal', ...
           'BackgroundColor',backcol, ...
           'ListboxTop',0, ...
           'fontsize',fs,...		   
           'Position',[x0 y0 dx dy], ...
           'Style','edit',...       % number in a box that can be edited
           'String',num2str(plotinfo.ylim300(2)),...
           'foregroundcol',forecol);
guihands(2) =  uicontrol('Parent',h0,...
           'Units','normal', ...
           'BackgroundColor',backcol, ...
           'ListboxTop',0, ...
           'fontsize',fs,...		   
           'Position',[x0-dx y0 dx dy], ...
           'Style','text',...       % text that describes the box
           'String',{'Max depth'; 'WH300 [m]'},...
           'foregroundcol',forecol);
       
       
%%%%%%%%%%% MAXIMUM DEPTH OS75 %%%%%%%%%%%
% GUI control for the box that determines the maximum depth of the OS75 (1) 
% and the corresponding text: "Max depth OS75" (2)
guihands(3) =  uicontrol('Parent',h0,...        
           'Units','normal', ...
           'BackgroundColor',backcol, ...
           'ListboxTop',0, ...
           'fontsize',fs,...		   
           'Position',[x0 y0-1.5*dy dx dy], ...
           'Style','edit',...       % number in a box that can be edited
           'String',num2str(plotinfo.ylim75(2)),...
           'foregroundcol',forecol);
guihands(4) =  uicontrol('Parent',h0,...
           'Units','normal', ...
           'BackgroundColor',backcol, ...
           'ListboxTop',0, ...
           'fontsize',fs,...		   
           'Position',[x0-dx y0-1.5*dy dx dy], ...
           'Style','text',...       % text that describes the box
           'String',{'Max depth';'OS75 [m]'},...
           'foregroundcol',forecol);
       
       
%%%%%%%%%%% START TIME WH300 %%%%%%%%%%%
% GUI control for the box that determines the starttime of the plot (1) 
% and the corresponding text: "days before now" (2)       
guihands(5) =  uicontrol('Parent',h0,...
           'Units','normal', ...
           'BackgroundColor',backcol, ...
           'ListboxTop',0, ...
           'fontsize',fs,...		   
           'Position',[x0 y0-3*dy dx dy], ...
           'Style','edit',...       % number in a box that can be edited
           'String',num2str(plotinfo.xlim(1)),...
           'foregroundcol',forecol);
guihands(6) =  uicontrol('Parent',h0,...
           'Units','normal', ...
           'BackgroundColor',backcol, ...
           'ListboxTop',0, ...
           'fontsize',fs,...		   
           'Position',[x0-dx y0-3*dy dx dy], ...
           'Style','text',...       % text that describes the box
           'String',{'days before now:'},...
           'foregroundcol',forecol);
       
   
%%%%%%%%%%% MAXIMUM VELOCITY - COLOR RANGE - WH300 %%%%%%%%%%%
% GUI control for the box that determines range of the color axis (1) 
% and the corresponding text: "Max |u|" (2)  
guihands(7) =  uicontrol('Parent',h0,...
           'Units','normal', ...
           'BackgroundColor',backcol, ...
           'ListboxTop',0, ...
           'fontsize',fs,...		   
           'Position',[x0 y0-4.5*dy dx dy], ...
           'Style','edit',...     % number in a box that can be edited
           'String',num2str(plotinfo.clim(2)),...
           'foregroundcol',forecol);
guihands(8) =  uicontrol('Parent',h0,...
           'Units','normal', ...
           'BackgroundColor',backcol, ...
           'ListboxTop',0, ...
           'fontsize',fs,...		   
           'Position',[x0-dx y0-4.5*dy dx dy], ...
           'Style','text',...       % text that describes the box
           'String',{'Max |u|';'[m/s]'},...
           'foregroundcol',forecol);
       
       
%%%%%%%%%%% BACKSCATTER COLOR RANGE - WH300 %%%%%%%%%%%
% GUI control for the box that determines range of the color axis (1) 
% and the corresponding text: "Max |u|" (2)  
guihands(9) =  uicontrol('Parent',h0,...
           'Units','normal', ...
           'BackgroundColor',backcol, ...
           'ListboxTop',0, ...
           'fontsize',fs,...		   
           'Position',[x0 y0-6*dy dx dy], ...
           'Style','edit',...     % number in a box that can be edited
           'String',num2str(plotinfo.climamp(2)),...
           'foregroundcol',forecol);
guihands(10) =  uicontrol('Parent',h0,...
           'Units','normal', ...
           'BackgroundColor',backcol, ...
           'ListboxTop',0, ...
           'fontsize',fs,...		   
           'Position',[x0-dx y0-6*dy dx dy], ...
           'Style','text',...       % text that describes the box
           'String',{'Max echo';'[dB]'},...
           'foregroundcol',forecol);
       
       
       
       
      