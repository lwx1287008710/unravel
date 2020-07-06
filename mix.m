myRhythm;
myLevel;
myTime;
myLength;
myUpLow;
myVolume;
myMusicData11 = trans([rhythm11;level11;time11;uplow11;length11;volume11], 3);
myMusicData12 = trans([rhythm12;level12;time12;uplow12;length12;volume12], 3);
myMusicData13 = trans([rhythm13;level13;time13;uplow13;length13;volume13], 3);
myMusicData14 = trans([rhythm14;level14;time14;uplow14;length14;volume14], 3);
myMusicData15 = trans([rhythm15;level15;time15;uplow15;length15;volume15], 3);
myMusicData16 = trans([rhythm16;level16;time16;uplow16;length16;volume16], 3);
myMusicData21 = trans([rhythm21;level21;time21;uplow21;length21;volume21], 3);
myMusicData22 = trans([rhythm22;level22;time22;uplow22;length22;volume22], 3);
myMusicData23 = trans([rhythm23;level23;time23;uplow23;length23;volume23], 3);
myMusicData24 = trans([rhythm24;level24;time24;uplow24;length24;volume24], 3);
myMusicData25 = trans([rhythm25;level25;time25;uplow25;length25;volume25], 3);
function myMusicData = trans(rhythm, basetune)

    soundpos = [0 2 4 5 7 9 11];
    for count = 1:size(rhythm, 2)
        if rhythm(1,count)==0
            rhythm(1,count) = -1;
        else
            rhythm(1,count) = soundpos(rhythm(1,count)) + basetune + rhythm(4,count);
        end
    end
    
    myMusicData = rhythm;

end
