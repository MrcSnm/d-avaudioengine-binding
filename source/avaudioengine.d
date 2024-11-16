module avaudioengine;
import objc.meta;
public import objc.runtime;
public import avaudioconnectionpoint;
public import avaudiotypes;
public import avaudionode;
public import avaudioionode;
public import avaudiomixernode;
public import avaudiomixing;
public import avaudioformat;
public import avaudiobuffer;
public import avaudioplayernode;
public import core.stdc.stdint;


@ObjectiveC extern(C++) final:

// alias AUMIDIEventListBlock = OSStatus function(AUEventSampleTime eventSampleTime, uint8_t cable, const MIDIEventList *eventList);


enum AVAudioEngineManualRenderingError : OSStatus { 
	InvalidMode = -80800,
	Initialized = -80801,
	NotRunning  = -80802
} 


enum AVAudioEngineManualRenderingStatus : NSInteger { 
	Error = -1,
	Success = 0,
	InsufficientDataFromInputNode = 1,
	CannotDoInCurrentContext = 2
} 


enum AVAudioEngineManualRenderingMode : NSInteger { 
	Offline = 0,
	Realtime = 1
} 


alias AVAudioEngineManualRenderingBlock = AVAudioEngineManualRenderingStatus function (AVAudioFrameCount numberOfFrames, AudioBufferList *outBuffer, OSStatus* outError) ;


struct OpaqueMusicSequence;
alias MusicSequence = OpaqueMusicSequence*;



class AVAudioEngine {
    @nogc nothrow:
    mixin ObjcExtend! NSObject;
    @selector("musicSequence")
    MusicSequence  musicSequence();

    @selector("setMusicSequence:")
    MusicSequence  musicSequence(MusicSequence );

    @selector("outputNode")
    AVAudioOutputNode outputNode();

    @selector("mainMixerNode")
    AVAudioMixerNode * mainMixerNode();

    @selector("running")
    BOOL  isRunning();

    @selector("alloc")
    static AVAudioEngine alloc();

    @selector("init")
    typeof(this) init();

    @selector("attachNode:")
    void attachNode(AVAudioNode attachNode);

    extern(D) final pragma(inline, true)
    {
        void attachNode(AVAudioPlayerNode node){attachNode(cast(AVAudioNode)node);}
        void attachNode(AVAudioMixerNode node){attachNode(cast(AVAudioNode)node);}
    }

    @selector("detachNode:")
    void detachNode(AVAudioNode detachNode);

    @selector("connect:to:fromBus:toBus:format:")
    void connect(AVAudioNode connect, AVAudioNode to, AVAudioNodeBus fromBus, AVAudioNodeBus toBus, AVAudioFormat  format = null);

    @selector("connect:to:format:")
    void connect(AVAudioNode connect, AVAudioNode to, AVAudioFormat  format = null);

    @selector("connect:toConnectionPoints:fromBus:format:")
    void connect(AVAudioNode connect, NSArray_!(AVAudioConnectionPoint) * toConnectionPoints, AVAudioNodeBus fromBus, AVAudioFormat  format = null);

    @selector("disconnectNodeInput:bus:")
    void disconnectNodeInput(AVAudioNode disconnectNodeInput, AVAudioNodeBus bus);

    @selector("disconnectNodeInput:")
    void disconnectNodeInput(AVAudioNode disconnectNodeInput);

    @selector("disconnectNodeOutput:bus:")
    void disconnectNodeOutput(AVAudioNode disconnectNodeOutput, AVAudioNodeBus bus);

    @selector("disconnectNodeOutput:")
    void disconnectNodeOutput(AVAudioNode disconnectNodeOutput);

    @selector("prepare")
    void prepare();

    @selector("startAndReturnError:")
    BOOL start(NSError* error);

    @selector("pause")
    void pause();

    @selector("reset")
    void reset();

    @selector("stop")
    void stop();

    @selector("inputConnectionPointForNode:inputBus:")
    AVAudioConnectionPoint inputConnectionPointForNode(AVAudioNode inputConnectionPointForNode, AVAudioNodeBus inputBus);

    @selector("outputConnectionPointsForNode:outputBus:")
    NSArray_!(AVAudioConnectionPoint) outputConnectionPointsForNode(AVAudioNode outputConnectionPointsForNode, AVAudioNodeBus outputBus);

    @selector("enableManualRenderingMode:format:maximumFrameCount:error:")
    BOOL enableManualRenderingMode(AVAudioEngineManualRenderingMode enableManualRenderingMode, AVAudioFormat format, AVAudioFrameCount maximumFrameCount, NSError* error);

    @selector("disableManualRenderingMode")
    void disableManualRenderingMode();

    @selector("renderOffline:toBuffer:error:")
    AVAudioEngineManualRenderingStatus renderOffline(AVAudioFrameCount renderOffline, AVAudioPCMBuffer toBuffer, NSError* error);

    // @selector("connectMIDI:to:format:block:")
    // void connectMIDI(AVAudioNode connectMIDI, AVAudioNode to, AVAudioFormat  format = null, AUMIDIOutputEventBlock  block = null);

    // @selector("connectMIDI:to:format:eventListBlock:")
    // void connectMIDI(AVAudioNode connectMIDI, AVAudioNode to, AVAudioFormat  format = null, AUMIDIEventListBlock  eventListBlock = null);

    // @selector("connectMIDI:toNodes:format:block:")
    // void connectMIDI(AVAudioNode connectMIDI, NSArray_!(AVAudioNode) * toNodes, AVAudioFormat  format = null, AUMIDIOutputEventBlock  block = null);

    // @selector("connectMIDI:toNodes:format:eventListBlock:")
    // void connectMIDI(AVAudioNode connectMIDI, NSArray_!(AVAudioNode) * toNodes, AVAudioFormat  format = null, AUMIDIEventListBlock  eventListBlock = null);

    @selector("disconnectMIDI:from:")
    void disconnectMIDI(AVAudioNode disconnectMIDI, AVAudioNode from);

    @selector("disconnectMIDI:fromNodes:")
    void disconnectMIDI(AVAudioNode disconnectMIDI, NSArray_!(AVAudioNode) fromNodes);

    @selector("disconnectMIDIInput:")
    void disconnectMIDIInput(AVAudioNode disconnectMIDIInput);

    @selector("disconnectMIDIOutput:")
    void disconnectMIDIOutput(AVAudioNode disconnectMIDIOutput);

}

extern const NSString AVAudioEngineConfigurationChangeNotification ;
