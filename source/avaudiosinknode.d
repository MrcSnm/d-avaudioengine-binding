module avaudiosinknode;
public import avaudionode;
public import avaudiotypes;

import objc.meta;
import objc.runtime;
@ObjectiveC extern(C++) final:

alias AVAudioSinkNodeReceiverBlock = OSStatus function (const AudioTimeStamp timestamp, AVAudioFrameCount frameCount, const AudioBufferList* inputData)  ;
 
class AVAudioSinkNode {
    @nogc nothrow:
    mixin ObjcExtend! AVAudioNode;
    @selector("init")
    typeof(this) init();

    @selector("initWithReceiverBlock:")
    typeof(this) initWithReceiverBlock(AVAudioSinkNodeReceiverBlock initWithReceiverBlock);

}