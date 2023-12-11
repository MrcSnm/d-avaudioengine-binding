module avaudioplayer;

import avaudioformat;
import avaudiotsettings;


class AVAudioPlayer {
    mixin ObjcExtend! NSObject;
    @selector("playing")
    BOOL  isPlaying();

    @selector("numberOfChannels")
    NSUInteger  numberOfChannels();

    @selector("duration")
    NSTimeInterval  duration();

    @selector("url")
    NSURL * url();

    @selector("data")
    NSData * data();

    @selector("meteringEnabled")
    BOOL  isMeteringEnabled();

    @selector("setMeteringEnabled:")
    BOOL  meteringEnabled(BOOL );

    @selector("initWithContentsOfURL:error:")
    typeof(this) initWithContentsOfURL(NSURL * initWithContentsOfURL, NSError ** error);

    @selector("initWithData:error:")
    typeof(this) initWithData(NSData * initWithData, NSError ** error);

    @selector("initWithContentsOfURL:fileTypeHint:error:")
    typeof(this) initWithContentsOfURL(NSURL * initWithContentsOfURL, NSString *  fileTypeHint = null, NSError ** error);

    @selector("initWithData:fileTypeHint:error:")
    typeof(this) initWithData(NSData * initWithData, NSString *  fileTypeHint = null, NSError ** error);

    @selector("prepareToPlay")
    BOOL prepareToPlay();

    @selector("play")
    BOOL play();

    @selector("playAtTime:")
    BOOL playAtTime(NSTimeInterval playAtTime);

    @selector("pause")
    void pause();

    @selector("stop")
    void stop();

    @selector("setVolume:fadeDuration:")
    void setVolume(float setVolume, NSTimeInterval fadeDuration);

    @selector("updateMeters")
    void updateMeters();

    @selector("peakPowerForChannel:")
    float peakPowerForChannel(NSUInteger peakPowerForChannel);

    @selector("averagePowerForChannel:")
    float averagePowerForChannel(NSUInteger averagePowerForChannel);

    @selector("audioPlayerDidFinishPlaying:successfully:")
    void audioPlayerDidFinishPlaying(AVAudioPlayer * audioPlayerDidFinishPlaying, BOOL successfully);

    @selector("audioPlayerDecodeErrorDidOccur:error:")
    void audioPlayerDecodeErrorDidOccur(AVAudioPlayer * audioPlayerDecodeErrorDidOccur, NSError *  error = null);

    @selector("audioPlayerBeginInterruption:")
    void audioPlayerBeginInterruption(AVAudioPlayer * audioPlayerBeginInterruption);

    @selector("audioPlayerEndInterruption:withOptions:")
    void audioPlayerEndInterruption(AVAudioPlayer * audioPlayerEndInterruption, NSUInteger withOptions);

    @selector("audioPlayerEndInterruption:withFlags:")
    void audioPlayerEndInterruption(AVAudioPlayer * audioPlayerEndInterruption, NSUInteger withFlags);

    @selector("audioPlayerEndInterruption:")
    void audioPlayerEndInterruption(AVAudioPlayer * audioPlayerEndInterruption);

}