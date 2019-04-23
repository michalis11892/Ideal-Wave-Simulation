xmin = input("Plane Dimension X-Minimum:");
xmax = input("Plane Dimension X-Maximum:");
ymin = input("Plane Dimension Y-Minimum:");
ymax = input("Plane Dimension Y-Maximum:");
precision = input("Precision Up-To:");
SourceNum = input("Number Of Sources:");
Source=zeros(6,SourceNum);
i=0;
while(SourceNum > i)
    i=i+1;
    Source(1,i)=input("Source "+i+" Position-X:");
    Source(2,i)=input("Source "+i+" Position-Y:");
    Source(3,i)=input("Source "+i+" Amplitude:");
    Source(4,i)=input("Source "+i+" Period:");
    Source(5,i)=input("Source "+i+" Wavelength:");
    Source(6,i)=input("Source "+i+" Time Of Initiation:");
end
t=0;
x = xmin:precision:xmax;
y = ymin:precision:ymax;
[X,Y] = meshgrid(x,y);
Z = zeros(((xmax-xmin)/precision)+1,((xmax-xmin)/precision)+1);
figure;
s = surf(X,Y,Z);
Znow=zeros(((xmax-xmin)/precision)+1,((xmax-xmin)/precision)+1);
while true
    n1=0;
    while(((xmax-xmin)/precision)+1>n1)
        n1=n1+1;
        n2=0;
        while(((xmax-xmin)/precision)+1>n2)
            n2=n2+1;
            i=0;
            while(SourceNum > i)
                i=i+1;
                Dnow=(((t-Source(6,i))/Source(4,i))-(sqrt((s.XData(n1,n2)-Source(1,i))^2 +(s.YData(n1,n2)-Source(2,i))^2)/Source(5,i)));
                if(Source(6,i)<=t)
                    if(Dnow>=0)
                        Znow(n1,n2)=Znow(n1,n2)+Source(3,i)*sin(2*pi*Dnow);
                    end
                end
            end 
        end
    end
    s.ZData=Znow;
    Znow=zeros(((xmax-xmin)/precision)+1,((xmax-xmin)/precision)+1);
    t=t+0.05;
    pause(0.05);
end
