module avaudiomixing;
public import avaudiotypes;
public import avaudioconnectionpoint;
public import avaudionode;
import objc.runtime;
import objc.meta : selector, ObjcExtend;

@ObjectiveC extern(C++) final:

interface AVAudioStereoMixing {
    @nogc nothrow:
    @selector("volume")
    float  volume();

    @selector("setVolume:")
    float  volume(float );

    @selector("destinationForMixer:bus:")
    AVAudioMixingDestination * destinationForMixer(AVAudioNode * destinationForMixer, AVAudioNodeBus bus);
    
    @selector("pan")
    float  pan();

    @selector("setPan:")
    float  pan(float );

}


enum AVAudio3DMixingRenderingAlgorithm : NSInteger { 
    EqualPowerPanning      = 0,
    SphericalHead          = 1,
    HRTF                   = 2,
    SoundField             = 3,
    StereoPassThrough      = 5,
    HRTFHQ                 = 6,
    Auto        = 7
} 



enum AVAudio3DMixingSourceMode : NSInteger { 
    SpatializeIfMono   = 0,
    Bypass             = 1,
    PointSource        = 2,
    AmbienceBed        = 3
} 



enum AVAudio3DMixingPointSourceInHeadMode : NSInteger { 
    Mono    = 0,
    Bypass  = 1
} 

interface AVAudio3DMixing {
}

class AVAudioMixingDestination {
    @nogc nothrow:
    mixin ObjcExtend! NSObject;
    @selector("connectionPoint")
    AVAudioConnectionPoint connectionPoint();

    @selector("init")
    typeof(this) init();

}