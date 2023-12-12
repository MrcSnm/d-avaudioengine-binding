module avaudiounitreverb;
import objc.runtime;
import avaudiouniteffect;

@ObjectiveC extern(C++) final:

enum AVAudioUnitReverbPreset : NSInteger { 
    SmallRoom       = 0,
    MediumRoom      = 1,
    LargeRoom       = 2,
    MediumHall      = 3,
    LargeHall       = 4,
    Plate           = 5,
    MediumChamber   = 6,
    LargeChamber    = 7,
    Cathedral       = 8,
    LargeRoom2      = 9,
    MediumHall2     = 10,
    MediumHall3     = 11,
    LargeHall2      = 12
} 


 
class AVAudioUnitReverb {
    mixin ObjcExtend! AVAudioUnitEffect;
    @selector("wetDryMix")
    float  wetDryMix();

    @selector("setWetDryMix:")
    float  wetDryMix(float );

    @selector("loadFactoryPreset:")
    void loadFactoryPreset(AVAudioUnitReverbPreset loadFactoryPreset);

}