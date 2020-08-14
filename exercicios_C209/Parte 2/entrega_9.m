[y, Fs] = audioread("Ashes Remain - Right Here.mp3");

p = 1; % porcentagem
t = 14; % tempo escolhido
time = (length(y)/Fs)-1; % tempo total da musica

for i=t:time
    if p >= 0.1
    	 p = p - 0.1; % diminui a porcentagem em 10% a cada 1 s
    end;
    
    y(Fs*i:Fs*(i+1),:) = p*y(Fs*i:Fs*(i+1),:);
end;

sound(y(Fs*t:Fs*(t+10), :), Fs);
audiowrite('audio.wav',y(Fs*t:Fs*(t+10), :),Fs);

pause(10);

sound(y(Fs*t:Fs*(t+5), :), Fs*0.5);

pause(10);

sound(y(Fs*(t+5):Fs*(t+10), :), Fs*1.5);


