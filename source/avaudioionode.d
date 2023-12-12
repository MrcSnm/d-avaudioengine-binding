module avaudioionode;
public import avaudionode;
public import avaudiomixing;
public import avaudioformat;

import objc.meta;
import objc.runtime;
@ObjectiveC extern(C++) final:

class AVAudioIONode {
    mixin ObjcExtend! AVAudioNode;
    @selector("presentationLatency")
    NSTimeInterval presentationLatency();

    @selector("audioUnit")
    AudioUnit  audioUnit();

    @selector("setVoiceProcessingEnabled:error:")
    BOOL setVoiceProcessingEnabled(BOOL setVoiceProcessingEnabled, NSError ** error);

}


class AVAudioInputNode {
    mixin ObjcExtend! AVAudioIONode;
    @selector("init")
    typeof(this) init();

    @selector("setManualRenderingInputPCMFormat:inputBlock:")
    BOOL setManualRenderingInputPCMFormat(AVAudioFormat * setManualRenderingInputPCMFormat, AVAudioIONodeInputBlock inputBlock);

}

class AVAudioOutputNode {
    mixin ObjcExtend! AVAudioIONode;
    @selector("init")
    typeof(this) init();

}