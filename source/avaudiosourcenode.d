module avaudiosourcenode;
import objc.meta;
import objc.runtime;

public import avaudionode;
public import avaudiotypes;
public import avaudioformat;

@ObjectiveC extern(C++) final:

alias AVAudioSourceNodeRenderBlock = OSStatus function (BOOL *isSilence, const AudioTimeStamp timestamp, AVAudioFrameCount frameCount, AudioBufferList *outputData);

class AVAudioSourceNode {
    @nogc nothrow:
    mixin ObjcExtend! AVAudioNode;
    @selector("init")
    typeof(this) init();

    @selector("initWithRenderBlock:")
    typeof(this) initWithRenderBlock(AVAudioSourceNodeRenderBlock initWithRenderBlock);

    @selector("initWithFormat:renderBlock:")
    typeof(this) initWithFormat(AVAudioFormat initWithFormat, AVAudioSourceNodeRenderBlock renderBlock);

}

