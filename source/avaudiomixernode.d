module avaudiomixernode;
public import avaudionode;
public import avaudiomixing;
import objc.runtime;
import objc.meta:selector;

@ObjectiveC extern(C++) final:


class AVAudioMixerNode {
    @nogc nothrow:
    mixin ObjcExtend! AVAudioNode;
    @selector("outputVolume")
    float  outputVolume();

    @selector("setOutputVolume:")
    float  outputVolume(float );

    @selector("nextAvailableInputBus")
    AVAudioNodeBus  nextAvailableInputBus();

    @selector("init")
    typeof(this) init();

}