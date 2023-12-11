module avaudioconnectionpoint;
import avaudionode;
import objc.meta;
import objc.runtime;


@ObjectiveC extern(C++) final:

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
