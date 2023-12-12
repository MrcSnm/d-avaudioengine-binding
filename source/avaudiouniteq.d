module avaudiouniteq;
import objc.runtime;
public import avaudiouniteffect;

@ObjectiveC extern(C++) final:

enum AVAudioUnitEQFilterType : NSInteger { 
    Parametric        = 0,
    LowPass           = 1,
    HighPass          = 2,
    ResonantLowPass   = 3,
    ResonantHighPass  = 4,
    BandPass          = 5,
    BandStop          = 6,
    LowShelf          = 7,
    HighShelf         = 8,
    ResonantLowShelf  = 9,
    ResonantHighShelf = 10,
} 




class AVAudioUnitEQFilterParameters {
    mixin ObjcExtend! NSObject;
    @selector("filterType")
    AVAudioUnitEQFilterType  filterType();

    @selector("setFilterType:")
    AVAudioUnitEQFilterType  filterType(AVAudioUnitEQFilterType );

    @selector("frequency")
    float  frequency();

    @selector("setFrequency:")
    float  frequency(float );

    @selector("bandwidth")
    float  bandwidth();

    @selector("setBandwidth:")
    float  bandwidth(float );

    @selector("gain")
    float  gain();

    @selector("setGain:")
    float  gain(float );

    @selector("bypass")
    BOOL  bypass();

    @selector("setBypass:")
    BOOL  bypass(BOOL );

    @selector("init")
    typeof(this) init();

}



class AVAudioUnitEQ {
    mixin ObjcExtend! AVAudioUnitEffect;
    @selector("globalGain")
    float  globalGain();

    @selector("setGlobalGain:")
    float  globalGain(float );

    @selector("initWithNumberOfBands:")
    typeof(this) initWithNumberOfBands(NSUInteger initWithNumberOfBands);

}