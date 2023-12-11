module avaudiosettings;
import objc.runtime;
import objc.meta;
import objc.runtime;
@ObjectiveC extern(C++) final:

alias AVLinearPCMIsNonInterleavedKey = AVLinearPCMIsNonInterleaved;

extern(C) __gshared extern const
{
	NSString AVFormatIDKey;
	NSString AVSampleRateKey;
	NSString AVNumberOfChannelsKey;
	NSString AVLinearPCMBitDepthKey;
	NSString AVLinearPCMIsBigEndianKey;
	NSString AVLinearPCMIsFloatKey;
	NSString AVLinearPCMIsNonInterleaved;
	NSString AVAudioFileTypeKey;
	NSString AVEncoderAudioQualityKey;
	NSString AVEncoderAudioQualityForVBRKey;
	NSString AVEncoderBitRateKey;
	NSString AVEncoderBitRatePerChannelKey;
	NSString AVEncoderBitRateStrategyKey;
	NSString AVEncoderBitDepthHintKey;
	NSString AVSampleRateConverterAlgorithmKey;
	NSString AVSampleRateConverterAudioQualityKey;
	NSString AVChannelLayoutKey;
	NSString AVAudioBitRateStrategy_Constant;
	NSString AVAudioBitRateStrategy_LongTermAverage;
	NSString AVAudioBitRateStrategy_VariableConstrained;
	NSString AVAudioBitRateStrategy_Variable;
	NSString AVSampleRateConverterAlgorithm_Normal;
	NSString AVSampleRateConverterAlgorithm_Mastering;
	NSString AVSampleRateConverterAlgorithm_MinimumPhase;
}

enum AVAudioQuality : NSInteger { 
	Min    = 0,
	Low    = 0x20,
	Medium = 0x40,
	High   = 0x60,
	Max    = 0x7F
}