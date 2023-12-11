module avaudioplayernode;

import avaudionode;
import avaudiofile;

enum AVAudioPlayerNodeBufferOptions : NSUInteger { 
    Loops			= 1UL << 0,		// 0x01
	Interrupts		= 1UL << 1,		// 0x02
	InterruptsAtLoop	= 1UL << 2		// 0x04
} 


enum AVAudioPlayerNodeCompletionCallbackType : NSInteger { 
	AVAudioPlayerNodeCompletionDataConsumed		= 0,
	AVAudioPlayerNodeCompletionDataRendered		= 1,
	AVAudioPlayerNodeCompletionDataPlayedBack	= 2,
} 


alias AVAudioPlayerNodeCompletionHandler = void function (AVAudioPlayerNodeCompletionCallbackType callbackType) ;



class AVAudioPlayerNode {
    mixin ObjcExtend! AVAudioNode;
    @selector("playing")
    BOOL  isPlaying();

    @selector("init")
    typeof(this) init();

    @selector("scheduleBuffer:completionHandler:")
    void scheduleBuffer(AVAudioPCMBuffer * scheduleBuffer, AVAudioNodeCompletionHandler  completionHandler = null);

    @selector("scheduleBuffer:completionCallbackType:completionHandler:")
    void scheduleBuffer(AVAudioPCMBuffer * scheduleBuffer, AVAudioPlayerNodeCompletionCallbackType completionCallbackType, AVAudioPlayerNodeCompletionHandler  completionHandler = null);

    @selector("scheduleBuffer:atTime:options:completionHandler:")
    void scheduleBuffer(AVAudioPCMBuffer * scheduleBuffer, AVAudioTime *  atTime = null, AVAudioPlayerNodeBufferOptions options, AVAudioNodeCompletionHandler  completionHandler = null);

    @selector("scheduleBuffer:atTime:options:completionCallbackType:completionHandler:")
    void scheduleBuffer(AVAudioPCMBuffer * scheduleBuffer, AVAudioTime *  atTime = null, AVAudioPlayerNodeBufferOptions options, AVAudioPlayerNodeCompletionCallbackType completionCallbackType, AVAudioPlayerNodeCompletionHandler  completionHandler = null);

    @selector("scheduleFile:atTime:completionHandler:")
    void scheduleFile(AVAudioFile * scheduleFile, AVAudioTime *  atTime = null, AVAudioNodeCompletionHandler  completionHandler = null);

    @selector("scheduleFile:atTime:completionCallbackType:completionHandler:")
    void scheduleFile(AVAudioFile * scheduleFile, AVAudioTime *  atTime = null, AVAudioPlayerNodeCompletionCallbackType completionCallbackType, AVAudioPlayerNodeCompletionHandler  completionHandler = null);

    @selector("scheduleSegment:startingFrame:frameCount:atTime:completionHandler:")
    void scheduleSegment(AVAudioFile * scheduleSegment, AVAudioFramePosition startingFrame, AVAudioFrameCount frameCount, AVAudioTime *  atTime = null, AVAudioNodeCompletionHandler  completionHandler = null);

    @selector("scheduleSegment:startingFrame:frameCount:atTime:completionCallbackType:completionHandler:")
    void scheduleSegment(AVAudioFile * scheduleSegment, AVAudioFramePosition startingFrame, AVAudioFrameCount frameCount, AVAudioTime *  atTime = null, AVAudioPlayerNodeCompletionCallbackType completionCallbackType, AVAudioPlayerNodeCompletionHandler  completionHandler = null);

    @selector("stop")
    void stop();

    @selector("prepareWithFrameCount:")
    void prepareWithFrameCount(AVAudioFrameCount prepareWithFrameCount);

    @selector("play")
    void play();

    @selector("playAtTime:")
    void playAtTime(AVAudioTime *  playAtTime = null);

    @selector("pause")
    void pause();

    @selector("nodeTimeForPlayerTime:")
    AVAudioTime * nodeTimeForPlayerTime(AVAudioTime * nodeTimeForPlayerTime);

    @selector("playerTimeForNodeTime:")
    AVAudioTime * playerTimeForNodeTime(AVAudioTime * playerTimeForNodeTime);

}