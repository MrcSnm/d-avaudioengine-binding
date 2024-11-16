module avaudiofile;
import avaudioformat;
import avaudiobuffer;
import objc.runtime;

@ObjectiveC extern(C++) final:

class AVAudioFile {
    @nogc nothrow:
    mixin ObjcExtend! NSObject;
    @selector("url")
    NSURL url();

    @selector("fileFormat")
    AVAudioFormat * fileFormat();

    @selector("processingFormat")
    AVAudioFormat * processingFormat();

    @selector("length")
    AVAudioFramePosition  length();

    @selector("framePosition")
    AVAudioFramePosition  framePosition();

    @selector("setFramePosition:")
    AVAudioFramePosition  framePosition(AVAudioFramePosition);

    @selector("initForReading:error:")
    typeof(this) initForReading(NSURL initForReading, NSError* error);

    @selector("initForReading:commonFormat:interleaved:error:")
    typeof(this) initForReading(NSURL initForReading, AVAudioCommonFormat commonFormat, BOOL interleaved, NSError* error);

    @selector("initForWriting:settings:error:")
    typeof(this) initForWriting(NSURL initForWriting, NSDictionary_!(NSString, void*) settings, NSError* error);

    @selector("initForWriting:settings:commonFormat:interleaved:error:")
    typeof(this) initForWriting(NSURL initForWriting, NSDictionary_!(NSString, void*)settings, AVAudioCommonFormat commonFormat, BOOL interleaved, NSError* error);

    @selector("readIntoBuffer:error:")
    BOOL readIntoBuffer(AVAudioPCMBuffer readIntoBuffer, NSError* error);

    @selector("readIntoBuffer:frameCount:error:")
    BOOL readIntoBuffer(AVAudioPCMBuffer readIntoBuffer, AVAudioFrameCount frameCount, NSError* error);

    @selector("writeFromBuffer:error:")
    BOOL writeFromBuffer(const AVAudioPCMBuffer writeFromBuffer, NSError* error);

}