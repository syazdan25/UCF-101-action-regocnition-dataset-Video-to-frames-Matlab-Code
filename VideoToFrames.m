classes={'ApplyEyeMakeup', 'ApplyLipstick', 'Archery', 'BabyCrawling', 'BalanceBeam', 'BandMarching', 'BaseballPitch', 'Basketball', 'BasketballDunk', 'BenchPress', 'Biking', 'Billiards', 'BlowDryHair', 'BlowingCandles', 'BodyWeightSquats', 'Bowling', 'BoxingPunchingBag', 'BoxingSpeedBag', 'BreastStroke', 'BrushingTeeth', 'CleanAndJerk', 'CliffDiving', 'CricketBowling', 'CricketShot', 'CuttingInKitchen', 'Diving', 'Drumming', 'Fencing', 'FieldHockeyPenalty', 'FloorGymnastics', 'FrisbeeCatch', 'FrontCrawl', 'GolfSwing', 'Haircut', 'HammerThrow', 'Hammering', 'HandstandPushups', 'HandstandWalking', 'HeadMassage', 'HighJump', 'HorseRace', 'HorseRiding', 'HulaHoop', 'IceDancing', 'JavelinThrow', 'JugglingBalls', 'JumpRope', 'JumpingJack', 'Kayaking', 'Knitting', 'LongJump', 'Lunges', 'MilitaryParade', 'Mixing', 'MoppingFloor', 'Nunchucks', 'ParallelBars', 'PizzaTossing', 'PlayingGuitar', 'PlayingPiano', 'PlayingTabla', 'PlayingViolin', 'PlayingCello', 'PlayingDaf', 'PlayingDhol', 'PlayingFlute', 'PlayingSitar', 'PoleVault', 'PommelHorse', 'PullUps', 'Punch', 'PushUps', 'Rafting', 'RockClimbingIndoor', 'RopeClimbing', 'Rowing', 'SalsaSpin', 'ShavingBeard', 'Shotput', 'SkateBoarding', 'Skiing', 'Skijet', 'SkyDiving', 'SoccerJuggling', 'SoccerPenalty', 'StillRings', 'SumoWrestling', 'Surfing', 'Swing', 'TableTennisShot', 'TaiChi', 'TennisSwing', 'ThrowDiscus', 'TrampolineJumping', 'Typing', 'UnevenBars', 'VolleyballSpiking', 'WalkingWithDog', 'WallPushups', 'WritingOnBoard', 'YoYo'};
% mkdir('classes')
% mkdir('test_set')
% for i= 1:length(classes)
%     mkdir('classes',char(num2str(i-1)));
%     mkdir('test_set',char(num2str(i-1)));    
% end
fid = fopen('testlist03.txt');
tline = fgetl(fid);
x=1;
while ischar(tline)
    pq=strcat('UCF-101\',strrep(tline,'/','\'));
    %ntline = extractBefore(pq,' ');
    ntline=pq
    newStr = extractBefore(tline,'/')
    i=find(strcmp(classes,newStr))
    ind= num2str(i-1)
    out= strcat('test_set\',ind,'\');    
    a=VideoReader(char(ntline));
    for img = 1:a.NumberOfFrames/a.FrameRate; 
        x=x+1;
        filename=strcat(out,num2str(x),'.png');
        char(filename)
        b = read(a, img*a.FrameRate); 
        imwrite(b,filename);
    end
    disp(ntline)
    tline = fgetl(fid);
end
fclose(fid);