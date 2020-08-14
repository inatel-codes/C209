[y Fs] = audioread("Ashes Remain - Right Here.mp3");

p = 1 % porcentagem (começa em 100%)
t = 40 % tempo escolhido
time = (length(y)/Fs) - 1 % total do audio

for i=t:(t+10) 
    y(Fs*i:Fs*(i+1), :) = p * y(Fs*i:Fs*(i+1), :);
    
    if p >= 0.1
        p = p - 0.1;
    end;
end;

sound(y(Fs*t:Fs*(t+10), :), Fs);

audiowrite('audio_salvo.wav', y(Fs*t:Fs*(t+10), :), Fs);
 
pause(10); % pausa por 10s

sound(y(Fs*t:Fs*(t+5), :), Fs*0.5);

pause(10); % pausa por 10s

sound(y(Fs*(t+5):Fs*(t+10), :), Fs*1.5);

