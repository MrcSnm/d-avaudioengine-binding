module avaudiosettings;

extern const NSString AVFormatIDKey;
extern const NSString AVSampleRateKey;
extern const NSString AVNumberOfChannelsKey;


extern const NSString AVLinearPCMBitDepthKey;
extern const NSString AVLinearPCMIsBigEndianKey;
extern const NSString AVLinearPCMIsFloatKey;

extern const NSString AVLinearPCMIsNonInterleaved;
alias AVLinearPCMIsNonInterleavedKey = AVLinearPCMIsNonInterleaved;


extern const NSString AVAudioFileTypeKey;


extern const NSString AVEncoderAudioQualityKey;
extern const NSString AVEncoderAudioQualityForVBRKey;

	
extern const NSString AVEncoderBitRateKey;
extern const NSString AVEncoderBitRatePerChannelKey;
extern const NSString AVEncoderBitRateStrategyKey;
extern const NSString AVEncoderBitDepthHintKey;


extern const NSString AVSampleRateConverterAlgorithmKey;
extern const NSString AVSampleRateConverterAudioQualityKey;


extern const NSString AVChannelLayoutKey;

extern const NSString AVAudioBitRateStrategy_Constant;
extern const NSString AVAudioBitRateStrategy_LongTermAverage;
extern const NSString AVAudioBitRateStrategy_VariableConstrained;
extern const NSString AVAudioBitRateStrategy_Variable;


extern const NSString AVSampleRateConverterAlgorithm_Normal;
extern const NSString AVSampleRateConverterAlgorithm_Mastering;
extern const NSString AVSampleRateConverterAlgorithm_MinimumPhase;

enum AVAudioQuality : NSInteger { 
	Min    = 0,
	Low    = 0x20,
	Medium = 0x40,
	High   = 0x60,
	Max    = 0x7F
}