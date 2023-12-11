module avaudiosinknode;
import avaudionode;
import objc.meta;
import objc.runtime;
@ObjectiveC extern(C++) final:

alias AVAudioSinkNodeReceiverBlock = OSStatus function (const AudioTimeStamp *timestamp, AVAudioFrameCount frameCount, const AudioBufferList *inputData)  ;
 
class AVAudioSinkNode {
    mixin ObjcExtend! AVAudioNode;
    @selector("init")
    typeof(this) init();

    @selector("initWithReceiverBlock:")
    typeof(this) initWithReceiverBlock(AVAudioSinkNodeReceiverBlock initWithReceiverBlock);

}