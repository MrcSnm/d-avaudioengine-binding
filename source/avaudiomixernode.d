module avaudiomixernode;
public import avaudionode;
public import avaudiomixing;
import objc.runtime;
import objc.meta:selector;


class AVAudioMixerNode {
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