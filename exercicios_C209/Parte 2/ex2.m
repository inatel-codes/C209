[y Fs] = audioread("Ashes Remain - On My Own.mp3");

t = 25;
p = 1;

for i=t:(t+10)
    y(Fs*i:Fs*(i+1), :) = p * y(Fs*i:Fs*(i+1), :);
    
    if p >= 0.1
       p = p - 0.1;
    end;
end;

sound(y(Fs*t:Fs*(t+10), :), Fs);
audiowrite('OnMyOwn.wav', y(Fs*t:Fs*(t+10), :), Fs);

pause(10);

sound(y(Fs*t:Fs*(t+5), :), Fs*0.5);

pause(10);

sound(y(Fs*(t+5):Fs*(t+10), :), Fs*1.5);