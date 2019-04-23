x1 = 0.25; % X-Coordinate of the first wave's source
y1 = 0.25; % Y-Coordinate of the first wave's source
x2 = 0.75; % X-Coordinate of the second wave's source
y2 = 0.75; % Y-Coordinate of the second wave's source
A=0.1; % Amplitude of the first wave 
B=0.1; % Amplitude of the second wave
xmin = input("Plane Dimension X-Minimum:");
xmax = input("Plane Dimension X-Maximum:");
ymin = input("Plane Dimension Y-Minimum:");
ymax = input("Plane Dimension Y-Maximum:");
precision = input("Precision Up-To:");
t=0;
T1=1; % Period of the first wave
lambda1=0.05; % Wavelength of the first wave
T2=1; % Period of the second wave
lambda2=0.05; % Wavelength of the first wave
x = xmin:precision:xmax;
y = ymin:precision:ymax;
[X,Y] = meshgrid(x,y);
Z = A*sin(2*pi*((t/T1)-(sqrt((X-x1).^2 +(Y-y1).^2)/lambda1)))+B*sin(2*pi*((sqrt((X-x2).^2 +(Y-y2).^2)/lambda2)));
figure;
s = surf(X,Y,Z);
s.ZData=zeros(((xmax-xmin)/precision)+1,((xmax-xmin)/precision)+1);
while true
    if(((t/T1)-(sqrt((s.XData-x1).^2 +(s.YData-y1).^2)/lambda1))>=0)
        if(((t/T2)-(sqrt((s.XData-x2).^2 +(s.YData-y2).^2)/lambda2))>=0)
            s.ZData=A*sin(2*pi*((t/T1)-(sqrt((s.XData-x1).^2 +(s.YData-y1).^2)/lambda1)))+B*sin(2*pi*((t/T2)-(sqrt((s.XData-x2).^2 +(s.YData-y2).^2)/lambda2)));
        else
            s.ZData=A*sin(2*pi*((t/T1)-(sqrt((s.XData-x1).^2 +(s.YData-y1).^2)/lambda1)));
        end
    elseif(((t/T2)-(sqrt((s.XData-x2).^2 +(s.YData-y2).^2)/lambda2))>=0)
            s.ZData=B*sin(2*pi*((t/T2)-(sqrt((s.XData-x2).^2 +(s.YData-y2).^2)/lambda2)));    
    end
    t=t+0.05;
    pause(0.05);
end
