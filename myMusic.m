





% Unravel - TV Anime Tokyo Ghoul OP1 
% Original Artist: TK from LING Tosite Sigure
% Arranged by Animenz
% please adjust the volume before listen to the music
% 2020/07/06 14:13 in Hunan by ハノイの騎士だ using MATLAB R2018b





















clear all;
close all;
clc;

mix;

myMusic11 = create_wave(myMusicData11);
myMusic12 = create_wave(myMusicData12);
myMusic13 = create_wave(myMusicData13);
myMusic14 = create_wave(myMusicData14);
myMusic15 = create_wave(myMusicData15);
myMusic16 = create_wave(myMusicData16);
myMusic21 = create_wave(myMusicData21);
myMusic22 = create_wave(myMusicData22);
myMusic23 = create_wave(myMusicData23);
myMusic24 = create_wave(myMusicData24);
myMusic25 = create_wave(myMusicData25);

rate = 0.7;
y = .7 * (myMusic11 + myMusic12 + myMusic13 + myMusic14 + myMusic15 + myMusic16 + ...
     (myMusic21 + myMusic22 + myMusic23 + myMusic24 + myMusic25).*rate);
%y = .7 * (myMusic11 + myMusic12 + myMusic13 + myMusic14 + myMusic15 + myMusic16);
%plot(y);
tt=125
ss=132
clc;
%sound(y((tt-1) * 8000 * time + 1:2000+ss * 8000 * time));
sound(y);

function y = create_wave(rhythm)
fs = 8000;
y = zeros(1, round(sum(rhythm(3,:))*fs + 20000));
pos = 1;
for count = 1:size(rhythm, 2)
    rhythmNow = rhythm(1, count);
    if rhythmNow == -1
        soundFreq = 0;
    else
        soundFreq = 220 .* 2 .^ (rhythmNow/12 + rhythm(2,count));
    end
    [sound1, lenth] = single_sound(soundFreq,rhythm(3, count), fs, rhythm(6,count), rhythm(5,count));
    y(pos : pos + length(sound1) - 1) = y(pos : pos + length(sound1) - 1) + sound1;
    pos = pos + lenth;
end

end

function [mySound, lenth] = single_sound(freq, time, fs, volume, soundLength)
Lenths = [1.4, 1.2, 1.1 1];
lenth = Lenths(soundLength);
t = 0:1/fs:(time*lenth - 1/fs);
t2 = 0:1/fs:(time - 1/fs);
sound1 = zeros(1,size(t,2));
sound2 = zeros(1,size(t,2));
sound3 = zeros(1,size(t,2));
sound4 = zeros(1,size(t,2));
sound5 = zeros(1,size(t,2));
omega1 = 2*pi*freq;
omega2 = 2*pi*(freq*1.005);
omega3 = 2*pi*(freq*0.995);
omega4 = 2*pi*(freq*1.01);
omega5 = 2*pi*(freq*0.99);
c = [1 0.3 0.02 0.001];
for k = 1:size(c,2)
    sound1 = sound1 + c(k) * sin(k * omega1 .* t).* sin((1/(time*lenth))*pi .* t);% .* sin((1/(time*lenth))*pi .* t)
    sound2 = sound2 + c(k) * sin(k * omega2 .* t).* sin((1/(time*lenth))*pi .* t);% .* sin((1/(time*lenth))*pi .* t)
    sound3 = sound3 + c(k) * sin(k * omega3 .* t).* sin((1/(time*lenth))*pi .* t);% .* sin((1/(time*lenth))*pi .* t)
    sound4 = sound1 + c(k) * sin(k * omega4 .* t).* sin((1/(time*lenth))*pi .* t);% .* sin((1/(time*lenth))*pi .* t)
    sound5 = sound2 + c(k) * sin(k * omega5 .* t).* sin((1/(time*lenth))*pi .* t);% .* sin((1/(time*lenth))*pi .* t)
end

mySound = 0.5 * volume * exp(-6 .* t) .* (3*sound1 + .5*sound2 + .5*sound3 + .125*sound4 + .125*sound5)/5;
lenth = length(t2);
end


