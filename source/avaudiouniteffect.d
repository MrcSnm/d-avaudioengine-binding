module avaudiouniteffect;
import objc.runtime;
public import avaudiounit;

@ObjectiveC extern(C++) final:


class AVAudioUnitEffect {
    mixin ObjcExtend! AVAudioUnit;
    @selector("bypass")
    BOOL  bypass();

    @selector("setBypass:")
    BOOL  bypass(BOOL );

    @selector("initWithAudioComponentDescription:")
    typeof(this) initWithAudioComponentDescription(AudioComponentDescription initWithAudioComponentDescription);

}