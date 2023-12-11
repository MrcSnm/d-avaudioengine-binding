module avaudioformat;
import objc.meta;
import objc.runtime;
@ObjectiveC extern(C++) final:

enum AVAudioCommonFormat : NSUInteger 
{
	OtherFormat = 0,
	PCMFormatFloat32 = 1,
	PCMFormatFloat64 = 2,
	PCMFormatInt16 = 3,
	PCMFormatInt32 = 4
}


class AVAudioFormat {
    mixin ObjcExtend! NSObject;
    @selector("standard")
    BOOL  isStandard();

    @selector("commonFormat")
    AVAudioCommonFormat  commonFormat();

    @selector("channelCount")
    AVAudioChannelCount  channelCount();

    @selector("sampleRate")
    double  sampleRate();

    @selector("interleaved")
    BOOL  isInterleaved();

    @selector("channelLayout")
    AVAudioChannelLayout * channelLayout();

    @selector("initWithStreamDescription:")
    typeof(this) initWithStreamDescription(const AudioStreamBasicDescription * initWithStreamDescription);

    @selector("initWithStreamDescription:channelLayout:")
    typeof(this) initWithStreamDescription(const AudioStreamBasicDescription * initWithStreamDescription, AVAudioChannelLayout *  channelLayout = null);

    @selector("initStandardFormatWithSampleRate:channels:")
    typeof(this) initStandardFormatWithSampleRate(double initStandardFormatWithSampleRate, AVAudioChannelCount channels);

    @selector("initStandardFormatWithSampleRate:channelLayout:")
    typeof(this) initStandardFormatWithSampleRate(double initStandardFormatWithSampleRate, AVAudioChannelLayout * channelLayout);

    @selector("initWithCommonFormat:sampleRate:channels:interleaved:")
    typeof(this) initWithCommonFormat(AVAudioCommonFormat initWithCommonFormat, double sampleRate, AVAudioChannelCount channels, BOOL interleaved);

    @selector("initWithCommonFormat:sampleRate:interleaved:channelLayout:")
    typeof(this) initWithCommonFormat(AVAudioCommonFormat initWithCommonFormat, double sampleRate, BOOL interleaved, AVAudioChannelLayout * channelLayout);

    @selector("initWithSettings:")
    typeof(this) initWithSettings(NSDictionary!(NSString *, id) * initWithSettings);

    @selector("initWithCMAudioFormatDescription:")
    typeof(this) initWithCMAudioFormatDescription(CMAudioFormatDescriptionRef initWithCMAudioFormatDescription);

    @selector("isEqual:")
    BOOL isEqual(id isEqual);

}
