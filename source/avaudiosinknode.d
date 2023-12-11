module avaudiosinknode;

import avaudionode;
alias AVAudioSinkNodeReceiverBlock = OSStatus function (const AudioTimeStamp *timestamp, AVAudioFrameCount frameCount, const AudioBufferList *inputData)  ;
 
class AVAudioSinkNode {
    mixin ObjcExtend! AVAudioNode;
    @selector("init")
    typeof(this) init();

    @selector("initWithReceiverBlock:")
    typeof(this) initWithReceiverBlock(AVAudioSinkNodeReceiverBlock initWithReceiverBlock);

}