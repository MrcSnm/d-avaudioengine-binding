module avaudionode;
import avaudiotypes;
import avaudioengine;
import objc.meta;
import objc.runtime;
@ObjectiveC extern(C++) final:

alias AVAudioNodeTapBlock = void function (AVAudioPCMBuffer *buffer, AVAudioTime *when);

class AVAudioNode {
    mixin ObjcExtend! NSObject;
    @selector("engine")
    AVAudioEngine engine();

    @selector("numberOfInputs")
    NSUInteger  numberOfInputs();

    @selector("numberOfOutputs")
    NSUInteger  numberOfOutputs();

    @selector("lastRenderTime")
    AVAudioTime * lastRenderTime();

    @selector("reset")
    void reset();

    @selector("inputFormatForBus:")
    AVAudioFormat * inputFormatForBus(AVAudioNodeBus inputFormatForBus);

    @selector("outputFormatForBus:")
    AVAudioFormat * outputFormatForBus(AVAudioNodeBus outputFormatForBus);

    @selector("nameForInputBus:")
    NSString nameForInputBus(AVAudioNodeBus nameForInputBus);

    @selector("nameForOutputBus:")
    NSString nameForOutputBus(AVAudioNodeBus nameForOutputBus);

    @selector("installTapOnBus:bufferSize:format:block:")
    void installTapOnBus(AVAudioNodeBus installTapOnBus, AVAudioFrameCount bufferSize, AVAudioFormat *  format = null, AVAudioNodeTapBlock block);

    @selector("removeTapOnBus:")
    void removeTapOnBus(AVAudioNodeBus removeTapOnBus);

}