[y, Fs] = audioread("music2.wav");

part = y(Fs*1:end, :);
sound(part, Fs*1.3);