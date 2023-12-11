module avaudioconnectionpoint;
import avaudionode;

class AVAudioConnectionPoint {
    mixin ObjcExtend! NSObject;
    @selector("node")
    AVAudioNode * node();

    @selector("bus")
    AVAudioNodeBus  bus();

    @selector("initWithNode:bus:")
    typeof(this) initWithNode(AVAudioNode * initWithNode, AVAudioNodeBus bus);

    @selector("init")
    typeof(this) init();

}
