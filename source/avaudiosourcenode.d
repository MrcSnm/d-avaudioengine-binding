module avaudiosourcenode;
import objc.meta;
import objc.runtime;
@ObjectiveC extern(C++) final:

alias AVAudioSourceNodeRenderBlock = OSStatus function (BOOL *isSilence, const AudioTimeStamp *timestamp, AVAudioFrameCount frameCount, AudioBufferList *outputData)  ;

class AVAudioSourceNode {
    mixin ObjcExtend! AVAudioNode;
    @selector("init")
    typeof(this) init();

    @selector("initWithRenderBlock:")
    typeof(this) initWithRenderBlock(AVAudioSourceNodeRenderBlock initWithRenderBlock);

    @selector("initWithFormat:renderBlock:")
    typeof(this) initWithFormat(AVAudioFormat* initWithFormat, AVAudioSourceNodeRenderBlock renderBlock);

}

