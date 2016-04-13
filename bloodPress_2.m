function  [Forecast_Systolic_pressure,Forecast_Diastolic_pressure,dingdian]=bloodPress_2(filename2)
% clear all
% clc
% format long g

% Forecast_Systolic_pressure         ����ѹ
% Forecast_Diastolic_pressure       ����ѹ
% dingdian                                     ƽ��ѹ        

 
filename           = filename2 ;

% filename= 'C:\Users\sunming\Desktop\��׿\1.txt'

A                       =   textread(filename,'%d');

len                    =   length(A);

[max_y,max_x]  =  max(A);

figure;

plot(A) ;

hold on��

plot(max_x,max_y,'ro')

hold on ;

start=max_x;

guaidianNum=1;

guaidian=[max_x];

for start=max_x:len-5                                    % �����������ں͸���
    if((A(start+1)-A(start)>=1)&&(A(start+2)-A(start)>=1)&&(A(start+3)-A(start)>=2)&&(A(start+4)-A(start)>=2)&&(A(start+5)-A(start)>=3))   
                                                                       % ������
        if((start-guaidian(guaidianNum)>65))  %&&(start>200) %60�Ժ���Գ���һ��       %% ���ڹ�ϵ  
            
          guaidianNum=guaidianNum+1;     
          
          guaidian=[guaidian,start];                  % �ҹյ�
          
          plot(guaidian(guaidianNum),A(guaidian(guaidianNum)),'ro');
          
          hold on ;
          
        end
       
    end
end 



if(guaidianNum==1)
    
   Forecast_Systolic_pressure    =  0;
   
   Forecast_Diastolic_pressure  =  0;
   
   dingdian                                =  0;
   
   return
   
end
    


guaidian          =  guaidian(2:guaidianNum) ;                                    % �յ����

guaidianNum  =  guaidianNum-1;  


maibobo_y      =  [];

yali                  =  [];

for i=1:guaidianNum-1
    
    plotX       = [guaidian(i+1),guaidian(i)];
    
    plotY       = [A(guaidian(i+1)),A(guaidian(i))];
    
    xishu       = polyfit(plotX,plotY,1);
    
    py2          = polyval(xishu,guaidian(i):guaidian(i+1));              % ���ֵ
    
    temp        = A(guaidian(i):guaidian(i+1))-py2';                       % ��ϲ�ֵ
    
    temp        = temp(2:length(temp));
    
    py2           = py2(2:length(py2));
    
    yali            = [yali,py2];                                                           % ���ֵ 
    
   maibobo_y = [maibobo_y;temp];                                           % ������  ����ϲ�ֵ�� 
    
end


maibobo_x    =  guaidian(1):guaidian(1)+length(maibobo_y)-1;

plot(maibobo_x,maibobo_y'*10);                                              % ��ֵ


hold on ;


yali_x                =  max_x:len ;

yali_y_front      =  A(max_x:guaidian(1))  ;                             %  ��һ���յ�

yali_y_behind  =  A(guaidian(guaidianNum)+1:len) ;           % ���һ���յ�

yali_y               =   [yali_y_front',yali]; 

yali_y               =  [yali_y,yali_y_behind'];                               % �м�ĳ����ֵ


% plot(yali_x,yali_y)

plot(yali_x,yali_y-100) ;                                                           % 100 ��ȷ��

dlmwrite('C:\Users\sunming\Desktop\ABI\5.txt',yali_y,'delimiter', '\n','precision','%d') ;

dlmwrite('C:\Users\sunming\Desktop\ABI\6.txt',A(max_x:len),'delimiter', '\n','precision','%d') ;

hold on ;

[maibobo_max_y,maibobo_max_x]    =  max(maibobo_y) ;                %��ϲ�ֵ���ֵ����  �����������ֵ��

plot(maibobo_x(maibobo_max_x),maibobo_max_y*10,'ro');  

%�������ݵĻ�ù��̣����Ƿ��Ǽ���100��ԭ��text(maibobo_x,maibobo_y','x:y:')

hold on  ;

Systolic_pressure  = 100  ;                                    %ƽ��ѹ     Ĭ��ֵ    

Diastolic_pressure = 90  ;                                     %����ѹ     Ĭ��ֵ



    for index=1:len-max_x+1                                                                                                          % �����������꿪ʼ�ң�ֱ��data2���ݽ���
        
        if((Systolic_pressure*10<=yali_y(index))&&(Systolic_pressure*10>=yali_y(index+1)))       % ѭ�������жϣ��������ѹ��Ӧ�ĺ������ֵ
            
             if((Systolic_pressure*10-yali_y(index+1))>=(yali_y(index)-Systolic_pressure*10))
                 
                    Systolic_pressure_X_index  = index;                                                                          % ƽ��ѹ������  
                    
             else
                    Systolic_pressure_X_index  = index+1;                    
             end
             break;
        end
    end
    
    
    
%     Systolic_pressure_Y=maibobo_y(Systolic_pressure_X_index);

%     Systolic_pressure_xishu=Systolic_pressure_Y/maibobo_max_y;

    for index=1:len-max_x+1                                                                                                           %   �����������꿪ʼ�ң�ֱ��data2���ݽ���
       
        if((Diastolic_pressure*10<=yali_y(index))&&(Diastolic_pressure*10>=yali_y(index+1)))     %   ѭ�������жϣ��������ѹ��Ӧ�ĺ������ֵ  %ѹ��ֵС��70�ͻ���ֲ��������������
           
            if((Diastolic_pressure*10-yali_y(index+1))>=(yali_y(index)-Diastolic_pressure*10))
                   
                 Diastolic_pressure_X_index      =  index;                                                                        % ����ѹ������                                                                         
                 
             else
                 
                    Diastolic_pressure_X_index   =  index+1;                                                               
                    
             end
             
             break;
             
        end
        
    end
    
    
%     Diastolic_pressure_Y=maibobo_y(Diastolic_pressure_X_index);
%     Diastolic_pressure_xishu=Diastolic_pressure_Y/maibobo_max_y;   
%     plot(maibobo_x(Systolic_pressure_X_index),Systolic_pressure_Y*10,'ro');
%     plot(maibobo_x(Diastolic_pressure_X_index),Diastolic_pressure_Y*10,'ro');
%     hold on
    
%     plot(yali_x(Systolic_pressure_X_index),yali_y(Systolic_pressure_X_index)-100,'+b',yali_x(Diastolic_pressure_X_index),yali_y(Diastolic_pressure_X_index)-100,'b+')
  
    plot(maibobo_x(maibobo_max_x),yali_y(maibobo_max_x+guaidian(1)-max_x+1)-100,'ro');         %��ϲ�ֵ���ֵ����
    
    
    c                =  [num2str(yali_y(maibobo_max_x+guaidian(1)-max_x+1))];                                       %%����maibobo_max_x+guaidian(1)-max_x?��    %%
    
    
    dingdian   =  yali_y(maibobo_max_x+guaidian(1)-max_x+1);                                                           %����ѹ
    
    
    text(maibobo_x(maibobo_max_x),yali_y(maibobo_max_x+guaidian(1)-max_x+1)+100,c);
    
    
    
   if((dingdian<700)&&(dingdian>300))
       
       Forecast_Systolic_pressure    =  dingdian+300;
       
       Forecast_Diastolic_pressure   =  dingdian-100;  
       
       return ;
       
   end
  
   
    hold on ;
    
    
%     Forecast_Systolic_pressure= yali_y(maibobo_max_x+guaidian(1)-max_x+1)*Systolic_pressure_xishu;
%     Forecast_Diastolic_pressure= yali_y(maibobo_max_x+guaidian(1)-max_x+1)*Diastolic_pressure_xishu;
    
%     value=yali_y(maibobo_max_x+guaidian(1)-max_x+1)
    %Forecast_Diastolic_pressure=

    
    
    
%������ѹ������ѹ��Ӧ���������һ��ϵ����Ȼ������õ�Ѫѹ�����ϵ������ϵ����Ӧ��ȥ���õ������꣬��������õ�ֵ��

   figure ��
   
   plot(maibobo_x,maibobo_y') ;                                                               % ������  ����ϲ�ֵ��   

   hold on ;  
   
   jizhidian   = []  ;
   
   
   last         = -50;
   
   num       = 0; 
   
   for i=62:length(maibobo_x)-11
                                                                                                                 %%%��͹��
       if((maibobo_y(i)>maibobo_y(i-1))&&(maibobo_y(i)>maibobo_y(i-2))&&(maibobo_y(i)>maibobo_y(i-3))&&(maibobo_y(i)>maibobo_y(i-4))&&(maibobo_y(i)>maibobo_y(i-5))&&(maibobo_y(i)>maibobo_y(i-6))&&(maibobo_y(i)>maibobo_y(i-7))&&(maibobo_y(i)>maibobo_y(i-8))&&(maibobo_y(i)>maibobo_y(i-9))&&(maibobo_y(i)>maibobo_y(i-10))&&(maibobo_y(i)>maibobo_y(i-11))&&(maibobo_y(i)>maibobo_y(i+1))&&(maibobo_y(i)>maibobo_y(i+2))&&(maibobo_y(i)>maibobo_y(i+3))&&(maibobo_y(i)>maibobo_y(i+4))&&(maibobo_y(i)>maibobo_y(i+5))&&(maibobo_y(i)>maibobo_y(i+6))&&(maibobo_y(i)>maibobo_y(i+7))&&(maibobo_y(i)>maibobo_y(i+8))&&(maibobo_y(i)>maibobo_y(i+9))&&(maibobo_y(i)>maibobo_y(i+10))&&(maibobo_y(i)>maibobo_y(i+11)))
          
           if(i-last>50)
               
           last          =  i  ;            
           
           jizhidian  = [jizhidian,i] ;                                                              %%��͹�������       
           
           num        = num+1;
           
           else
               if(maibobo_y(i)>maibobo_y(last))
                   
                    jizhidian(num)  =  i;
                    
                    last                   = i;
               end
               
           end
           
       end
       
   end
   
   
   
   if((length(jizhidian)<1)||(jizhidian(length(jizhidian))<=maibobo_max_x))
       
      Forecast_Systolic_pressure    =  0;
      Forecast_Diastolic_pressure   = 0;
      dingdian                                 = 0;
    
      return 
       
   end
   
   
   
   
   Correct_jizhidian   =   jizhidian(1);
   left_count              =  0;
   right_count           =  0;
   
   
   
   for i=1:length(jizhidian)-1
%       if((maibobo_y(jizhidian(i+1))>maibobo_y(Correct_jizhidian(length(Correct_jizhidian)))+10)&&(maibobo_y(jizhidian(i+1))>maibobo_y(Correct_jizhidian(length(Correct_jizhidian)))*3))
%           continue;
%       end
      if(jizhidian(i)<=maibobo_max_x)                                                                           %%���
          
          if(maibobo_y(jizhidian(i+1))>maibobo_y(jizhidian(i))&&(maibobo_y(jizhidian(i+1))>maibobo_y(Correct_jizhidian(length(Correct_jizhidian)))))
              
             if((jizhidian(i+1)<Correct_jizhidian(length(Correct_jizhidian))+2000))          %���Ϊ1000����Ϊ20151208143351(Ѫѹģ��-02).txt��������Ϊ2000���ܲ��������ģ������о�                      
                                                                                                                                     %2000������%
                 if((maibobo_y(jizhidian(i+1))<maibobo_y(Correct_jizhidian(length(Correct_jizhidian)))+10)||(maibobo_y(jizhidian(i+1))<maibobo_y(Correct_jizhidian(length(Correct_jizhidian)))*3)||(i<=1)||(maibobo_y(jizhidian(i+1))<maibobo_y(jizhidian(i+2))*1.2))   %������i��=1 ���Ի���iС�ڵ���5

                  Correct_jizhidian   =   [Correct_jizhidian,jizhidian(i+1)]  ;                         %%����ɸѡ
                  
                  left_count             =    left_count+1;
                  
                 end
                 
             end
             
          end
          
      end
      
      
      
      
      
      if(jizhidian(i)>=maibobo_max_x)                                                                          %%���
          
          if(maibobo_y(jizhidian(i+1))<maibobo_y(jizhidian(i))&&(maibobo_y(jizhidian(i+1))<maibobo_y(Correct_jizhidian(length(Correct_jizhidian)))))
            
              if(jizhidian(i+1)<Correct_jizhidian(length(Correct_jizhidian))+2000)           %���Ϊ1000����Ϊ20151208143351(Ѫѹģ��-02).txt��������Ϊ2000���ܲ��������ģ������о�    
                                                                                                                                    
                  Correct_jizhidian   =    [Correct_jizhidian,jizhidian(i+1)]   ;
                  
                 right_count            =    right_count+1;                                                       %%����ɸѡ       
              end
              
          end
          
      end
      
         
   end 
   
   
   
   
   jizhidian      =    Correct_jizhidian;                                                                    %%��ȷ�ļ�ֵ��                                                    
         
   plot(maibobo_x(jizhidian),maibobo_y(jizhidian),'ro')
 
   hold on  ;
   
   
   
    maibobo_PlotX   =   maibobo_x(jizhidian)       ;                                       
    
    maibobo_PlotY   =   maibobo_y(jizhidian)'      ;
    
    if((right_count>left_count)&&(left_count>=2))
        
        maibobo_PlotX   = maibobo_PlotX(1:left_count*2+2);
        
        maibobo_PlotY   = maibobo_PlotY(1:left_count*2+2);
        
%     else
%         maibobo_PlotX=maibobo_PlotX(length(maibobo_PlotX)-right_count*2+1:length(maibobo_PlotX));
%         maibobo_PlotY=maibobo_PlotY(length(maibobo_PlotY)-right_count*2+1:length(maibobo_PlotY));
%         ֮���Բ���������Σ�ʹ�������С���ұߵ�ʱ��Ҳ���н�ȡ����Ϊ���ڵ�ѹ��ʱ���ұ߱����Ѿ���С��Ȼ���պ�С�Ľ�ȡ��ߣ���ô������������ͺ��١�����ѹ֮���԰�����ߵ�������ȡ�ұߣ���Ϊ��ѹ���ĺܸߣ���ߵ�������Ȼ���ұߵ���һ���ḻ�ࡣ���Խ�ȡ�ұߡ������Ҫ������Σ���Ҫ�ұ������࣬Ҳ���ǽ�ѹ������Ҫ�ĵͲ��С�
    end   
    
    
    
    
    

%    fid = fopen('x.txt','wt');
%    fprintf(fid,'%d,',maibobo_PlotX);
%    fclose(fid);
%    
%    fid = fopen('y.txt','wt');
%    fprintf(fid,'%.2f,',maibobo_PlotY);
%    fclose(fid);
%     
%     if((Systolic_pressure_X_index>length(maibobo_x)+guaidian(1))||(Diastolic_pressure_X_index>length(maibobo_x)+guaidian(1)))
%           Forecast_Systolic_pressure=0;
%           Forecast_Diastolic_pressure=0;
%           dingdian=0;
%           return   
%     end                                                                                                                                                                    %��ֵ�����  
    fit_xishu_3     =   polyfit(maibobo_PlotX,maibobo_PlotY,3);                                                                                 %������ζ���ʽ��ϵ�ϵ��
  
    three_value   =  polyval(fit_xishu_3,maibobo_PlotX);                                                                                           %������Щϵ��ȷ��������ϵķ��̣���plotX�����ȥ��������۵�ֵ

    %     py4=polyval(fit_xishu_3,[maibobo_x(Systolic_pressure_X_index-guaidian(1)+1),maibobo_x(Diastolic_pressure_X_index-guaidian(1)+1)]);    %������ѹ������ѹ�ĺ�������뷽�̼��㣬��ö�Ӧ��yֵ
    syms x;
    
    f                     =  -(fit_xishu_3(1)*x^3+ fit_xishu_3(2)*x^2+ fit_xishu_3(3)*x+ fit_xishu_3(4));                             %ȷ����϶���ʽ��ϵ������
    
    f                    =   char(f);                                                                                                                                         %�����f��������ַ�������Ϊ�˽���fminbnd��ֵ
                                                                                        %%Ѱ�Ҿֲ���Сֵ
    [x_index,fval]= fminbnd(f,maibobo_PlotX(1) ,maibobo_PlotX(length(maibobo_PlotX)));                                    %maibobo_PlotX(1) %����Ϻ�Ĺ�ʽ��plotX(1)��plotX(length(plotX))������������Сֵ����Сֵ�ĺ�����
   
    fval               = abs(fval);                                                                                                                                         %��fval����Сֵ����ֵ�󣬾���������ֵ
%     
%      format bank
     plot(maibobo_PlotX,three_value,'b',x_index,fval,'mo') ;                                                                                       %,maibobo_x(Systolic_pressure_X_index),py4(1),'bo',maibobo_x(Diastolic_pressure_X_index),py4(2),'bo');  %����ߵ�����ݣ�����ѹ������ѹ�Ӷ�Ӧ������ݣ�����Ϸ�����������
   
     hold on  ;
     
%      plot(,Systolic_pressure_X_index,Systolic_pressure,'ro',Diastolic_pressure_X_index,Diastolic_pressure,'ro')
%     average=mean(plotY);                                                              %��Y��ƽ��ֵ
%     TSS=sum((plotY-average).^2);                                                  %����ƽ����
%     RSS=sum((py2-average).^2);                                                    %�ع�ƽ����
%     ESS=sum((py2-plotY).^2);                                                        %�в�ƽ���� ����=�ع�+�в�
%     RSquares=1-ESS/TSS;                                                              %Rƽ���ͣ���Rƽ�������ж����Ч���ĺû�
    
    temp3     =     maibobo_max_y;
    
    if(temp3*0.7>fval)
       temp3   =   fval;                                                                                       %(temp3+fval)/2
    end
    
%     Systolic_pressure_xishu=py4(1)/temp3;                                                %�������ѹ����ߵ�ı�ֵ
%     Diastolic_pressure_xishu=py4(2)/temp3;                                               %�������ѹ����ߵ�ı�ֵ
    temp4   =  temp3;
    
%     y=[Systolic_pressure_xishu*fval,Diastolic_pressure_xishu*fval];
%     t=solve('fit_xishu_3(1)*t^3+ fit_xishu_3(2)*t^2+ fit_xishu_3(3)*t+ fit_xishu_3(4)-y=0','t')%���x�ĺ���
%     
%     t=eval(t)%����x
%     plot(t(1,1),y(1),'+k',t(2,1),y(1),'+k',t(3,1),y(1),'+k',t(1,2),y(2),'+k',t(2,2),y(2),'+k',t(3,2),y(2))  
   fun = @(x)(fit_xishu_3(1)*x.^3+ fit_xishu_3(2)*x.^2+ fit_xishu_3(3)*x+ fit_xishu_3(4)-0.55*temp3) ;    %Systolic_pressure_xishu  0.620462298860544  fval maibobo_max_y
 
   x1  =  fzero(fun,[x_index*0.8])  ;    % ,three_value(2)                                                                               %0.7���ϲ��˲��Ļ����ԣ������Ѿ��˲��ˣ�0.7��������     
    
%    if(x1(1)<maibobo_PlotX(2))
%       fun=@(x)(fit_xishu_3(1)*x.^3+ fit_xishu_3(2)*x.^2+ fit_xishu_3(3)*x+ fit_xishu_3(4)-0.70*temp3)    %Systolic_pressure_xishu  0.620462298860544  fval maibobo_max_y
%       x1=fzero(fun,[x_index*0.8])   %,three_value(5)
%    end
%    
%    if(x1(1)>maibobo_x(maibobo_max_x))
%       fun=@(x)(fit_xishu_3(1)*x.^3+ fit_xishu_3(2)*x.^2+ fit_xishu_3(3)*x+ fit_xishu_3(4)-0.70*temp3)    %Systolic_pressure_xishu  0.620462298860544  fval maibobo_max_y
%       x1=fzero(fun,[x_index*0.8])    %,three_value(1) %maibobo_PlotX(1)
%    end
   
%    temp3=maibobo_max_y;
%    if(temp3*0.9>fval)
%        temp3=fval; 
%    end
   temp3   =   fval;
    
   fun2   =  @(x)(fit_xishu_3(1)*x.^3+ fit_xishu_3(2)*x.^2+ fit_xishu_3(3)*x+ fit_xishu_3(4)-0.75*temp3)  ; %Diastolic_pressure_xishu  0.828117099096032   %0.9
   x2      =   fzero(fun2,[x_index*1.3]) ;  %,three_value(length(maibobo_PlotX)-4)    %0.6���ϲ��˲��Ļ����ԣ������Ѿ��˲��ˣ�0.7��������       ��ǰ�õ�0.6       %1.1
%    if((x2(1)-max_x>length(yali_y))||(x2(1)>maibobo_PlotX(length(maibobo_PlotX))))
%        fun2=@(x)(fit_xishu_3(1)*x.^3+ fit_xishu_3(2)*x.^2+ fit_xishu_3(3)*x+ fit_xishu_3(4)-0.9*temp3)   %Diastolic_pressure_xishu  0.828117099096032
%        x2=fzero(fun2,[x_index*1.1])    % ,three_value(length(maibobo_PlotX)-8)   maibobo_PlotX(length(maibobo_PlotX)-8)
%    end
%    
%   if((x2(1)<maibobo_x(maibobo_max_x))&&(x2(1)<x_index))
%       fun=@(x)(fit_xishu_3(1)*x.^3+ fit_xishu_3(2)*x.^2+ fit_xishu_3(3)*x+ fit_xishu_3(4)-0.9*temp3)    %Systolic_pressure_xishu  0.620462298860544  fval maibobo_max_y
%       x2=fzero(fun2,[x_index*1.1])                   %,three_value(length(maibobo_PlotX))   %maibobo_PlotX(length(maibobo_PlotX))
%    end
   
   plot(x1(1),0.55*temp4,'+k',x2(1),0.75*temp3,'+k')   ;
 
   %fzero�����������ֵ�������⣬�õ���ֵ���ǰ��շ�������
   
%     Systolic_pressure_xishu
%     Diastolic_pressure_xishu
    guaidianNum   ��
%    
%    x1(1)
%    x2(1)
%    
%    Systolic_pressure_X_index
%    Diastolic_pressure_X_index
   
%   maibobo_x(Systolic_pressure_X_index)
%   maibobo_x(Diastolic_pressure_X_index)
   if(((x1(1)-max_x+1)>length(yali_y))||((x2(1)-max_x+1)>length(yali_y)))
       
       Forecast_Systolic_pressure  =0;
       
       Forecast_Diastolic_pressure =0;
       
       return;
       
   end
       
   Forecast_Systolic_pressure   =   round(yali_y(round(x1(1)-max_x+1))) ;%+80    %round(yali_y(round(x1(1)-max_x-length(yali_y_front)+1)))
   Forecast_Diastolic_pressure  =  round(yali_y(round(x2(1)-max_x+1))); %+50   %round(yali_y(round(x2(1)-max_x-length(yali_y_front)+1)))
%    Forecast_Systolic_pressure= A(round(x1(1)))
%    Forecast_Diastolic_pressure= A(round(x2(1)))

   
  
 
%     polyval��������ϵ���󣬳����������ֵ���뷽��f����f�ĺ�����
%    tֵ�кü��ԣ�Ҫ�ҵ�����ȷ����һ�ԣ�Ȼ���Ӧ������
   


%�Ѿ�������Ѫѹ�ƵĲ���������̵�ͨ�ˣ�Ȼ����һЩ���⣬ȷ�����ʵķ�������ϵ�������ã��Ϳ����ˣ�
%��׿ֻ�������˲��ķ��룬��һ���Һ������۹�������������˼�룬Ȼ�����Լ�ʵ���ˡ�����vb���򲻺ö����ڶ��������ø��Ӽ��ķ�ʽʵ���ˡ������˰����ߣ�Ȼ������

%1.�����������ݲ��ã��Լ���Ѫѹ���Ƿ��ܹ���һЩ
%2.�������İ����ߣ�Ҫ�ҵ����õķ���������ϣ������������κ�����ϵģ�Ӱ�쵽��ߵ��ѡȡ��Ӱ�쵽ϵ����ȷ����
%3.��ߵ�����ϵ�ֵ����ߵ���ʵ�ʵ�ֵ������
%4.ͨ����������ݣ���������ͳ�ƣ�ѡ����ʵķ������õ����ʵ�ϵ����
%5.matlab2012code ����ת��Ϊc���롣
%6.������ص��ĵ������ڵ�Ŀ���ǻ��������Լ���Ѫѹ�Ƶ�����Ӧ��ϵ����ͨ�����ϵ���õ�Ѫѹֵ��
%7.���׵Ļ���̫ңԶ����Ҫ���ϱ۵�ϵ��ȷ����Ȼ��õ��±۵�Ѫѹ��������������ʱ���ſ��������������ABI��PWV��ֵ��

% fzero����������Ҹ���������������������һ����ʼ�ĵ㣬�ڶ�������취����ǰ����Щ�㶼��Ҫ�����Ǵӵ�һ����ʼ