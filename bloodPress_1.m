function  [dingdian]=bloodPress_1(filename2)

      %%ƽ��ѹ

filename=filename2;


A=textread(filename,'%d');

len=length(A);

[max_y,max_x]=max(A);

figure(1);

plot(A);

hold on ;

plot(max_x,max_y,'ro') ;

hold on ;

start=max_x;

guaidianNum=1;

guaidian=[max_x];

for start=max_x:len-5
                                                                                  % two  step   
    if((A(start+1)-A(start)>=1)&&(A(start+2)-A(start)>=1)&&(A(start+3)-A(start)>=2)&&(A(start+4)-A(start)>=2)&&(A(start+5)-A(start)>=3))  
        
        if((start-guaidian(guaidianNum)>65))%&&(start>200) %60�Ժ���Գ���һ��     % 0.65s         
            
          guaidianNum=guaidianNum+1;
          
          guaidian=[guaidian,start];                                           %�ҹյ�
          
          plot(guaidian(guaidianNum),A(guaidian(guaidianNum)),'ro') ;
          
          hold on ;
          
       end
    end
end

if(guaidianNum<=2)
   dingdian=-10;
   return 
end
    


guaidian=guaidian(2:guaidianNum);

guaidianNum=guaidianNum-1; 


maibobo_y=[];

yali=[];

for i=1:guaidianNum-1
    
    plotX=[guaidian(i+1),guaidian(i)];
    
    plotY=[A(guaidian(i+1)),A(guaidian(i))];
    
    xishu=polyfit(plotX,plotY,1);                                          %  һ�ζ���ʽ���ϵ��
    
    py2=polyval(xishu,guaidian(i):guaidian(i+1));               %  һ�ζ���ʽ���
    
    temp=A(guaidian(i):guaidian(i+1))-py2';                      %   ��ϲ�ֵ     
    
    temp=temp(2:length(temp));
    
    py2=py2(2:length(py2));
    
    yali=[yali,py2];
    
    maibobo_y=[maibobo_y;temp];                                     %  ��ϲ�ֵ  �����������ݣ�  
    
end


maibobo_x = guaidian(1):guaidian(1)+length(maibobo_y)-1;                             

 

plot(maibobo_x,maibobo_y'*10);                                        %   

hold on ;

yali_x              =  max_x:len;                                                                            

yali_y_front    =  A(max_x:guaidian(1));                              %   ��һ���յ�              

yali_y_behind =  A(guaidian(guaidianNum)+1:len);          %   ���һ���յ�

yali_y             =  [yali_y_front',yali];

yali_y             =  [yali_y,yali_y_behind'];                              %   ���ֵ����м䲿��

% plot(yali_x,yali_y)

plot(yali_x,yali_y-100);                                                          %  Ϊɶ����100   ��ͼ����                      

dlmwrite('C:\Users\sunming\Desktop\ABI\5.txt',yali_y,'delimiter', '\n','precision','%d');

dlmwrite('C:\Users\sunming\Desktop\ABI\6.txt',A(max_x:len),'delimiter', '\n','precision','%d');

hold on ��

[maibobo_max_y,maibobo_max_x]=max(maibobo_y);       % ��ϲ�ֵ���ֵ�����������ֵ��ƽ��ѹ����

plot(maibobo_x(maibobo_max_x),maibobo_max_y*10,'ro');     

%�������ݵĻ�ù��̣����Ƿ��Ǽ���100��ԭ��text(maibobo_x,maibobo_y','x:y:')

hold on  ��

plot(maibobo_x(maibobo_max_x),yali_y(maibobo_max_x+guaidian(1)-max_x+1)-100,'ro');             % 

c=[num2str(yali_y(maibobo_max_x+guaidian(1)-max_x+1))];

dingdian=yali_y(maibobo_max_x+guaidian(1)-max_x+1);

text(maibobo_x(maibobo_max_x),yali_y(maibobo_max_x+guaidian(1)-max_x+1)+100,c);

if(maibobo_max_y*10<120)
    
      dingdian=0;
        
end




    
    

