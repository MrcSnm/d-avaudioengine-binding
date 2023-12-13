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



alias AVAudioPCMBufferDeallocator = extern(C) void function(const AudioBufferList*);

class AVAudioPCMBuffer {
    mixin ObjcExtend! AVAudioBuffer;

    @selector("frameLength")
    AVAudioFrameCount  frameLength();

    @selector("setFrameLength:")
    AVAudioFrameCount  frameLength(AVAudioFrameCount );

    @selector("initWithPCMFormat:frameCapacity:")
    typeof(this) initWithPCMFormat(AVAudioFormat initWithPCMFormat, AVAudioFrameCount frameCapacity);

    ///Creates a PCM audio buffer instance without copying samples, for PCM audio data, with a specified buffer list and a deallocator block.
    @selector("initWithPCMFormat:bufferListNoCopy:deallocator:")
    typeof(this) initWithPCMFormat(AVAudioFormat initWithPCMFormat, const AudioBufferList* bufferListNoCopy, AVAudioPCMBufferDeallocator deallocator);

    ///The buffer’s audio samples as floating point values.
    @selector("floatChannelData")
    const(float*)* floatChannelData();

    ///The buffer’s capacity, in audio sample frames.
    @selector("frameCapacity") 
    AVAudioFrameCount frameCapacity();

    ///The buffer’s 16-bit integer audio samples.
    @selector("int16ChannelData")
    const(short*)* int16ChannelData();

    ///The buffer’s 32-bit integer audio samples.
    @selector("int32ChannelData")
    const(int*)* int32ChannelData();

    ///The buffer’s number of interleaved channels.
    @selector("stride")
    NSUInteger stride();
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
    typeof(this) initWithFormat(AVAudioFormat initWithFormat, AVAudioPacketCount packetCapacity, NSInteger maximumPacketSize);

    @selector("initWithFormat:packetCapacity:")
    typeof(this) initWithFormat(AVAudioFormat initWithFormat, AVAudioPacketCount packetCapacity);

}

// -------------------------------------------------------------------------------------------------

