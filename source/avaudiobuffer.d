module avaudiobuffer;
public import avaudiotypes;
import objc.runtime;
import avaudioformat;


@ObjectiveC extern(C++) final:


class AVAudioBuffer {
    mixin ObjcExtend! NSObject;
    @selector("format")
    AVAudioFormat format();

    @selector("mutableAudioBufferList")
    AudioBufferList mutableAudioBufferList();

}


// -------------------------------------------------------------------------------------------------



class AVAudioPCMBuffer {
    mixin ObjcExtend! AVAudioBuffer;
    @selector("frameCapacity")
    AVAudioFrameCount  frameCapacity();

    @selector("frameLength")
    AVAudioFrameCount  frameLength();

    @selector("setFrameLength:")
    AVAudioFrameCount  frameLength(AVAudioFrameCount );

    @selector("stride")
    NSUInteger  stride();

    @selector("initWithPCMFormat:frameCapacity:")
    typeof(this) initWithPCMFormat(AVAudioFormat initWithPCMFormat, AVAudioFrameCount frameCapacity);

    @selector("initWithPCMFormat:bufferListNoCopy:deallocator:")
    typeof(this) initWithPCMFormat(AVAudioFormat initWithPCMFormat, const AudioBufferList* bufferListNoCopy, void function() deallocator);

}



// -------------------------------------------------------------------------------------------------



class AVAudioCompressedBuffer {
    mixin ObjcExtend! AVAudioBuffer;
    @selector("packetCapacity")
    AVAudioPacketCount  packetCapacity();

    @selector("packetCount")
    AVAudioPacketCount  packetCount();

    @selector("setPacketCount:")
    AVAudioPacketCount  packetCount(AVAudioPacketCount );

    @selector("maximumPacketSize")
    NSInteger  maximumPacketSize();

    @selector("data")
    void * data();

    @selector("packetDescriptions")
    AudioStreamPacketDescription* packetDescriptions();

    @selector("initWithFormat:packetCapacity:maximumPacketSize:")
    typeof(this) initWithFormat(AVAudioFormat * initWithFormat, AVAudioPacketCount packetCapacity, NSInteger maximumPacketSize);

    @selector("initWithFormat:packetCapacity:")
    typeof(this) initWithFormat(AVAudioFormat * initWithFormat, AVAudioPacketCount packetCapacity);

}

// -------------------------------------------------------------------------------------------------

