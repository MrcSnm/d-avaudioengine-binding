module avaudiotime;
public import avaudiotypes;
import objc.runtime;
import objc.meta:selector;

@ObjectiveC extern(C++) final:

class AVAudioTime {
    @nogc nothrow:
    mixin ObjcExtend! NSObject;
    @selector("hostTimeValid")
    BOOL  isHostTimeValid();

    @selector("hostTime")
    ulong  hostTime();

    @selector("sampleTimeValid")
    BOOL  isSampleTimeValid();

    @selector("sampleTime")
    AVAudioFramePosition  sampleTime();

    @selector("sampleRate")
    double  sampleRate();

    @selector("audioTimeStamp")
    AudioTimeStamp  audioTimeStamp();

    @selector("initWithAudioTimeStamp:sampleRate:")
    typeof(this) initWithAudioTimeStamp(const AudioTimeStamp * initWithAudioTimeStamp, double sampleRate);

    @selector("initWithHostTime:")
    typeof(this) initWithHostTime(ulong initWithHostTime);

    @selector("initWithSampleTime:atRate:")
    typeof(this) initWithSampleTime(AVAudioFramePosition initWithSampleTime, double atRate);

    @selector("initWithHostTime:sampleTime:atRate:")
    typeof(this) initWithHostTime(ulong initWithHostTime, AVAudioFramePosition sampleTime, double atRate);

    @selector("timeWithAudioTimeStamp:sampleRate:")
    static typeof(this) timeWithAudioTimeStamp(const AudioTimeStamp * timeWithAudioTimeStamp, double sampleRate);

    @selector("timeWithHostTime:")
    static typeof(this) timeWithHostTime(ulong timeWithHostTime);

    @selector("timeWithSampleTime:atRate:")
    static typeof(this) timeWithSampleTime(AVAudioFramePosition timeWithSampleTime, double atRate);

    @selector("timeWithHostTime:sampleTime:atRate:")
    static typeof(this) timeWithHostTime(ulong timeWithHostTime, AVAudioFramePosition sampleTime, double atRate);

    @selector("hostTimeForSeconds:")
    static ulong hostTimeForSeconds(NSTimeInterval hostTimeForSeconds);

    @selector("secondsForHostTime:")
    static NSTimeInterval secondsForHostTime(ulong secondsForHostTime);

    @selector("extrapolateTimeFromAnchor:")
    AVAudioTime extrapolateTimeFromAnchor(AVAudioTime extrapolateTimeFromAnchor);

}
