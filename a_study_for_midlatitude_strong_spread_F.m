clear all;
close all;
%%%%Figure 1 geomagnetic index
datenum_a=datenum(2019,11,28,0,0,0);
datenum_z=datenum(2019,11,30,23,55,0);

load('kp_data_final.mat');
load('dst_data_final.mat');
figure;
x_date_string = 'Hour (UT)';

subplot(4,1,1);
nstep=3;%%hour
  xindex=1;
 clear date_str_x;
 for i=0:nstep:length(dst_data_final)
   str=sprintf('%02d', rem(i,24));
   date_str_x(xindex)={str};
   xindex = xindex+1;
 end
 

sf_time=datenum(2019,11,30,0,30,0):datenum(0,0,0,0,1,0):datenum(2019,11,30,8,0,0);
sf_bar(1:length(sf_time))=8;
b2 = bar(sf_time,sf_bar,0.2,'BaseValue',0,'FaceColor',[0.8 0.8 0.8],'EdgeColor',[0.8 0.8 0.8]); hold on;
baseline_handle2 = get(b2,'BaseLine');
set(baseline_handle2,'LineStyle','none');
 
bar(datenum_a-datenum(0,0,0,0,0,0):datenum(0,0,0,3,0,0):datenum_z-datenum(0,0,0,0,0,0), kp_data_final(1:end),'FaceColor',[0 0.45 0.74],'EdgeColor',[0 0.45 0.74]);hold on;
set(gca,'XTick',datenum_a:datenum(0,0,0,3,0,0):datenum_z);
set(gca,'XTickLabel','');
set(gca,'FontWeight','bold');
xlabel('','FontSize',12,'fontweight','bold');ylabel('Kp','FontSize',12,'fontweight','bold');
grid on;
axis([datenum_a datenum_z 0 8]);

kp_tr(1:length(kp_data_final))=3;
plot(datenum_a-datenum(0,0,0,0,0,0):datenum(0,0,0,3,0,0):datenum_z-datenum(0,0,0,0,0,0),(kp_tr),'r--');hold on;


x = [datenum(2019,11,28,0,0,0)+datenum(0,0,0,8,0,0) datenum(2019,11,28,0,0,0)+datenum(0,0,0,8,0,0) ];
y = [0 8];
line(x,y,'Color',[0 0.8 0],'LineStyle','--','LineWidth',2);

x = [datenum(2019,11,29,0,0,0)+datenum(0,0,0,8,0,0) datenum(2019,11,29,0,0,0)+datenum(0,0,0,8,0,0) ];
y = [0 8];
line(x,y,'Color',[0 0.8 0],'LineStyle','--','LineWidth',2);

x = [ datenum(2019,11,30,0,0,0)+datenum(0,0,0,8,0,0) datenum(2019,11,30,0,0,0)+datenum(0,0,0,8,0,0)];
y = [0 8];
line(x,y,'Color',[0 0.8 0],'LineStyle','--','LineWidth',2);

% x = [ datenum(2019,12,1,0,0,0) datenum(2019,12,1,0,0,0)];
% y = [0 8];
% line(x,y,'Color',[0.5 0.5 0.5],'LineStyle','--');

subplot(4,1,2);
nstep=3;%%hour
  xindex=1;
 clear date_str_x;
 for i=0:nstep:length(dst_data_final)
   str=sprintf('%02d', rem(i,24));
   date_str_x(xindex)={str};
   xindex = xindex+1;
 end
 
sf_time=datenum(2019,11,30,0,30,0):datenum(0,0,0,0,1,0):datenum(2019,11,30,8,0,0);
sf_bar(1:length(sf_time))=20;
b2 = bar(sf_time,sf_bar,0.2,'BaseValue',-50,'FaceColor',[0.8 0.8 0.8],'EdgeColor',[0.8 0.8 0.8]); hold on;
baseline_handle2 = get(b2,'BaseLine');
set(baseline_handle2,'LineStyle','none');
 
plot(datenum_a-datenum(0,0,0,0,0,0):datenum(0,0,0,1,0,0):datenum_z-datenum(0,0,0,0,0,0),dst_data_final(1:end),'k','linewidth',1);hold on;
set(gca,'XTick',datenum_a:datenum(0,0,0,3,0,0):datenum_z);
set(gca,'XTickLabel','');
set(gca,'FontWeight','bold');
xlabel('','FontSize',12,'fontweight','bold');ylabel('Dst (nT)','FontSize',12,'fontweight','bold');
grid on;
axis([datenum_a datenum_z -50 20]);

dst_tr(1:length(dst_data_final))=-30;
plot(datenum_a-datenum(0,0,0,0,0,0):datenum(0,0,0,1,0,0):datenum_z-datenum(0,0,0,0,0,0),(dst_tr),'r--');hold on;

x = [datenum(2019,11,28,0,0,0)+datenum(0,0,0,8,0,0) datenum(2019,11,28,0,0,0)+datenum(0,0,0,8,0,0) ];
y = [-50 20 ];
line(x,y,'Color',[0 0.8 0],'LineStyle','--','LineWidth',2);

x = [datenum(2019,11,29,0,0,0)+datenum(0,0,0,8,0,0) datenum(2019,11,29,0,0,0)+datenum(0,0,0,8,0,0) ];
y = [-50 20 ];
line(x,y,'Color',[0 0.8 0],'LineStyle','--','LineWidth',2);

x = [ datenum(2019,11,30,0,0,0)+datenum(0,0,0,8,0,0) datenum(2019,11,30,0,0,0)+datenum(0,0,0,8,0,0)];
y = [-50 20];
line(x,y,'Color',[0 0.8 0],'LineStyle','--','LineWidth',2);

% x = [ datenum(2019,12,1,0,0,0) datenum(2019,12,1,0,0,0)];
% y = [-50 20];
% line(x,y,'Color',[0.5 0.5 0.5],'LineStyle','--');

%%%foF2 and h'F2

load('iono_para.mat');

foF2=[iono_para(1).foF2' iono_para(2).foF2' iono_para(3).foF2' ];
hmF2=[iono_para(1).hmF2' iono_para(2).hmF2' iono_para(3).hmF2'];

subplot(4,1,3);
nstep=3;%%hour
  xindex=1;
 clear date_str_x;
 for i=0:nstep:length(foF2)
   str=sprintf('%02d', rem(i-8+24,24));
   date_str_x(xindex)={str};
   xindex = xindex+1;
 end

sf_time=datenum(2019,11,30,0,30,0):datenum(0,0,0,0,1,0):datenum(2019,11,30,8,0,0);
sf_bar(1:length(sf_time))=10;
b2 = bar(sf_time,sf_bar,0.2,'BaseValue',0,'FaceColor',[0.8 0.8 0.8],'EdgeColor',[0.8 0.8 0.8]); hold on;
baseline_handle2 = get(b2,'BaseLine');
set(baseline_handle2,'LineStyle','none');
 
plot(datenum_a-datenum(0,0,0,0,0,0):datenum(0,0,0,0,5,0):datenum_z-datenum(0,0,0,0,0,0),foF2(1:end),'b','linewidth',1);hold on;
set(gca,'XTick',datenum_a:datenum(0,0,0,3,0,0):datenum_z);
set(gca,'XTickLabel','');
set(gca,'FontWeight','bold');
xlabel('','FontSize',12,'fontweight','bold');ylabel('foF2 (MHz)','FontSize',12,'fontweight','bold');
grid on;
axis([datenum_a datenum_z 2 8]);

x = [datenum(2019,11,28,0,0,0)+datenum(0,0,0,8,0,0) datenum(2019,11,28,0,0,0)+datenum(0,0,0,8,0,0) ];
y = [2 10 ];
line(x,y,'Color',[0 0.8 0],'LineStyle','--','LineWidth',2);

x = [datenum(2019,11,29,0,0,0)+datenum(0,0,0,8,0,0) datenum(2019,11,29,0,0,0)+datenum(0,0,0,8,0,0) ];
y = [2 10 ];
line(x,y,'Color',[0 0.8 0],'LineStyle','--','LineWidth',2);

x = [ datenum(2019,11,30,0,0,0)+datenum(0,0,0,8,0,0) datenum(2019,11,30,0,0,0)+datenum(0,0,0,8,0,0)];
y = [2 10];
line(x,y,'Color',[0 0.8 0],'LineStyle','--','LineWidth',2);



subplot(4,1,4);
nstep=3;%%hour
  xindex=1;
 clear date_str_x;
 for i=0:nstep:length(hmF2)
   str=sprintf('%02d', rem(i-8+24,24));
   date_str_x(xindex)={str};
   xindex = xindex+1;
 end

sf_time=datenum(2019,11,30,0,30,0):datenum(0,0,0,0,1,0):datenum(2019,11,30,8,0,0);
sf_bar(1:length(sf_time))=400;
b2 = bar(sf_time,sf_bar,0.2,'BaseValue',0,'FaceColor',[0.8 0.8 0.8],'EdgeColor',[0.8 0.8 0.8]); hold on;
baseline_handle2 = get(b2,'BaseLine');
set(baseline_handle2,'LineStyle','none');

plot(datenum_a-datenum(0,0,0,0,0,0):datenum(0,0,0,0,5,0):datenum_z-datenum(0,0,0,0,0,0),hmF2(1:end),'b','linewidth',1);hold on;
set(gca,'XTick',datenum_a:datenum(0,0,0,3,0,0):datenum_z);
set(gca,'XTickLabel',date_str_x);
set(gca,'FontWeight','bold');
xlabel('Time (UT)','FontSize',12,'fontweight','bold');ylabel('hmF2 (km)','FontSize',12,'fontweight','bold');
grid on;
axis([datenum_a datenum_z 150 400]);


x = [datenum(2019,11,28,0,0,0)+datenum(0,0,0,8,0,0) datenum(2019,11,28,0,0,0)+datenum(0,0,0,8,0,0) ];
y = [150 400 ];
line(x,y,'Color',[0 0.8 0],'LineStyle','--','LineWidth',2);

x = [datenum(2019,11,29,0,0,0)+datenum(0,0,0,8,0,0) datenum(2019,11,29,0,0,0)+datenum(0,0,0,8,0,0) ];
y = [150 400 ];
line(x,y,'Color',[0 0.8 0],'LineStyle','--','LineWidth',2);

x = [ datenum(2019,11,30,0,0,0)+datenum(0,0,0,8,0,0) datenum(2019,11,30,0,0,0)+datenum(0,0,0,8,0,0)];
y = [150 400];
line(x,y,'Color',[0 0.8 0],'LineStyle','--','LineWidth',2);


%%%%TEC 
load('iono_gnsstec.mat');
figure;
subplot(3,1,1);
plot(iono_gnsstec.datenum,iono_gnsstec.vTECdata_days(:,10),'r','LineWidth',2);hold on;
plot(iono_gnsstec.datenum,iono_gnsstec.vTECdata_median,'k','LineWidth',2);hold on;

%%%x
xtick=iono_gnsstec.datenum(1):datenum(0,0,0,2,0,0):iono_gnsstec.datenum(end);
set(gca, 'XTick',xtick);
set(gca,'XMinorTick','on')
xindex=1;
clear date_str_x;
for i=1:length(xtick)
    [nyear,nmon,nday,nhour,nmin,nsec]=datevec(xtick(i));
    str=sprintf('%02d',nhour);
    date_str_x(xindex)={str};
    xindex = xindex+1;
end
set(gca,'XTickLabel',date_str_x);
grid on;
box on;
axis([iono_gnsstec.datenum(1) iono_gnsstec.datenum(end) 4 12]);

% axis([0 2880 4 20]);
title('GPS TEC','FontWeight','bold','Fontsize',12);
xlabel('Time (UT)','Fontsize',12,'FontWeight','bold');
ylabel('VTEC (TECu)','Fontsize',12,'FontWeight','bold');
set(gca,'FontWeight','bold','FontSize',12);


%%%scintilation
load('iono_gnss_20191129.mat')
iono_gnss=iono_gnss_20191129;
% figure;
subplot(3,1,2);
S4_G_pos=(iono_gnss.SatType=='G') & (iono_gnss.ELE>=40) & iono_gnss.S4<1;
G_color=iono_gnss.SatNum(S4_G_pos);
colormap('jet');
scatter(iono_gnss.datenum(S4_G_pos),iono_gnss.S4(S4_G_pos),10,G_color,'filled');
colorbar;
 
xtick=iono_gnss.datenum(1):datenum(0,0,0,2,0,0):iono_gnss.datenum(end);
set(gca, 'XTick',xtick);
set(gca,'XMinorTick','on')
xindex=1;
clear date_str_x;
for i=1:length(xtick)
    [nyear,nmon,nday,nhour,nmin,nsec]=datevec(xtick(i));
    str=sprintf('%02d',nhour);
    date_str_x(xindex)={str};
    xindex = xindex+1;
end
set(gca,'XTickLabel',date_str_x);
grid on;
box on;

set(gca,'FontWeight','bold','FontSize',12);
xlabel('Time (UT)','FontWeight','bold','Fontsize',12);
ylabel('S4 index','FontWeight','bold','Fontsize',12);
title('GPS Scintillation','FontWeight','bold','Fontsize',12);
axis([iono_gnss.datenum(1) iono_gnss.datenum(end) 0 0.4]);


subplot(3,1,3);
S4_BD_pos=(iono_gnss.SatType=='C') & (iono_gnss.ELE>=40) & iono_gnss.S4<1;
BD_color=iono_gnss.SatNum(S4_BD_pos);
colormap('jet');
scatter(iono_gnss.datenum(S4_BD_pos),iono_gnss.S4(S4_BD_pos),10,BD_color,'filled');
colorbar;
 
xtick=iono_gnss.datenum(1):datenum(0,0,0,2,0,0):iono_gnss.datenum(end);
set(gca, 'XTick',xtick);
set(gca,'XMinorTick','on')
xindex=1;
clear date_str_x;
for i=1:length(xtick)
    [nyear,nmon,nday,nhour,nmin,nsec]=datevec(xtick(i));
    str=sprintf('%02d',nhour);
    date_str_x(xindex)={str};
    xindex = xindex+1;
end
set(gca,'XTickLabel',date_str_x);
grid on;
box on;

xlabel('Time (UT)','FontWeight','bold','Fontsize',12);
ylabel('S4 index','FontWeight','bold','Fontsize',12);
title('Beidou Scintillation','FontWeight','bold','Fontsize',12);
axis([iono_gnss.datenum(1) iono_gnss.datenum(end) 0 0.4]);
set(gca,'FontWeight','bold','FontSize',12);

%%%%%ionograms

%%%figure serials ionograms   %%%1201 1，25，49，73
dirstring = 'ZHY\';%'D:\iono_station\Zhangye\20191130\';
Files = dir(strcat(dirstring,'*.amp'));
LengthFiles = length(Files);
dbMax=65;

figure;
figrow=3;
figcol=4;

figindex=1;
for i = 100:2:250
        sFullFileName = [dirstring, Files(i).name];
        [AmpData,AmpHead] = ReadDatafile(sFullFileName);       
       dateIndex=datenum(AmpHead.m_fStartyear,AmpHead.m_fStartmonth,AmpHead.m_fStartday, AmpHead.m_fStarthour,AmpHead.m_fStartmin,0)-datenum(0,0,0,8,0,0);
       [LT_year LT_month LT_day LT_hour LT_min LT_sec]=datevec(dateIndex); 
       strLTtime =datestr(dateIndex);%sprintf('%02d  %02d:%02d LT',LT_hour, LT_min);
        AmpHead.m_fEarthWaveLocation = 8;
        for xIndex=1:AmpHead.m_fFreqTotalNum
            for yIndex=AmpHead.m_fEarthWaveLocation:AmpHead.m_fTotalDoorNum
                zData(xIndex,yIndex-AmpHead.m_fEarthWaveLocation+1)= AmpData(AmpHead.m_fTotalDoorNum*(xIndex-1) + yIndex);
            end
            avg_freq = sum(zData(xIndex,:))/length((zData(xIndex,:)));
            zData(xIndex,:) =zData(xIndex,:) -avg_freq;
        end
        
        zData(zData<0)=0;        
        %%%OrgzData 原始去除地波数据
        OrgzData = zData;
        %zData=zData;
        xFreq = AmpHead.m_fStartFreq:(AmpHead.m_fStepFreq/1000):AmpHead.m_fStopFreq  ;
        [dataM, dataN] = size(zData);
        yHeight=AmpHead.m_fRangeOfResolution:AmpHead.m_fRangeOfResolution:dataN*AmpHead.m_fRangeOfResolution;
       
       subfig = subplot(figrow,figcol,figindex);

       colormap(jet);
       imagesc(xFreq, yHeight,zData');grid on;hold on;  
       set(gca,'YDir','normal'); 
       caxis([0 dbMax]);
       xlabel('Frequency (MHz)','FontSize',12,'fontweight','bold');ylabel('Virtual height (km)','FontSize',12,'fontweight','bold');
       axis([2 10 90 800]);
       title([strLTtime(end-8:end-3) ' UT'],'FontSize',12,'fontweight','bold');
       set(gca,'FontSize',12,'fontweight','bold'); 
       figindex = figindex+1;    
       if figindex>figrow*figcol
          break; 
       end
end
