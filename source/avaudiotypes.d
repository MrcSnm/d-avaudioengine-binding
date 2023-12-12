module avaudiotypes;
import core.stdc.stdint;
import objc.runtime;
import objc.meta;


extern(C++) final @ObjectiveC:
/// A format specification for an audio stream.

alias AudioFormatID = uint;
alias AudioFormatFlags = uint;

struct AudioStreamBasicDescription
{
    ///An identifier specifying the general audio data format in the stream.
    AudioFormatID mFormatID;

    ///Format-specific flags to specify details of the format.
    AudioFormatFlags mFormatFlags;

    ///The number of frames per second of the data in the stream, when playing the stream at normal speed.
    double mSampleRate;

    ///The number of bits for one audio sample.
    uint mBitsPerChannel;

    ///The number of bytes from the start of one frame to the start of the next frame in an audio buffer.
    uint mBytesPerFrame;

    ///The number of channels in each frame of audio data.
    uint mChannelsPerFrame;

    ///The number of bytes in a packet of audio data.
    uint mBytesPerPacket;

    ///The number of frames in a packet of audio data.
    uint mFramesPerPacket;

    ///The amount to pad the structure to force an even 8-byte alignment.
    uint mReserved;
}

enum AudioChannelBitmap : uint
{
    ///The left channel.
    kAudioChannelBit_Left = (1U<<0),
    ///The left center channel.
    kAudioChannelBit_LeftCenter = (1U<<6),
    ///The left surround channel.
    kAudioChannelBit_LeftSurround = (1U<<4),
    ///The left surround direct channel.
    kAudioChannelBit_LeftSurroundDirect = (1U<<9),
    /// The left-top front channel.
    kAudioChannelBit_LeftTopFront = kAudioChannelBit_VerticalHeightLeft,
    ///The left-top middle channel.
    kAudioChannelBit_LeftTopMiddle = (1U<<21),
    ///The left-top rear channel.
    kAudioChannelBit_LeftTopRear = (1U<<24),
    ///The top-back left channel.
    kAudioChannelBit_TopBackLeft = (1U<<15),
    ///The vertical height left channel.
    kAudioChannelBit_VerticalHeightLeft = (1U<<12),
    ///The center channel.
    kAudioChannelBit_Center = (1U<<2),
    ///The center surround channel.
    kAudioChannelBit_CenterSurround = (1U<<8),
    ///The top-front center channel.
    kAudioChannelBit_CenterTopFront = kAudioChannelBit_VerticalHeightCenter,
    ///The top-middle center channel.
    kAudioChannelBit_CenterTopMiddle = kAudioChannelBit_TopCenterSurround,
    ///The top-right center channel.
    kAudioChannelBit_CenterTopRear = (1U<<25),
    ///The top-back center channel.
    kAudioChannelBit_TopBackCenter = (1U<<16),
    ///The top center surround channel.
    kAudioChannelBit_TopCenterSurround = (1U<<11),
    ///The vertical height center channel.
    kAudioChannelBit_VerticalHeightCenter = (1U<<13),
    ///The right channel.
    kAudioChannelBit_Right = (1U<<1),
    ///The right center channel.
    kAudioChannelBit_RightCenter = (1U<<7),
    ///The rIght surround channel.
    kAudioChannelBit_RightSurround = (1U<<5),
    ///The right surround direct channel.
    kAudioChannelBit_RightSurroundDirect = (1U<<10),
    ///The top-front front channel.
    kAudioChannelBit_RightTopFront = kAudioChannelBit_VerticalHeightRight,
    ///The top-middle right channel.,
    kAudioChannelBit_RightTopMiddle = (1U<<23),
    ///The top-rear right channel.
    kAudioChannelBit_RightTopRear = (1U<<26),
    ///The top-back right channel.
    kAudioChannelBit_TopBackRight = (1U<<17),
    ///The vertical height right channel.
    kAudioChannelBit_VerticalHeightRight = (1U<<14),
    ///The Low Frequency Effects (LFE) screen channel.
    kAudioChannelBit_LFEScreen = (1U<<3)




}

///A structure that specifies a channel layout in a file or in hardware.
struct AudioChannelLayout
{
    ///If mChannelLayoutTag is set to kAudioChannelLayoutTag_UseChannelBitmap, this field is the channel-use bitmap.
    AudioChannelBitmap mChannelBitmap;
}


///A structure that holds a buffer of audio data.
struct AudioBuffer
{
    ///The number of interleaved channels in the buffer.
    uint mNumberChannels;
    ///The number of bytes in the buffer.
    uint mDataByteSize;
    ///A pointer to a buffer of audio data.
    void* mData;
}

///A structure that stores a variable-length array of audio buffers.
struct AudioBufferList
{
    ///The number of audio buffers in the list.
    uint mNumberBuffers;
    ///A variable-length array of audio buffers.
    AudioBuffer[1] mBuffers;
}
///A value that describes a packet in a buffer of audio data.
struct AudioStreamPacketDescription
{
    ///The number of bytes in the packet.
    uint mDataByteSize;
    ///The number of bytes from the start of the buffer to the beginning of the packet.
    long mStartOffset;
    ///The number of sample frames of data in the packet.
    uint mVariableFramesInPacket;
}

///A structure that represents flags for a timestamp.
enum AudioTimeStampFlags : uint
{
    ///A flag that indicates no fields are valid.
    kAudioTimeStampNothingValid = 0,
    ///A flag that indicates that the host time is valid.
    kAudioTimeStampHostTimeValid = (1U << 1),
    ///A flag that indicates that the rate scalar is valid.
    kAudioTimeStampRateScalarValid = (1U << 2),
    ///A flag that indicates that the sample frame time and the host time are valid.
    kAudioTimeStampSampleHostTimeValid = (kAudioTimeStampSampleTimeValid | kAudioTimeStampHostTimeValid),
    ///A flag that indicates that the sample frame time is valid.
    kAudioTimeStampSampleTimeValid = (1U << 0),
    ///A flag that indicates that the SMPTE time is valid.
    kAudioTimeStampSMPTETimeValid = (1U << 4),
    ///A flag that indicates that the word clock time is valid.
    kAudioTimeStampWordClockTimeValid = (1U << 3),

}
///A structure that defines SMPTE time flags.
enum SMPTETimeFlags : uint
{
    kSMPTETimeRunning = (1U << 1),
    kSMPTETimeUnknown = 0,
    kSMPTETimeValid = (1U << 0)
}

///Constants that define SMPTE time types.
enum SMPTETimeType : uint
{
    ///23.98 video frames per second.
    kSMPTETimeType2398 = 11,
    ///24 video frames per second—standard for 16mm and 35mm film.
    kSMPTETimeType24 = 0,
    ///25 video frames per second—standard for PAL and SECAM video.
    kSMPTETimeType25 = 1,
    ///29.97 video frames per second—standard for NTSC video.
    kSMPTETimeType2997 = 4,
    ///29.97 video frames per second, with video-frame numbers adjusted to ensure that the timecode matches elapsed clock time.
    kSMPTETimeType2997Drop = 5,
    ///30 video frames per second.
    kSMPTETimeType30 = 3,
    ///30 video frames per second, with video-frame numbers adjusted to ensure that the timecode matches elapsed clock time.
    kSMPTETimeType30Drop = 2,
    ///50 video frames per second.
    kSMPTETimeType50 = 10,
    ///59.94 video frames per second.
    kSMPTETimeType5994 = 7,
    ///59.94 video frames per second, with video-frame numbers adjusted to ensure that the timecode matches elapsed clock time.
    kSMPTETimeType5994Drop = 9,
    ///60 video frames per second.
    kSMPTETimeType60 = 6,
    ///60 video frames per second, with video-frame numbers adjusted to ensure that the timecode matches elapsed clock time.
    kSMPTETimeType60Drop = 8
}

///A structure that defines an SMPTE time value.
struct SMPTETime
{
    ///The total number of messages received. It takes 8 messages to carry a full SMPTE time code.
    uint mCounter;
    ///A set of flags that indicate the SMPTE state (see SMPTE Time Flags).
    SMPTETimeFlags mFlags;
    ///The value of the frames portion of the SMPTE time.
    short mFrames;
    ///The value of the hours portion of the SMPTE time.
    short mHours;
    ///The value of the minutes portion of the SMPTE time.
    short mMinutes;
    ///The value of the seconds portion of the SMPTE time.
    short mSeconds;
    ///The number of subframes per video frame (typically 80).
    short mSubframeDivisor;
    ///A subframe offset to the HH:MM:SS:FF time. You can use this field to position a time marker somewhere within the time span represented by a video frame, if necessary.
    short mSubframes;
    ///A SMPTE time type constant indicating the kind of SMPTE time used (see SMPTE Timecode Types).
    SMPTETimeType mType;
}


///A structure that represents a timestamp value.
struct AudioTimeStamp
{
    ///A set of flags indicating which representations of the time are valid; see Audio Time Stamp Flags and Audio Time Stamp Flag Combination Constant.
    AudioTimeStampFlags mFlags;

    ///The host machine's time base (see CoreAudio/HostTime.h).
    ulong mHostTime;
    ///The ratio of actual host ticks per sample frame to the nominal host ticks per sample frame.
    double mRateScalar;
    ///Pads the structure out to force an even 8-byte alignment.
    uint mReserved;
    ///The SMPTE time (see SMPTETime).


}

version(iOS)
{
    struct OpaqueAudioComponentInstance;
    ///A component instance, or object, is an audio unit or audio codec.
    alias AudioComponentInstance = OpaqueAudioComponentInstance*;
}
else
{
    struct ComponentInstanceRecord{long[1] data;}
    alias AudioComponentInstance = ComponentInstanceRecord*;
}


///The data type for a plug-in component that provides audio processing or audio data generation.
alias AudioUnit = AudioComponentInstance;

///Identifying information for an audio component.
struct AudioComponentDescription
{
    ///A unique 4-byte code identifying the interface for the component.
    OSType componentType;
    ///A 4-byte code that you can use to indicate the purpose of a component. For example, you could use lpas or lowp as a mnemonic indication that an audio unit is a low-pass filter.
    OSType componentSubType;
    ///The unique vendor identifier, registered with Apple, for the audio component.
    OSType componentManufacturer;
    ///Set this value to zero.
    uint componentFlags = 0;
    ///Set this value to zero.
    uint componentFlagsMask = 0;
}

enum AudioComponentInstantiationOptions : uint
{
    kAudioComponentInstantiation_LoadInProcess = 2,
    kAudioComponentInstantiation_LoadOutOfProcess = 1,
    kAudioComponentInstantiation_LoadedRemotely = 1u << 31,
}




///The type that represents a block to render operation calls to get input data when in manual rendering mode.
alias AVAudioIONodeInputBlock = const AudioBufferList* function(AVAudioFrameCount inNumberOfFrames);

///Expresses time as a sample count.
alias AUEventSampleTime = long;
enum AUEventSampleTimeImmediate = cast(AUEventSampleTime)0xffffffff00000000;

///The index of a bus on an audio node.
alias AVAudioNodeBus = NSUInteger;

alias AVAudioFramePosition = int64_t;
alias AVAudioFrameCount = uint32_t;
alias AVAudioPacketCount = uint32_t;
alias AVAudioChannelCount = uint32_t;
alias AudioChannelLayoutTag = uint32_t;
alias AVAudioNodeCompletionHandler = void function ();
alias AVMusicTimeStamp = double;
struct AVAudio3DPoint {
    float x;
    float y;
    float z;
}

AVAudio3DPoint AVAudioMake3DPoint(float x, float y, float z);
alias AVAudio3DVector = AVAudio3DPoint;

AVAudio3DVector AVAudioMake3DVector(float x, float y, float z);

struct AVAudio3DVectorOrientation {
    AVAudio3DVector forward;
    AVAudio3DVector up;
}

AVAudio3DVectorOrientation AVAudioMake3DVectorOrientation(AVAudio3DVector forward, AVAudio3DVector up);
struct AVAudio3DAngularOrientation {
    float yaw;
    float pitch;
    float roll;
}


AVAudio3DAngularOrientation AVAudioMake3DAngularOrientation(float yaw, float pitch, float roll);