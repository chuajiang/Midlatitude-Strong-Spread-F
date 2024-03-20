% read ionogram from *.amp file
function [data, head] = ReadDatafile(sFullFileName)

% sFullFileName = 
data=0;
head=0;
[sFilePath, sFileName, sFileExt] = fileparts(sFullFileName);%�ָ������ļ���
     switch sFileExt
        case '.amp'
        case '.AMP'
        otherwise
        error('δָ�����ļ�����: ','sFileExt');    
      end
              %AMPHeadPara;

              [FileId, errmessage] = fopen(sFullFileName, 'r');%����ļ�id
             if (FileId == -1)
%               error(['��ȡ�ļ�����: ',errmessage]);
              return
             end
             
             [AMPData,nCount]= fread(FileId,'float32');
             if length(AMPData)<100
                fclose(FileId);
                return;
             end

                AMPHeadPara.m_fStartFreq = AMPData(1);%0
                AMPHeadPara.m_fStepFreq = AMPData(2);%1
                AMPHeadPara.m_fStopFreq = AMPData(3);%2
                AMPHeadPara.m_fSamplingTimes = AMPData(4);%3

                AMPHeadPara.m_fTotalDoorNum = AMPData(5);%4
                AMPHeadPara.m_fRangeOfResolution = AMPData(6);%5
                AMPHeadPara.m_fFreqTotalNum = AMPData(7);%6
                AMPHeadPara.m_fEarthWaveLocation = AMPData(8);%7 
                AMPHeadPara.m_fCodeType = AMPData(9);%8  1�������룬������M����
                AMPHeadPara.m_fCodeOrder = AMPData(10);%9
                AMPHeadPara.m_fPluseWidth = AMPData(11);%10
                AMPHeadPara.m_fPRP = AMPData(12);%11 �����ظ�����

                AMPHeadPara.m_fStartyear = AMPData(13);%12
                AMPHeadPara.m_fStartmonth = AMPData(14);%13
                AMPHeadPara.m_fStartday = AMPData(15);%14
                AMPHeadPara.m_fStarthour = AMPData(16);%15
                AMPHeadPara.m_fStartmin = AMPData(17);%16
                AMPHeadPara.m_fStartsec = AMPData(18);%17
                AMPHeadPara.m_ntimeindex = round((AMPHeadPara.m_fStarthour*60 + AMPHeadPara.m_fStartmin)/5 +1);

                AMPHeadPara.m_fStopyear = AMPData(19);%18
                AMPHeadPara.m_fStopmonth = AMPData(20);%19
                AMPHeadPara.m_fStopday = AMPData(21);%20
                AMPHeadPara.m_fStophour = AMPData(22);%21
                AMPHeadPara.m_fStopmin = AMPData(23);%22
                AMPHeadPara.m_fStopsec = AMPData(24);%23

                AMPHeadPara.m_fLatitude = AMPData(25);%24
                AMPHeadPara.m_fLatitude2 = AMPData(26);%25
                AMPHeadPara.m_fLatitude3 = AMPData(27);%26
                AMPHeadPara.m_fNS = AMPData(28);%27 ��γ��γ
                AMPHeadPara.m_fLongitude = AMPData(29);%28
                AMPHeadPara.m_fLongitude2 = AMPData(30);%29
                AMPHeadPara.m_fLongitude3 = AMPData(31);%30
                AMPHeadPara.m_fEW = AMPData(32);%31 ��������
                AMPHeadPara.m_fCodeWidth = AMPData(33);%32 ���
                AMPHeadPara.m_fSIF = AMPData(34);%33 0��ɨƵ��1����Ƶ��2����Ƶ
                AMPHeadPara.m_fShowDoorNum = AMPData(35);%34 ��ʾ������
                AMPHeadPara.m_fSoundType = AMPData(36);%35  0������ VS��1��б��OB��2��б��OS
                AMPHeadPara.m_ffoF2 = AMPData(37);%36 F2����Ƶ MHz
                AMPHeadPara.m_fhmF2 = AMPData(38);%37 F2���� Km
                AMPHeadPara.m_ffoF1 = AMPData(39);%38 F1����Ƶ MHz
                AMPHeadPara.m_fhmF = AMPData(40);%39 F���� Km
                AMPHeadPara.m_ffoE = AMPData(41);%40 E����Ƶ MHz
                AMPHeadPara.m_fhmE = AMPData(42);% 41 E���� Km
                AMPHeadPara.m_ffoEs = AMPData(43);%42 Es����Ƶ MHz
                AMPHeadPara.m_fhEs = AMPData(44);%43 Es��� Km
                AMPHeadPara.m_ffbEs = AMPData(45);%44 Es���ڱ�Ƶ�� MHz
             
                
                fclose(FileId);

             

head = AMPHeadPara;
datatmp =AMPData(501:(nCount),1);
if length(datatmp)~=AMPHeadPara.m_fTotalDoorNum*AMPHeadPara.m_fFreqTotalNum
    data=0;
    return;
end
data = reshape(datatmp,AMPHeadPara.m_fTotalDoorNum,AMPHeadPara.m_fFreqTotalNum);
a=[];