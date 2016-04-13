clear;

clc;

close all ;

format long g

high=154;

data=importdata('C:\Users\sunming\Desktop\�°汾����--��������\5.1��װ��\Data\45(dy)_2.txt',';');  

data1=round(data(:,1));       %1000-3000   %1600:5000

data2=round(data(:,2));      %1000-3000

data3=round(data(:,3));

data4=round(data(:,4));

data=[data1,data2,data3,data4];

plot(data);

legend('data1','data2','data3','data4');




figure;

plot(data1);

output=round(data1);

for i=1:length(output)-30
    if((output(i)>output(i+30)+20)&&(output(i)>1400)&&(output(i)>output(i+5))&&(output(i+5)>output(i+10))&&(output(i+10)>output(i+15))&&(output(i+15)>output(i+20))&&(output(i+20)>output(i+25)))
       
        break;                                                                            %�Ҷ���
        
    end
    
end


start = i;  %+200  +100                    % search the  top  sample 


for i=start:length(output)   
    
    if(output(i)<=560)
        
        break;
        
    end                                                %��ABI��Ч����
    
end


finish=i;                                         % search   the  valid   data                          

 hold on;

 plot(start,output(start),'ro',finish,output(finish),'ro');
 

dlmwrite('C:\Users\sunming\Desktop\ABI\1.txt',output(start:finish),'delimiter', '\n','precision','%d');


d0=0;
d1=0;
d2=0;
d3=0;
d4=0;
d5=0;
d6=0;
d7=0;
d8=0;
d9=0;
d10=0;
d11=0;
d12=0;
y0=0;
y1=0;
y2=0;

for i=1:length(data1)
     y0=2*y1-y2+data1(i)-2*d4+d9;
     y1=y0;
     y2=y1;
     
    d12=d11 ;
	d11=d10 ;
	d10=d9 ; 
	d9=d8 ;
	d8=d7 ;
	d7=d6 ;
	d6=d5 ;
	d5=d4 ;
	d4=d3 ;
	d3=d2 ;
	d2=d1 ;
	d1=d0 ;
	d0=data1(i) ;						
	data1(i)=y0/25;      %32����ԭʼ��ֵ       //�޸�
end



data1=data1(5:length(data1));                  %//�޸�
% output=round(data1);
% plot(output)


output=round(data1);

start=finish+200;                                         %��������Ч����

finish=length(data1);

left_Ankle_start=start;

plot(data1);

hold on;

plot(start,output(start),'ro',finish,output(finish),'ro');





figure;
plot(data2);


output=round(data2);

for i=1:length(output)-30
      if((output(i)>output(i+30)+20)&&(output(i)>1400)&&(output(i)>output(i+5))&&(output(i+5)>output(i+10))&&(output(i+10)>output(i+15))&&(output(i+15)>output(i+20))&&(output(i+20)>output(i+25)))
        break;
      end                                                              %�Ҷ���
end

start=i;  %+200  %+100

for i=start:length(output)
    
    if(output(i)<=560)
        break;
    end                                                              %��ABI��Ч����
end

finish=i;

hold on; 

plot(start,output(start),'ro',finish,output(finish),'ro');

dlmwrite('C:\Users\sunming\Desktop\ABI\2.txt',output(start:finish),'delimiter', '\n','precision','%d')


d0=0;
d1=0;
d2=0;
d3=0;
d4=0;
d5=0;
d6=0;
d7=0;
d8=0;
d9=0;
d10=0;
d11=0;
d12=0;
y0=0;
y1=0;
y2=0;

for i=1:length(data2)
    
     y0=2*y1-y2+data2(i)-2*d4+d9;
     
     y2=y1;
     y1=y0;
     
    d12=d11 ;
	d11=d10 ;
	d10=d9 ;
	d9=d8 ;
	d8=d7 ;
	d7=d6 ;
	d6=d5 ;
	d5=d4 ;
	d4=d3 ;
	d3=d2 ;
	d2=d1 ;
	d1=d0 ;
	d0=data2(i) ;						
	data2(i)=y0/25;         %32����ԭʼ��ֵ
end

data2=data2(5:length(data2));

% output=round(data2)+150;
% plot(output)

output=round(data2);

start=finish+200;             

finish=length(data1);

right_Ankle_start=start;                                                            %��������Ч����

plot(data2);

hold on ;

plot(start,output(start),'ro',finish,output(finish),'ro');


figure ;

plot(data3);

output=round(data3);

for i=1:length(output)-30
    if((output(i)>output(i+30)+20)&&(output(i)>1400)&&(output(i)>output(i+5))&&(output(i+5)>output(i+10))&&(output(i+10)>output(i+15))&&(output(i+15)>output(i+20))&&(output(i+20)>output(i+25)))
        break;
    end
end                                                                                   %�Ҷ���

start=i;    %+200  +100

for i=start:length(output)
    if(output(i)<=560)
        break;
    end
end

finish=i;                                                                     % ABI��Ч����               

hold on ;

plot(start,output(start),'ro',finish,output(finish),'ro')

dlmwrite('C:\Users\sunming\Desktop\ABI\3.txt',output(start:finish),'delimiter', '\n','precision','%d')



d0=0;
d1=0;
d2=0;
d3=0;
d4=0;
d5=0;
d6=0;
d7=0;
d8=0;
d9=0;
d10=0;
d11=0;
d12=0;
y0=0;
y1=0;
y2=0;

for i=1:length(data3)
     y0=2*y1-y2+data3(i)-2*d4+d9;
     y2=y1;
     y1=y0;
     
    d12=d11 ;
	d11=d10 ;
	d10=d9 ;
	d9=d8 ;
	d8=d7 ;
	d7=d6 ;
	d6=d5 ;
	d5=d4 ;
	d4=d3 ;
	d3=d2 ;
	d2=d1 ;
	d1=d0 ;
	d0=data3(i) ;						
	data3(i)=y0/25;            %32����ԭʼ��ֵ
end

data3=data3(5:length(data3));

% output=round(data3)+150;
% plot(output)

output=round(data3);

start=finish+200;

finish=length(data3);

left_Brachial_start=start;                                     %��������Ч ����

plot(data3);

hold on ;

plot(start,output(start),'ro',finish,output(finish),'ro');


figure
plot(data4);

output=round(data4) ;

for i=1:length(output)-30
   if((output(i)>output(i+30)+20)&&(output(i)>1400)&&(output(i)>output(i+5))&&(output(i+5)>output(i+10))&&(output(i+10)>output(i+15))&&(output(i+15)>output(i+20))&&(output(i+20)>output(i+25)))
        break;
    end
end                                                                                          %�Ҷ���

start=i;    %+200  +100

for i=start:length(output)
    if(output(i)<=560)
        break;
    end
end

finish=i;                                                                                 % ABI��Ч����

hold on ;

plot(start,output(start),'ro',finish,output(finish),'ro') ;

dlmwrite('C:\Users\sunming\Desktop\ABI\4.txt',output(start:finish),'delimiter', '\n','precision','%d')

d0=0 ;
d1=0 ;
d2=0 ;
d3=0 ;
d4=0 ;
d5=0 ;
d6=0 ;
d7=0 ;
d8=0 ; 
d9=0 ;
d10=0 ;
d11=0 ;
d12=0 ;
y0=0   ;
y1=0   ;
y2=0  ;

for i=1:length(data4)
     y0=2*y1-y2+data4(i)-2*d4+d9;
     y2=y1;
     y1=y0;
     
    d12=d11 ;
	d11=d10 ;
	d10=d9 ;
	d9=d8 ;
	d8=d7 ;
	d7=d6 ;
	d6=d5 ;
	d5=d4 ;
	d4=d3 ;
	d3=d2 ;
	d2=d1 ;
	d1=d0 ;
	d0=data4(i) ;						
	data4(i)=y0/25;             %32����ԭʼ��ֵ
end

data4=data4(5:length(data4));

% output=round(data4)+150;
% plot(output)


output=round(data4);

start=finish+200;

finish=length(data4);

right_Brachial_start=start;                                       %��������Ч����

plot(data4);

hold on;

plot(start,output(start),'ro',finish,output(finish),'ro')  ;

Max_maibobo_start=max([left_Ankle_start,right_Ankle_start,left_Brachial_start,right_Brachial_start]);             %���Լ

dlmwrite('C:\Users\sunming\Desktop\PWV\1.txt',(data1(Max_maibobo_start:finish)),'delimiter', '\n','precision','%.2f')
dlmwrite('C:\Users\sunming\Desktop\PWV\2.txt',(data2(Max_maibobo_start:finish)),'delimiter', '\n','precision','%.2f')
dlmwrite('C:\Users\sunming\Desktop\PWV\3.txt',(data3(Max_maibobo_start:finish)),'delimiter', '\n','precision','%.2f')
dlmwrite('C:\Users\sunming\Desktop\PWV\4.txt',(data4(Max_maibobo_start:finish)),'delimiter', '\n','precision','%.2f')




[Forecast_Systolic_pressure,Forecast_Diastolic_pressure,dingdian]=bloodPress_2('C:\Users\sunming\Desktop\ABI\1.txt') ;

Ankle_left_bloodPress=Forecast_Systolic_pressure;
Ankle_left_Diastolic=Forecast_Diastolic_pressure;
Ankle_left_dingdian=dingdian;

[Forecast_Systolic_pressure,Forecast_Diastolic_pressure,dingdian]=bloodPress_2( 'C:\Users\sunming\Desktop\ABI\2.txt');
Ankle_right_bloodPress=Forecast_Systolic_pressure;
Ankle_right_Diastolic=Forecast_Diastolic_pressure;
Ankle_right_dingdian=dingdian;

[Forecast_Systolic_pressure,Forecast_Diastolic_pressure,dingdian]=bloodPress_2( 'C:\Users\sunming\Desktop\ABI\3.txt');
Brachial_left_bloodPress=Forecast_Systolic_pressure;
Brachial_left_Diastolic=Forecast_Diastolic_pressure;
Brachial_left_dingdian=dingdian;

[Forecast_Systolic_pressure,Forecast_Diastolic_pressure,dingdian]=bloodPress_2( 'C:\Users\sunming\Desktop\ABI\4.txt');
Brachial_right_bloodPress=Forecast_Systolic_pressure;
Brachial_right_Diastolic=Forecast_Diastolic_pressure;
Brachial_right_dingdian=dingdian;


% Brachial_left_bloodPress=130
% Brachial_right_bloodPress=135
% Ankle_left_bloodPress=150
% Ankle_right_bloodPress=155

Ankle_left_bloodPress;
Ankle_right_bloodPress;
Brachial_left_bloodPress;
Brachial_right_bloodPress;





% height=176
% 
% La=0.2195*height-2.07340
% Lb=0.5643*height-18.381+0.2486*height+30.709

% baPWV=(Lb-La)/PTTba











data=importdata('C:\Users\sunming\Desktop\PWV\1.txt');
figure;
plot(data);                                                                                    %ԭʼ����������
beifen_data=data;

left_Ankle_data2=diff(data);                                                       % һ�ײ��                                     
left_Ankle_data3=diff(left_Ankle_data2);                                   % ���ײ��

left_Ankle_data2=(round(left_Ankle_data2.*100))./100;           %  ���㻯    
left_Ankle_data3=(round(left_Ankle_data3.*100))./100;           %  ���㻯

left_Ankle_data3(abs(left_Ankle_data3)<0.00001)=0;               % ��С�ֱ���  

data=left_Ankle_data3;                   



count=0;

left_Ankle_Point=[];

i=100;
while(i<=length(data)-100)
    if  ((data(i+30)>=data(i))&&(data(i+30)>=data(i+1))&&(data(i+30)>=data(i+2))&&(data(i+30)>=data(i+3))&&(data(i+30)>=data(i+4))&&...
        (data(i+30)>=data(i+5))&&(data(i+30)>=data(i+6))&&(data(i+30)>=data(i+7))&&(data(i+30)>=data(i+8))&&(data(i+30)>=data(i+9))&&...
        (data(i+30)>=data(i+10))&&(data(i+30)>=data(i+11))&&(data(i+30)>=data(i+12))&&(data(i+30)>=data(i+13))&&(data(i+30)>=data(i+14))&&...
        (data(i+30)>=data(i+15))&&(data(i+30)>=data(i+16))&&(data(i+30)>=data(i+17))&&(data(i+30)>=data(i+18))&&(data(i+30)>=data(i+19))&&...
        (data(i+30)>=data(i+20))&&(data(i+30)>=data(i+21))&&(data(i+30)>=data(i+22))&&(data(i+30)>=data(i+23))&&(data(i+30)>=data(i+24))&&...
        (data(i+30)>=data(i+25))&&(data(i+30)>=data(i+26))&&(data(i+30)>=data(i+27))&&(data(i+30)>=data(i+28))&&(data(i+30)>=data(i+29))&&...
        (data(i+30)>=data(i+31))&&(data(i+30)>=data(i+32))&&(data(i+30)>=data(i+33))&&(data(i+30)>=data(i+34))&&(data(i+30)>=data(i+35))&&...
        (data(i+30)>=data(i+36))&&(data(i+30)>=data(i+37))&&(data(i+30)>=data(i+38))&&(data(i+30)>=data(i+39))&&(data(i+30)>=data(i+40))&&...
        (data(i+30)>=data(i+41))&&(data(i+30)>=data(i+42))&&(data(i+30)>=data(i+43))&&(data(i+30)>=data(i+44))&&(data(i+30)>=data(i+45))&&...
        (data(i+30)>=data(i+46))&&(data(i+30)>=data(i+47))&&(data(i+30)>=data(i+48))&&(data(i+30)>=data(i+49))&&(data(i+30)>=data(i+50))&&...
        (data(i+30)>=data(i+51))&&(data(i+30)>=data(i+52))&&(data(i+30)>=data(i+53))&&(data(i+30)>=data(i+54))&&(data(i+30)>=data(i+55))&&...
        (data(i+30)>=data(i+56))&&(data(i+30)>=data(i+57))&&(data(i+30)>=data(i+58))&&(data(i+30)>=data(i+59))&&(data(i+30)>=data(i+60))&&(beifen_data(i+30)<beifen_data(i+55))&&(left_Ankle_data2(i+37)>=0)&&(left_Ankle_data2(i+30)>=0)&&(left_Ankle_data2(i+35)>=0))  %&&(max(beifen_data(i+30:i+45))-beifen_data(i+30)>6)
                                                                                                                         %%   Ѱ�Ҷ���΢�ּ���ֵ�㣬60����Ϊ����������� 
        if(count==0)
            left_Ankle_Point=[left_Ankle_Point,i+30];                                           %%  ��ʼ���ö���΢�ּ�ֵ��  
            count=count+1;
        end
%         if((count==1)&&(i+30>left_Ankle_Point(length(left_Ankle_Point))+60))
%                                                                                                                                 %% �������������������ҵ��µĺ��ʵ�                
        if((count==1)&&(i+30>left_Ankle_Point(length(left_Ankle_Point))+60)&&(i+30<left_Ankle_Point(length(left_Ankle_Point))+130))
            left_Ankle_Point=[left_Ankle_Point,i+30];                                                 %% �����¶���΢�ּ�ֵ��    
%             count=count+1;
        end
%         if((count==1)&&(i+30>left_Ankle_Point(length(left_Ankle_Point))+130))
%            left_Ankle_Point=[left_Ankle_Point,round((i+30+left_Ankle_Point(length(left_Ankle_Point)))/2)];
%            left_Ankle_Point=[left_Ankle_Point,i+30];
%         end

%         if((count==1)&&(i+30>left_Ankle_Point(length(left_Ankle_Point))+130)&&(i+30<=left_Ankle_Point(length(left_Ankle_Point))+210))
%            left_Ankle_Point=[left_Ankle_Point,round((i+30+left_Ankle_Point(length(left_Ankle_Point)))/2)];
%            left_Ankle_Point=[left_Ankle_Point,i+30];
%         end
        if((count==1)&&(i+30>left_Ankle_Point(length(left_Ankle_Point))+130))         %% ����һ���������������ҵ��µĺ��ʵ� 
            
            for temp_0301=left_Ankle_Point(length(left_Ankle_Point))+50:left_Ankle_Point(length(left_Ankle_Point))+130     %%©���İ������
              
                 temp_sum=0;
                 
                for kkk=-30:30 
                    
                if(data(temp_0301)>=data(temp_0301+kkk))                  %%Ѱ�Ұ�����ڼ���ֵ��
                     temp_sum=temp_sum+1;
                end
                end
                
                if((temp_sum>=60)&&(beifen_data(temp_0301)<beifen_data(temp_0301+25))&&(left_Ankle_data2(temp_0301+7)>=0)&&(left_Ankle_data2(temp_0301)>=0)&&(left_Ankle_data2(temp_0301+5)>=0))          
                    left_Ankle_Point=[left_Ankle_Point,temp_0301];           %%�����¶���΢�ּ�ֵ��   
                    i=temp_0301;
                    break;
                end
                
                
            end                                                        
            
                    
           if(temp_0301==left_Ankle_Point(length(left_Ankle_Point))+130)          %%����̫�ϸ�60��������ڼ���ֵ��û���ҵ�         
              for temp_0301=left_Ankle_Point(length(left_Ankle_Point))+50:left_Ankle_Point(length(left_Ankle_Point))+130
                 
                  temp_sum=0;
                  for kkk=-30:30 
                  if(data(temp_0301)>=data(temp_0301+kkk))                                 %%��������59������Ѱ��
                     temp_sum=temp_sum+1;
                  end
                  end
                  if((temp_sum>=59)&&(beifen_data(temp_0301)<beifen_data(temp_0301+25))&&(left_Ankle_data2(temp_0301+7)>=0)&&(left_Ankle_data2(temp_0301)>=0)&&(left_Ankle_data2(temp_0301+5)>=0))          
                     left_Ankle_Point=[left_Ankle_Point,temp_0301];
                     i=temp_0301;
                     break;
                  end
              end   
           end
          
           if(temp_0301==left_Ankle_Point(length(left_Ankle_Point))+130)                %%����̫�ϸ�59��������ڼ���ֵ��û���ҵ� 
               
              for temp_0301=left_Ankle_Point(length(left_Ankle_Point))+50:left_Ankle_Point(length(left_Ankle_Point))+130
                  
                  temp_sum=0;
                  
                  for kkk=-30:30 
                  if(data(temp_0301)>=data(temp_0301+kkk))                                        %%��������58������Ѱ��
                     temp_sum=temp_sum+1;
                  end
                  end
                  if((temp_sum>=58)&&(beifen_data(temp_0301)<beifen_data(temp_0301+25))&&(left_Ankle_data2(temp_0301+7)>=0)&&(left_Ankle_data2(temp_0301)>=0)&&(left_Ankle_data2(temp_0301+5)>=0))          
                     left_Ankle_Point=[left_Ankle_Point,temp_0301];
                     i=temp_0301;
                     break;
                  end
              end   
           end
          
            
            
        end    
    end
    
    
    if(count==2)
        break;
    end 
    i=i+1;
end

hold on;

% left_Ankle_Point=left_Ankle_Point+1;

plot(left_Ankle_Point,beifen_data(left_Ankle_Point),'ro');                               %%���ƶ���΢�ּ���ֵ���Ӧ��ԭʼ����
% axis([0,length(data),500,700])
% plot(left_Ankle_Point(1),data(left_Ankle_Point(1)),'ro',left_Ankle_Point(2),data(left_Ankle_Point(2)),'ro')



data=importdata('C:\Users\sunming\Desktop\PWV\2.txt');
figure;

plot(data)

beifen_data=data;                                                                                             %ԭʼ����������

right_Ankle_data2=diff(data);                                                                           % һ�ײ��                                                               
   
right_Ankle_data3=diff(right_Ankle_data2);                                                     % ���ײ��                                              

right_Ankle_data2=(round(right_Ankle_data2.*100))./100;                             %  ���㻯

right_Ankle_data3=(round(right_Ankle_data3.*100))./100;                             %  ���㻯                 

right_Ankle_data3(abs(right_Ankle_data3)<0.00001)=0;                                % ��С�ֱ��� 

data=right_Ankle_data3;

count=0;

right_Ankle_Point=[];

i=100;

while(i<=length(data)-100)
    if  ((data(i+30)>=data(i))&&(data(i+30)>=data(i+1))&&(data(i+30)>=data(i+2))&&(data(i+30)>=data(i+3))&&(data(i+30)>=data(i+4))&&...
        (data(i+30)>=data(i+5))&&(data(i+30)>=data(i+6))&&(data(i+30)>=data(i+7))&&(data(i+30)>=data(i+8))&&(data(i+30)>=data(i+9))&&...
        (data(i+30)>=data(i+10))&&(data(i+30)>=data(i+11))&&(data(i+30)>=data(i+12))&&(data(i+30)>=data(i+13))&&(data(i+30)>=data(i+14))&&...
        (data(i+30)>=data(i+15))&&(data(i+30)>=data(i+16))&&(data(i+30)>=data(i+17))&&(data(i+30)>=data(i+18))&&(data(i+30)>=data(i+19))&&...
        (data(i+30)>=data(i+20))&&(data(i+30)>=data(i+21))&&(data(i+30)>=data(i+22))&&(data(i+30)>=data(i+23))&&(data(i+30)>=data(i+24))&&...
        (data(i+30)>=data(i+25))&&(data(i+30)>=data(i+26))&&(data(i+30)>=data(i+27))&&(data(i+30)>=data(i+28))&&(data(i+30)>=data(i+29))&&...
        (data(i+30)>=data(i+31))&&(data(i+30)>=data(i+32))&&(data(i+30)>=data(i+33))&&(data(i+30)>=data(i+34))&&(data(i+30)>=data(i+35))&&...
        (data(i+30)>=data(i+36))&&(data(i+30)>=data(i+37))&&(data(i+30)>=data(i+38))&&(data(i+30)>=data(i+39))&&(data(i+30)>=data(i+40))&&...
        (data(i+30)>=data(i+41))&&(data(i+30)>=data(i+42))&&(data(i+30)>=data(i+43))&&(data(i+30)>=data(i+44))&&(data(i+30)>=data(i+45))&&...
        (data(i+30)>=data(i+46))&&(data(i+30)>=data(i+47))&&(data(i+30)>=data(i+48))&&(data(i+30)>=data(i+49))&&(data(i+30)>=data(i+50))&&...
        (data(i+30)>=data(i+51))&&(data(i+30)>=data(i+52))&&(data(i+30)>=data(i+53))&&(data(i+30)>=data(i+54))&&(data(i+30)>=data(i+55))&&...
        (data(i+30)>=data(i+56))&&(data(i+30)>=data(i+57))&&(data(i+30)>=data(i+58))&&(data(i+30)>=data(i+59))&&(data(i+30)>=data(i+60))&&(beifen_data(i+30)<beifen_data(i+55))&&(right_Ankle_data2(i+37)>=0)&&(right_Ankle_data2(i+30)>=0)&&(right_Ankle_data2(i+35)>=0))  %&&(max(beifen_data(i+30:i+45))-beifen_data(i+30)>6)
    %(right_Ankle_data2(i+30)>=0)&&(right_Ankle_data2(i+31)>=0)&&(right_Ankle_data2(i+32)>=0)&&(right_Ankle_data2(i+33)>=0))
                                                                                                                                            %%   Ѱ�Ҷ���΢�ּ���ֵ�㣬60����Ϊ����������� 
        if(count==0)
            right_Ankle_Point=[right_Ankle_Point,i+30];                                                         %%  ��ʼ���ö���΢�ּ�ֵ��                        
            count=count+1;
        end
%         if((count==1)&&(i+30>right_Ankle_Point(length(right_Ankle_Point))+60))
%                                                                                                                                           %% �������������������ҵ��µĺ��ʵ�  
        if((count==1)&&(i+30>right_Ankle_Point(length(right_Ankle_Point))+60)&&(i+30<right_Ankle_Point(length(right_Ankle_Point))+130))
            right_Ankle_Point=[right_Ankle_Point,i+30];                                                           %% �����¶���΢�ּ�ֵ��
%             count=count+1;
        end
        
                 
%         if((count==1)&&(i+30>right_Ankle_Point(length(right_Ankle_Point))+130)&&(i+30<=right_Ankle_Point(length(right_Ankle_Point))+210))
%            right_Ankle_Point=[right_Ankle_Point,round((i+30+right_Ankle_Point(length(right_Ankle_Point)))/2)];
%            right_Ankle_Point=[right_Ankle_Point,i+30];
%         end
        if((count==1)&&(i+30>right_Ankle_Point(length(right_Ankle_Point))+130))        %% ����һ���������������ҵ��µĺ��ʵ� 
             
            for temp_0301=right_Ankle_Point(length(right_Ankle_Point))+50:right_Ankle_Point(length(right_Ankle_Point))+130    %%©���İ������
               
                temp_sum=0;
                for kkk=-30:30 
                if(data(temp_0301)>=data(temp_0301+kkk))                                                     %%Ѱ�Ұ�����ڼ���ֵ��                             
                     temp_sum=temp_sum+1;
                end
                end
                if((temp_sum>=60)&&(beifen_data(temp_0301)<beifen_data(temp_0301+25))&&(right_Ankle_data2(temp_0301+7)>=0)&&(right_Ankle_data2(temp_0301)>=0)&&(right_Ankle_data2(temp_0301+5)>=0))          
                    right_Ankle_Point=[right_Ankle_Point,temp_0301];                                       %%�����¶���΢�ּ�ֵ��  
                    i=temp_0301;
                    break;
                end
            end
            
            
            if(temp_0301==right_Ankle_Point(length(right_Ankle_Point))+130)                   %%����̫�ϸ�60��������ڼ���ֵ��û���ҵ�         
              
               for temp_0301=right_Ankle_Point(length(right_Ankle_Point))+50:right_Ankle_Point(length(right_Ankle_Point))+130
                  temp_sum=0;
                  for kkk=-30:30 
                  if(data(temp_0301)>=data(temp_0301+kkk))                                                  %%��������59������Ѱ��
                       temp_sum=temp_sum+1;
                  end
                  end
                  if((temp_sum>=59)&&(beifen_data(temp_0301)<beifen_data(temp_0301+25))&&(right_Ankle_data2(temp_0301+7)>=0)&&(right_Ankle_data2(temp_0301)>=0)&&(right_Ankle_data2(temp_0301+5)>=0))          
                       right_Ankle_Point=[right_Ankle_Point,temp_0301];
                       i=temp_0301;
                       break;
                  end
               end
              
            end
            
            if(temp_0301==right_Ankle_Point(length(right_Ankle_Point))+130)               %%����̫�ϸ�59��������ڼ���ֵ��û���ҵ� 
               for temp_0301=right_Ankle_Point(length(right_Ankle_Point))+50:right_Ankle_Point(length(right_Ankle_Point))+130
                  temp_sum=0;
                  for kkk=-30:30 
                  if(data(temp_0301)>=data(temp_0301+kkk))                                              %%��������58������Ѱ��             
                       temp_sum=temp_sum+1;
                  end
                  end
                  if((temp_sum>=58)&&(beifen_data(temp_0301)<beifen_data(temp_0301+25))&&(right_Ankle_data2(temp_0301+7)>=0)&&(right_Ankle_data2(temp_0301)>=0)&&(right_Ankle_data2(temp_0301+5)>=0))          
                       right_Ankle_Point=[right_Ankle_Point,temp_0301];
                       i=temp_0301;          
                       break;
                  end
               end
              
            end
                  
        end    
        
        
        

%         if((count==1)&&(i+30>right_Ankle_Point(length(right_Ankle_Point))+130))
%            right_Ankle_Point=[right_Ankle_Point,round((i+30+right_Ankle_Point(length(right_Ankle_Point)))/2)];
%            right_Ankle_Point=[right_Ankle_Point,i+30];
%         end
%         if(length(right_Ankle_Point)>=3)
%         if((count==1)&&(i+30>right_Ankle_Point(length(right_Ankle_Point))+130)&&(i+30<2*right_Ankle_Point(length(right_Ankle_Point))+130-right_Ankle_Point(length(right_Ankle_Point)-1)))
%            right_Ankle_Point=[right_Ankle_Point,round((i+30+right_Ankle_Point(length(right_Ankle_Point)))/2)];
%            right_Ankle_Point=[right_Ankle_Point,i+30];
%         end
%         if((count==1)&&(i+30>2*right_Ankle_Point(length(right_Ankle_Point))+130-right_Ankle_Point(length(right_Ankle_Point)-1)))
%            temp_0229=(i+30-right_Ankle_Point(length(right_Ankle_Point)))/(right_Ankle_Point(length(right_Ankle_Point))-right_Ankle_Point(length(right_Ankle_Point)-1))
%            temp_0229=round(temp_0229);
%            for teshu=1:temp_0229-1
%                right_Ankle_Point=[right_Ankle_Point, 2*right_Ankle_Point(length(right_Ankle_Point))-right_Ankle_Point(length(right_Ankle_Point)-1)];
%            end
%            right_Ankle_Point=[right_Ankle_Point,i+30];
%         end    
%         end
    end
    if(count==2)
        break;
    end 
    i=i+1;
end

hold on;


% right_Ankle_Point=right_Ankle_Point+1;

plot(right_Ankle_Point,beifen_data(right_Ankle_Point),'ro')                                                           %%���ƶ���΢�ּ���ֵ���Ӧ��ԭʼ����
% axis([0,length(data),500,700])
% plot(right_Ankle_Point(1),data(right_Ankle_Point(1)),'ro',right_Ankle_Point(2),data(right_Ankle_Point(2)),'ro')

data=importdata('C:\Users\sunming\Desktop\PWV\3.txt');
figure;
plot(data);


beifen_data=data;                                                                                                   % ԭʼ����������                                                                                           

left_Brachial_data2=diff(data);                                                                                 % һ�ײ��                                                                         

left_Brachial_data3=diff(left_Brachial_data2);                                                          % ���ײ��                        

left_Brachial_data2=(round(left_Brachial_data2.*100))./100;                                   %  ���㻯         

left_Brachial_data3=(round(left_Brachial_data3.*100))./100;                                  %  ���㻯

left_Brachial_data3(abs(left_Brachial_data3)<0.00001)=0;                                     % ��С�ֱ���

data=left_Brachial_data3;

count=0;

left_Brachial_Point=[];

i=100;

while(i<=length(data)-100)
    if  ((data(i+30)>=data(i))&&(data(i+30)>=data(i+1))&&(data(i+30)>=data(i+2))&&(data(i+30)>=data(i+3))&&(data(i+30)>=data(i+4))&&...
        (data(i+30)>=data(i+5))&&(data(i+30)>=data(i+6))&&(data(i+30)>=data(i+7))&&(data(i+30)>=data(i+8))&&(data(i+30)>=data(i+9))&&...
        (data(i+30)>=data(i+10))&&(data(i+30)>=data(i+11))&&(data(i+30)>=data(i+12))&&(data(i+30)>=data(i+13))&&(data(i+30)>=data(i+14))&&...
        (data(i+30)>=data(i+15))&&(data(i+30)>=data(i+16))&&(data(i+30)>=data(i+17))&&(data(i+30)>=data(i+18))&&(data(i+30)>=data(i+19))&&...
        (data(i+30)>=data(i+20))&&(data(i+30)>=data(i+21))&&(data(i+30)>=data(i+22))&&(data(i+30)>=data(i+23))&&(data(i+30)>=data(i+24))&&...
        (data(i+30)>=data(i+25))&&(data(i+30)>=data(i+26))&&(data(i+30)>=data(i+27))&&(data(i+30)>=data(i+28))&&(data(i+30)>=data(i+29))&&...
        (data(i+30)>=data(i+31))&&(data(i+30)>=data(i+32))&&(data(i+30)>=data(i+33))&&(data(i+30)>=data(i+34))&&(data(i+30)>=data(i+35))&&...
        (data(i+30)>=data(i+36))&&(data(i+30)>=data(i+37))&&(data(i+30)>=data(i+38))&&(data(i+30)>=data(i+39))&&(data(i+30)>=data(i+40))&&...
        (data(i+30)>=data(i+41))&&(data(i+30)>=data(i+42))&&(data(i+30)>=data(i+43))&&(data(i+30)>=data(i+44))&&(data(i+30)>=data(i+45))&&...
        (data(i+30)>=data(i+46))&&(data(i+30)>=data(i+47))&&(data(i+30)>=data(i+48))&&(data(i+30)>=data(i+49))&&(data(i+30)>=data(i+50))&&...
        (data(i+30)>=data(i+51))&&(data(i+30)>=data(i+52))&&(data(i+30)>=data(i+53))&&(data(i+30)>=data(i+54))&&(data(i+30)>=data(i+55))&&...
        (data(i+30)>=data(i+56))&&(data(i+30)>=data(i+57))&&(data(i+30)>=data(i+58))&&(data(i+30)>=data(i+59))&&(data(i+30)>=data(i+60))&&(beifen_data(i+30)<beifen_data(i+55))&&(left_Brachial_data2(i+37)>=0)&&(left_Brachial_data2(i+30)>=0)&&(left_Brachial_data2(i+35)>=0))  %&&(max(beifen_data(i+30:i+45))-beifen_data(i+30)>6)
       %(left_Brachial_data2(i+30)>=0)&&(left_Brachial_data2(i+31)>=0)&&(left_Brachial_data2(i+32)>=0)&&(left_Brachial_data2(i+33)>=0))
                                                                                                                          %%   Ѱ�Ҷ���΢�ּ���ֵ�㣬60����Ϊ����������� 
        if(count==0)
            left_Brachial_Point=[left_Brachial_Point,i+30];                                      %%  ��ʼ���ö���΢�ּ�ֵ�� 
            count=count+1;
        end
%         if((count==1)&&(i+30>left_Brachial_Point(length(left_Brachial_Point))+60))
%                                                                                                                         %% �������������������ҵ��µĺ��ʵ� 
        if((count==1)&&(i+30>left_Brachial_Point(length(left_Brachial_Point))+60)&&(i+30<left_Brachial_Point(length(left_Brachial_Point))+130))
            left_Brachial_Point=[left_Brachial_Point,i+30];                                       %% �����¶���΢�ּ�ֵ��
%             count=count+1;
        end
        
        
%         if((count==1)&&(i+30>left_Brachial_Point(length(left_Brachial_Point))+130)&&(i+30<=left_Brachial_Point(length(left_Brachial_Point))+210))
%         left_Brachial_Point=[left_Brachial_Point,round((i+30+left_Brachial_Point(length(left_Brachial_Point)))/2)];
%         left_Brachial_Point=[left_Brachial_Point,i+30];
%         end
        if((count==1)&&(i+30>left_Brachial_Point(length(left_Brachial_Point))+130))            %% ����һ���������������ҵ��µĺ��ʵ� 
            for temp_0301=left_Brachial_Point(length(left_Brachial_Point))+50:left_Brachial_Point(length(left_Brachial_Point))+130     %%©���İ������
                temp_sum=0;
                for kkk=-30:30 
                if(data(temp_0301)>=data(temp_0301+kkk))                                                      %%Ѱ�Ұ�����ڼ���ֵ��            
                      temp_sum=temp_sum+1;
                end
                end
                if((temp_sum>=60)&&(beifen_data(temp_0301)<beifen_data(temp_0301+25))&&(left_Brachial_data2(temp_0301+7)>=0)&&(left_Brachial_data2(temp_0301+5)>=0)&&(left_Brachial_data2(temp_0301)>=0))          
                    left_Brachial_Point=[left_Brachial_Point,temp_0301];                                     %%�����¶���΢�ּ�ֵ��   
                    i=temp_0301;
                    break;
                end
            end

          if(temp_0301==left_Brachial_Point(length(left_Brachial_Point))+130)                    %%����̫�ϸ�60��������ڼ���ֵ��û���ҵ� 
              for temp_0301=left_Brachial_Point(length(left_Brachial_Point))+50:left_Brachial_Point(length(left_Brachial_Point))+130
                  temp_sum=0;
                  for kkk=-30:30 
                  if(data(temp_0301)>=data(temp_0301+kkk))                                                   %%��������59������Ѱ�� 
                      temp_sum=temp_sum+1;
                  end
                  end
                  if((temp_sum>=59)&&(beifen_data(temp_0301)<beifen_data(temp_0301+25))&&(left_Brachial_data2(temp_0301+7)>=0)&&(left_Brachial_data2(temp_0301+5)>=0)&&(left_Brachial_data2(temp_0301)>=0))          
                    left_Brachial_Point=[left_Brachial_Point,temp_0301];
                    i=temp_0301;
                    break;
                  end
              end
          end
          
         if(temp_0301==left_Brachial_Point(length(left_Brachial_Point))+130)                    %%����̫�ϸ�59��������ڼ���ֵ��û���ҵ� 
              for temp_0301=left_Brachial_Point(length(left_Brachial_Point))+50:left_Brachial_Point(length(left_Brachial_Point))+130
                  temp_sum=0;
                  for kkk=-30:30 
                  if(data(temp_0301)>=data(temp_0301+kkk))                                                 %%��������58������Ѱ��
                      temp_sum=temp_sum+1;
                  end
                  end
                  if((temp_sum>=58)&&(beifen_data(temp_0301)<beifen_data(temp_0301+25))&&(left_Brachial_data2(temp_0301+7)>=0)&&(left_Brachial_data2(temp_0301+5)>=0)&&(left_Brachial_data2(temp_0301)>=0))          
                    left_Brachial_Point=[left_Brachial_Point,temp_0301];
                    i=temp_0301;
                    break;
                  end
              end
          end
          
          
        end  

        
        
%         if((count==1)&&(i+30>left_Brachial_Point(length(left_Brachial_Point))+130))
%            left_Brachial_Point=[left_Brachial_Point,round((i+30+left_Brachial_Point(length(left_Brachial_Point)))/2)];
%            left_Brachial_Point=[left_Brachial_Point,i+30];
%         end
%         if(length(left_Brachial_Point)>=3)
%         if((count==1)&&(i+30>left_Brachial_Point(length(left_Brachial_Point))+130)&&(i+30<2*left_Brachial_Point(length(left_Brachial_Point))+130-left_Brachial_Point(length(left_Brachial_Point)-1)))
%            left_Brachial_Point=[left_Brachial_Point,round((i+30+left_Brachial_Point(length(left_Brachial_Point)))/2)];
%            left_Brachial_Point=[left_Brachial_Point,i+30];
%         end
%         if((count==1)&&(i+30>2*left_Brachial_Point(length(left_Brachial_Point))+130-left_Brachial_Point(length(left_Brachial_Point)-1)))
%            temp_0229=(i+30-left_Brachial_Point(length(left_Brachial_Point)))/(left_Brachial_Point(length(left_Brachial_Point))-left_Brachial_Point(length(left_Brachial_Point)-1))
%            temp_0229=round(temp_0229);
%            for teshu=1:temp_0229-1
%                left_Brachial_Point=[left_Brachial_Point, 2*left_Brachial_Point(length(left_Brachial_Point))-left_Brachial_Point(length(left_Brachial_Point)-1)];
%            end
%            left_Brachial_Point=[left_Brachial_Point,i+30];
%         end    
%         end
    end
    if(count==2)
        break;
    end  
    i=i+1;
end

hold on;


% left_Brachial_Point=left_Brachial_Point+1;

plot(left_Brachial_Point,beifen_data(left_Brachial_Point),'ro') ;                                      %%���ƶ���΢�ּ���ֵ���Ӧ��ԭʼ����
% axis([0,length(data),500,700])
% plot(right_Ankle_Point(1),data(right_Ankle_Point(1)),'ro',right_Ankle_Point(2),data(right_Ankle_Point(2)),'ro')





data=importdata('C:\Users\sunming\Desktop\PWV\4.txt');

figure;

plot(data);

beifen_data=data;                                                                                           % ԭʼ����������                                                 

right_Brachial_data2=diff(data);                                                                     % һ�ײ��  
 
right_Brachial_data3=diff(right_Brachial_data2);                                           % ���ײ��  

right_Brachial_data2=(round(right_Brachial_data2.*100))./100;                   %  ���㻯

right_Brachial_data3=(round(right_Brachial_data3.*100))./100;                  %  ���㻯 

right_Brachial_data3(abs(right_Brachial_data3)<0.00001)=0;                      % ��С�ֱ���

data=right_Brachial_data3;

count=0;

right_Brachial_Point=[];

i=100;

while(i<=length(data)-100)
    if  ((data(i+30)>=data(i))&&(data(i+30)>=data(i+1))&&(data(i+30)>=data(i+2))&&(data(i+30)>=data(i+3))&&(data(i+30)>=data(i+4))&&...
        (data(i+30)>=data(i+5))&&(data(i+30)>=data(i+6))&&(data(i+30)>=data(i+7))&&(data(i+30)>=data(i+8))&&(data(i+30)>=data(i+9))&&...
        (data(i+30)>=data(i+10))&&(data(i+30)>=data(i+11))&&(data(i+30)>=data(i+12))&&(data(i+30)>=data(i+13))&&(data(i+30)>=data(i+14))&&...
        (data(i+30)>=data(i+15))&&(data(i+30)>=data(i+16))&&(data(i+30)>=data(i+17))&&(data(i+30)>=data(i+18))&&(data(i+30)>=data(i+19))&&...
        (data(i+30)>=data(i+20))&&(data(i+30)>=data(i+21))&&(data(i+30)>=data(i+22))&&(data(i+30)>=data(i+23))&&(data(i+30)>=data(i+24))&&...
        (data(i+30)>=data(i+25))&&(data(i+30)>=data(i+26))&&(data(i+30)>=data(i+27))&&(data(i+30)>=data(i+28))&&(data(i+30)>=data(i+29))&&...
        (data(i+30)>=data(i+31))&&(data(i+30)>=data(i+32))&&(data(i+30)>=data(i+33))&&(data(i+30)>=data(i+34))&&(data(i+30)>=data(i+35))&&...
        (data(i+30)>=data(i+36))&&(data(i+30)>=data(i+37))&&(data(i+30)>=data(i+38))&&(data(i+30)>=data(i+39))&&(data(i+30)>=data(i+40))&&...
        (data(i+30)>=data(i+41))&&(data(i+30)>=data(i+42))&&(data(i+30)>=data(i+43))&&(data(i+30)>=data(i+44))&&(data(i+30)>=data(i+45))&&...
        (data(i+30)>=data(i+46))&&(data(i+30)>=data(i+47))&&(data(i+30)>=data(i+48))&&(data(i+30)>=data(i+49))&&(data(i+30)>=data(i+50))&&...
        (data(i+30)>=data(i+51))&&(data(i+30)>=data(i+52))&&(data(i+30)>=data(i+53))&&(data(i+30)>=data(i+54))&&(data(i+30)>=data(i+55))&&...
        (data(i+30)>=data(i+56))&&(data(i+30)>=data(i+57))&&(data(i+30)>=data(i+58))&&(data(i+30)>=data(i+59))&&(data(i+30)>=data(i+60))&&(beifen_data(i+30)<beifen_data(i+55))&&(right_Brachial_data2(i+37)>=0)&&(right_Brachial_data2(i+30)>=0)&&(right_Brachial_data2(i+35)>=0))  %&&(max(beifen_data(i+30:i+45))-beifen_data(i+30)>6)
%        (right_Brachial_data2(i+30)>=0)&&(right_Brachial_data2(i+31)>=0)&&(right_Brachial_data2(i+32)>=0)&&(right_Brachial_data2(i+33)>=0))
                                                                                                                                        %%   Ѱ�Ҷ���΢�ּ���ֵ�㣬60����Ϊ����������� 
        if(count==0)                                                                           %��������������⣬��취���
            right_Brachial_Point=[right_Brachial_Point,i+30];                                               %%  ��ʼ���ö���΢�ּ�ֵ��
            count=count+1;
        end
                                                                                                                                          %% �������������������ҵ��µĺ��ʵ� 
        if((count==1)&&(i+30>right_Brachial_Point(length(right_Brachial_Point))+60)&&(i+30<right_Brachial_Point(length(right_Brachial_Point))+130))
            right_Brachial_Point=[right_Brachial_Point,i+30];                                                %% �����¶���΢�ּ�ֵ��
%             count=count+1;
        end
        
        
        
        
%         if((count==1)&&(i+30>right_Brachial_Point(length(right_Brachial_Point))+130)&&(i+30<=right_Brachial_Point(length(right_Brachial_Point))+210))
%            right_Brachial_Point=[right_Brachial_Point,round((i+30+right_Brachial_Point(length(right_Brachial_Point)))/2)];
%            right_Brachial_Point=[right_Brachial_Point,i+30];
%         end
        if((count==1)&&(i+30>right_Brachial_Point(length(right_Brachial_Point))+130))          %% ����һ���������������ҵ��µĺ��ʵ�        
            
            for temp_0301=right_Brachial_Point(length(right_Brachial_Point))+50:right_Brachial_Point(length(right_Brachial_Point))+130      %%©���İ������ 
                
                temp_sum=0;
                
                for kkk=-30:30 
                if(data(temp_0301)>=data(temp_0301+kkk))                                                          %%Ѱ�Ұ�����ڼ���ֵ��                                             
                     temp_sum=temp_sum+1;
                end
                end                                                                                                                             
                if((temp_sum>=60)&&(beifen_data(temp_0301)<beifen_data(temp_0301+25))&&(right_Brachial_data2(temp_0301+7)>=0)&&(right_Brachial_data2(temp_0301)>=0)&&(right_Brachial_data2(temp_0301+5)>=0))          
                    right_Brachial_Point=[right_Brachial_Point,temp_0301];                                    %%�����¶���΢�ּ�ֵ��
                    i=temp_0301; 
                    break;
                end
            end
            
         if(temp_0301==right_Brachial_Point(length(right_Brachial_Point))+130)                      %%����̫�ϸ�60��������ڼ���ֵ��û���ҵ�          
             for temp_0301=right_Brachial_Point(length(right_Brachial_Point))+50:right_Brachial_Point(length(right_Brachial_Point))+130
                temp_sum=0;
                for kkk=-30:30 
                if(data(temp_0301)>=data(temp_0301+kkk))                                                            %%��������59������Ѱ��   
                     temp_sum=temp_sum+1;
                end
                end
                if((temp_sum>=59)&&(beifen_data(temp_0301)<beifen_data(temp_0301+25))&&(right_Brachial_data2(temp_0301+7)>=0)&&(right_Brachial_data2(temp_0301)>=0)&&(right_Brachial_data2(temp_0301+5)>=0))          
                    right_Brachial_Point=[right_Brachial_Point,temp_0301];
                    i=temp_0301;
                    break;
                end
             end           
         end
          
         if(temp_0301==right_Brachial_Point(length(right_Brachial_Point))+130)                        %%����̫�ϸ�59��������ڼ���ֵ��û���ҵ�
             for temp_0301=right_Brachial_Point(length(right_Brachial_Point))+50:right_Brachial_Point(length(right_Brachial_Point))+130
                temp_sum=0;
                for kkk=-30:30 
                if(data(temp_0301)>=data(temp_0301+kkk))                                                            %%��������58������Ѱ��
                     temp_sum=temp_sum+1;
                end
                end
                if((temp_sum>=58)&&(beifen_data(temp_0301)<beifen_data(temp_0301+25))&&(right_Brachial_data2(temp_0301+7)>=0)&&(right_Brachial_data2(temp_0301)>=0)&&(right_Brachial_data2(temp_0301+5)>=0))          
                    right_Brachial_Point=[right_Brachial_Point,temp_0301];
                    i=temp_0301;
                    break;
                end
             end           
          end
                
        end  
        
        
        
%         if((count==1)&&(i+30>right_Brachial_Point(length(right_Brachial_Point))+130))
%            right_Brachial_Point=[right_Brachial_Point,round((i+30+right_Brachial_Point(length(right_Brachial_Point)))/2)];
%            right_Brachial_Point=[right_Brachial_Point,i+30];
%         end
%         if(length(right_Brachial_Point)>=3)
%         if((count==1)&&(i+30>right_Brachial_Point(length(right_Brachial_Point))+130)&&(i+30<2*right_Brachial_Point(length(right_Brachial_Point))+130-right_Brachial_Point(length(right_Brachial_Point)-1)))
%            right_Brachial_Point=[right_Brachial_Point,round((i+30+right_Brachial_Point(length(right_Brachial_Point)))/2)];
%            right_Brachial_Point=[right_Brachial_Point,i+30];
%         end
%         if((count==1)&&(i+30>2*right_Brachial_Point(length(right_Brachial_Point))+130-right_Brachial_Point(length(right_Brachial_Point)-1)))
%            temp_0229=(i+30-right_Brachial_Point(length(right_Brachial_Point)))/(right_Brachial_Point(length(right_Brachial_Point))-right_Brachial_Point(length(right_Brachial_Point)-1))
%            temp_0229=round(temp_0229);
%            for teshu=1:temp_0229-1
%                right_Brachial_Point=[right_Brachial_Point,2*right_Brachial_Point(length(right_Brachial_Point))-right_Brachial_Point(length(right_Brachial_Point)-1)];
%            end
%            right_Brachial_Point=[right_Brachial_Point,i+30];
%         end    
%         end
        
    end
    if(count==2)
        break;
    end  
    i=i+1;
end


hold on ;    

% right_Brachial_Point=right_Brachial_Point+1;

plot(right_Brachial_Point,beifen_data(right_Brachial_Point),'ro')                             %%���ƶ���΢�ּ���ֵ���Ӧ��ԭʼ����         
% axis([0,3000,500,600]) 
% axis([0,length(data),500,700])
% plot(right_Ankle_Point(1),data(right_Ankle_Point(1)),'ro',right_Ankle_Point(2),data(right_Ankle_Point(2)),'ro')


if((length(left_Ankle_Point)<=3)||(length(right_Ankle_Point)<=3)||(length(left_Brachial_Point)<=3)||(length(right_Brachial_Point)<=3))  
                                                                                                                                    %%����̫��
    parameter=zeros(16,1);
    parameter(2,1)=0;                                     
    parameter(3,1)=0;                                                                    
    parameter(5,1)=0;                                                                    
    parameter(6,1)=0;   
    parameter(7,1)=0;                                                                    
    parameter(8,1)=0;   
    parameter(9,1)=0;                                                                    
    parameter(10,1)=0;   
    parameter(11,1)=0;                                                                    
    parameter(12,1)=0;    
    parameter(13,1)=0;                                                                    
    parameter(14,1)=0;   
    parameter(15,1)=0;                                                                    
    parameter(16,1)=0;  
    jieguo0=sprintf('%d\n',parameter(1:16)) ;
    break;
end

     
       
PeakNum=[length(left_Ankle_Point),length(right_Ankle_Point),length(left_Brachial_Point),length(right_Brachial_Point)];       %����������

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                       %%%%%%%����PPTT%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if((left_Brachial_Point(1)<left_Ankle_Point(1))&&(left_Brachial_Point(2)>left_Ankle_Point(1)))                 % ��һ���������ڣ����ҳ�ʼ�ɶ����ȳ�ʼ�㶯���絽
    left_PTTba= left_Ankle_Point(1)-left_Brachial_Point(1);                                                                           % ���������������ӳ�     PPTT
else
    if(left_Brachial_Point(1)>left_Ankle_Point(1))                                                                                           %��ʼ�ɶ����ȳ�ʼ�㶯����
       for i=1:length(left_Ankle_Point)-1
            if(left_Ankle_Point(i)<left_Brachial_Point(1)&&left_Ankle_Point(i+1)>left_Brachial_Point(1))        % Ѱ�����ʼ�ɶ�����Ӧ���㶯�� 
                 left_PTTba= left_Ankle_Point(i+1)-left_Brachial_Point(1);                                                           % ���������������ӳ�     PPTT            
                 PeakNum(1)=PeakNum(1)-i;                                                                                                       % ��������
                 left_Ankle_Point(1:i)=[];                                                                                                                %  ǰ����������������
                 break;
            end
        end
        
    end
    
    

    if((left_Brachial_Point(2)<left_Ankle_Point(1))&&(left_Brachial_Point(3)>left_Ankle_Point(1)))            % �ɶ����ȳ�ʼ�㶯���絽һ������     
        left_PTTba= left_Ankle_Point(1)-left_Brachial_Point(2);                                                                      % ���������������ӳ�     PPTT ��Ѱ�����ʼ�㶯����Ӧ�Ĺɶ���                                                        
        PeakNum(3)=PeakNum(3)-1;                                                                                                              %  �������� 
        left_Brachial_Point(1)=[];                                                                                                                      %  ǰ����������������
    else
        for i=2:length(left_Brachial_Point)-1                                                                                                    %  �ɶ����ȳ�ʼ�㶯���絽N������
            if(left_Brachial_Point(i)<left_Ankle_Point(1)&&left_Brachial_Point(i+1)>left_Ankle_Point(1))       %  Ѱ�����ʼ�㶯����Ӧ�Ĺɶ���
                 left_PTTba= left_Ankle_Point(1)-left_Brachial_Point(i);                                                               %  ���������������ӳ�     PPTT
                 PeakNum(3)=PeakNum(3)-i+1;                                                                                                   % ��������
                 left_Brachial_Point(1:i-1)=[];                                                                                                         %  ǰ����������������
                 break;
            end
        end
    end
   
     
end



if((right_Brachial_Point(1)<right_Ankle_Point(1))&&(right_Brachial_Point(2)>right_Ankle_Point(1)))             %  ��һ���������ڣ����ҳ�ʼ�ɶ����ȳ�ʼ�㶯���絽        
    right_PTTba= right_Ankle_Point(1)-right_Brachial_Point(1);                                                                         %  ���������������ӳ�     PPTT  
else
    if(right_Brachial_Point(1)>right_Ankle_Point(1))                                                                                            % ��ʼ�ɶ����ȳ�ʼ�㶯����                                                                      
        for i=1:length(right_Ankle_Point)-1
            if(right_Ankle_Point(i)<right_Brachial_Point(1)&&right_Ankle_Point(i+1)>right_Brachial_Point(1))    % Ѱ�����ʼ�ɶ�����Ӧ���㶯�� 
                 right_PTTba= right_Ankle_Point(i+1)-right_Brachial_Point(1);                                                          % ���������������ӳ�     PPTT               
                 PeakNum(2)=PeakNum(2)-i;                                                                                                              % �������� 
                 right_Ankle_Point(1:i)=[];                                                                                                                    %  ǰ���������������� 
                 break;
            end
        end
    end
    if((right_Brachial_Point(2)<right_Ankle_Point(1))&&(right_Brachial_Point(3)>right_Ankle_Point(1)))          % �ɶ����ȳ�ʼ�㶯���絽һ������  
        right_PTTba= right_Ankle_Point(1)-right_Brachial_Point(2);                                                                       % ���������������ӳ�     PPTT ��Ѱ�����ʼ�㶯����Ӧ�Ĺɶ���     
        PeakNum(4)=PeakNum(4)-1;                                                                                                                      %  ��������
        right_Brachial_Point(1)=[];                                                                                                                            %  ǰ����������������
    else
        for i=2:length(right_Brachial_Point)-1
            if(right_Brachial_Point(i)<right_Ankle_Point(1)&&right_Brachial_Point(i+1)>right_Ankle_Point(1))     %  �ɶ����ȳ�ʼ�㶯���絽N������   
                 right_PTTba= right_Ankle_Point(1)-right_Brachial_Point(i);                                                               %  Ѱ�����ʼ�㶯����Ӧ�Ĺɶ���    
                 PeakNum(4)=PeakNum(4)-i+1;                                                                                                          % ��������
                 right_Brachial_Point(1:i-1)=[];                                                                                                             %  ǰ����������������
                 break;
            end
        end
    end
end

 right_Ankle_Point(1);

left_sum      = 0;

left_count   = 0;

left_minus   = [];

% if(PeakNum(1)<=PeakNum(3))
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                             %%%%%%%%%����һ�ּ���PPTT�ķ�ʽ%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                                                     %%���              %%����һ�ּ���PPTT�ķ�ʽ
     for i=1:min([PeakNum(1),PeakNum(3)])-1
         
         for j=i:min([PeakNum(1),PeakNum(3)])-1
             
         if(left_Ankle_Point(i)>left_Brachial_Point(j)&&left_Ankle_Point(i)<left_Brachial_Point(j+1))
             
           left_sum      =    left_Ankle_Point(i)-left_Brachial_Point(j)+left_sum;                             %%���ӳ�
           
           left_minus   =   [left_minus,left_Ankle_Point(i)-left_Brachial_Point(j)];                          %%�ӳ�����
           
           left_count    =   left_count+1;                                                                                        %%�ӳٸ���
         end
         
         end
         
     end
     

     
left_mean    =    mean(left_minus);                                                                      %%�ӳ����о�ֵ             

left_paixu    =     sort(left_minus);                                                                         %%�ӳ���������                                                    

left_length  =      length(left_paixu);

if(left_count>8)                                                                                                     %%�ӳ����и�������8��    ������
    
left_sum     =      0;

left_start     =     round(left_length*1/4);  %1/4 ��3/4                                         %%��ȡ�м䲿�ֿ�ʼ  

left_stop     =     round(left_length*3/4);                                                              %%��ȡ�м䲿�ֽ���

for i=left_start:left_stop
     left_sum =  left_sum+left_paixu(i)  ;                                                               %%��ȡ�м䲿��
end
     left_count=left_stop-left_start+1;

 end;    
     
     
  left_PTTba=left_sum/left_count;                                                             %% ����һ�ּ���PPTT�ķ�ʽ��������ֵ��        
     
%      left_PTTba=left_paixu(round(left_length/2));
% % else
%     for i=1:PeakNum(3)
%          sum=left_Ankle_Point(i)-left_Brachial_Point(i)+sum;  
%      end
%      left_PTTba=sum/PeakNum(3);
% end

right_sum   =0;

right_count =0;


right_minus =[];

% if(PeakNum(2)<=PeakNum(4))    
                                                                                                                         %%�Ҳ�              %%����һ�ּ���PPTT�ķ�ʽ
for i=1:min([PeakNum(2),PeakNum(4)])-1                                                                        
         for j=i:1:min([PeakNum(2),PeakNum(4)])-1
         if(right_Ankle_Point(i)>right_Brachial_Point(j)&&right_Ankle_Point(i)<right_Brachial_Point(j+1))
           right_sum     =    right_Ankle_Point(i)-right_Brachial_Point(j)+right_sum;                       %%���ӳ�
           right_minus  =    [right_minus,right_Ankle_Point(i)-right_Brachial_Point(j)];                   %%�ӳ�����  
           right_count  =    right_count+1;                                                                                       %%�ӳٸ���  
         end
         end
end

right_mean=mean(right_minus)  ;                                                                                             %%�ӳ����о�ֵ

right_paixu=sort(right_minus);                                                                                                  %%�ӳ���������  

right_length=length(right_paixu);                                                                                             

if(right_count>8)                                                                                                                       %%�ӳ����и�������8��    ������
right_sum=0;

right_start=round(right_length*1/4);  %1/4 ��3/4                                                                  %%��ȡ�м䲿�ֿ�ʼ  

right_stop=round(right_length*3/4);                                                                                       %%��ȡ�м䲿�ֽ���


for i=right_start:right_stop
    
     right_sum=right_sum+right_paixu(i);                                                                                  %%��ȡ�м䲿�֣����ڼ���PPTT��                                 
     
end;    

right_count=right_stop-right_start+1;

     
end
 
% for i=1:min([PeakNum(2),PeakNum(4)])
%          if(right_Ankle_Point(i)<right_Brachial_Point(i))
%              continue;
%          end
%          right_sum=right_Ankle_Point(i)-right_Brachial_Point(i)+right_sum;  
%          right_count=right_count+1;
%      end

right_PTTba=right_sum/right_count;                                                                                    %%����һ�ּ���PPTT�ķ�ʽ��������ֵ��

     
%        right_PTTba=right_paixu(round(right_length/2));
% else
%     for i=1:PeakNum(4)
%          sum=right_Ankle_Point(i)-right_Brachial_Point(i)+sum;  
%      end
%      right_PTTba=sum/PeakNum(4);
% end

figure ;                                                                                                                                %%%����������  
plot(left_Ankle_Point+1,'r') ;

hold on;

plot(left_Brachial_Point+1,'b');

legend('left Ankle_Point','left Brachial_Point');

figure;

plot(right_Ankle_Point+1,'r');

hold on;

plot(right_Brachial_Point+1,'b');

legend('right_Ankle_Point','right Brachial_Point'); 

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                        %%%����PPTV%%%%%%%%%%%%%%%
                                        %%%�÷���ֵ����ȶ������%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


height=high;                                                                                                         %%�������
                                                              
La     =  0.2195*height-2.07340;                                                                          %% ����A����                  

Lb=0.5643*height-18.381+0.2486*height+30.709;                                            %% ����B����

Distance=Lb-La;                                                                                                    %% ����

left_PWV=(Lb-La)*100/left_PTTba;                                                                        %%����PPTV

right_PWV=(Lb-La)*100/right_PTTba;                                                                    %%����PPTV




Ankle_left_bloodPress;

Ankle_right_bloodPress;

Brachial_left_bloodPress;

Brachial_right_bloodPress;

left_PWV;

right_PWV;

Ankle_left_dingdian;

Ankle_right_dingdian;

Brachial_left_dingdian;

Brachial_right_dingdian;

format bank;

parameter=zeros(16,1);

parameter(1,1)=round(Ankle_left_bloodPress/10);                                         %%ƽ��ѹ  

parameter(2,1)=round(Ankle_right_bloodPress/10);                                       %%ƽ��ѹ       

parameter(3,1)=round(Brachial_left_bloodPress/10);                                      %%ƽ��ѹ     

parameter(4,1)=round(Brachial_right_bloodPress/10);                                    %%ƽ��ѹ  

parameter(5,1)=round(Ankle_left_Diastolic/10);                                              %%����ѹ

parameter(6,1)=round(Ankle_right_Diastolic/10);                                            %%����ѹ

parameter(7,1)=round(Brachial_left_Diastolic/10);                                           %%����ѹ                         

parameter(8,1)=round(Brachial_right_Diastolic/10);                                         %%����ѹ

parameter(9,1)=round(Ankle_left_dingdian/10);                                               %%���㣿������   

parameter(10,1)=round(Ankle_right_dingdian/10);   

parameter(11,1)=round(Brachial_left_dingdian/10);     

parameter(12,1)=round(Brachial_right_dingdian/10);  


if((parameter(9,1)<70)&&(parameter(9,1)>30))                                           %%   ��������%%%
    
    parameter(1,1)=parameter(9,1)+30;                                                          %% ƽ��ѹ
    
    parameter(5,1)=parameter(9,1)-10;                                                           %%����ѹ
    
end

if((parameter(10,1)<70)&&(parameter(10,1)>30))                                     %%   ��������%%%
    
    parameter(2,1)=parameter(10,1)+30;                                                      %% ƽ��ѹ
    
    parameter(6,1)=parameter(10,1)-10;                                                       %% ����ѹ
    
end

if((parameter(11,1)<70)&&(parameter(11,1)>30))                                     %%   ��������%%% 
    
    parameter(3,1)=parameter(11,1)+30;                                                      %% ƽ��ѹ
    
    parameter(7,1)=parameter(11,1)-10;                                                        %% ����ѹ
    

end

if((parameter(12,1)<70)&&(parameter(12,1)>30))                                    %%   ��������%%%
     
   parameter(4,1)   =parameter(12,1)+30;                                                  %%  ƽ��ѹ                   
   
    parameter(8,1)  =  parameter(12,1)-10;                                                  %% ����ѹ
end



if(parameter(1,1)<parameter(9,1))                                                               %%����
    
    parameter(1,1)  =  2*parameter(9,1)-parameter(1,1);                             %%ƽ��ѹ����
end


if(parameter(2,1)<parameter(10,1))                                                            %%����
    
   parameter(2,1)=2*parameter(10,1)-parameter(2,1);                                %%ƽ��ѹ���� 
   
end


if(parameter(3,1)<parameter(11,1))                                                         %%����                
    
    parameter(3,1) =  2*parameter(11,1)-parameter(3,1);                         %%ƽ��ѹ����
    
end

if(parameter(4,1)<parameter(12,1))                                                          %%����
    
    
    parameter(4,1)  =  2*parameter(12,1)-parameter(4,1);                       %%ƽ��ѹ����    
    
end


if(parameter(5,1)>parameter(9,1))                                                           %%����
    
    parameter(5,1)=  2*parameter(9,1)-parameter(5,1);                           %%����ѹ����
    
end


if(parameter(6,1)>parameter(10,1))                                                         %%����
    
    parameter(6,1) = 2*parameter(10,1)-parameter(6,1);                          %%����ѹ����
    
end


if(parameter(7,1)>parameter(11,1))                                                        %%����                                           
    
    parameter(7,1) = 2*parameter(11,1)-parameter(7,1);                        %%����ѹ����
    
end



if(parameter(8,1)>parameter(12,1))                                                        %%����   
    
    parameter(8,1)=  2*parameter(12,1)-parameter(8,1);                         %%����ѹ����
    
end


   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                         %%%%����ABI%%%%%%%%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



if(parameter(3,1)>parameter(4,1))                                                                   %%���ɶ���ƽ��ѹ�����Ҳ�ɶ���ƽ��ѹ
    
left_ABI     =    floor((parameter(1,1)/parameter(3,1)+0.005)*100)/100;

right_ABI   =   floor((parameter(2,1)/parameter(3,1)+0.005)*100)/100;

else                                                                                                                 %%���ɶ���ƽ��ѹС���Ҳ�ɶ���ƽ��ѹ            
    
left_ABI   =    floor((parameter(1,1)/parameter(4,1)+0.005)*100)/100;

right_ABI =    floor((parameter(2,1)/parameter(4,1)+0.005)*100)/100;
    
end



parameter(13,1)   =   left_ABI;    

parameter(14,1)   =   right_ABI;   

parameter(15,1)   =   round(left_PWV);     

parameter(16,1)   =    round(right_PWV);  

jieguo                  = sprintf('%d\n',parameter(1:4));

jieguo0               =  sprintf('%d\n',parameter(9:12));

jieguo1               =  sprintf('%d\n',parameter(5:8));

jieguo2               =  sprintf('%.2f\n',parameter(13:14));

jieguo3              =   sprintf('%d\n',parameter(15:16));

jieguo                =  [jieguo,jieguo0,jieguo1,jieguo2,jieguo3];

% sprintf('%7.2f\n',parameter) 
xlswrite('�������',parameter);     

% baPWV=(Lb-La)/PTTba

left_paixu';


right_paixu';


Distance;

%��������������60-100������������ͯ�����ܻ�������ʴ���100����������������������60���㣬����60δ���Ƿǳ����ʵ����֣�Ӧ�ñ�60ҪСһЩ������50����55����������
%�����С��������⣬Ҳ����Ҫ�������Ƶ�
%sunming-17��suning-18 �˲�������ݾͲ��Ǻܺã�������Ȼ��Ҫ����
