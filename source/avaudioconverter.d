module avaudioconverter;

public import avaudioformat;
public import avaudiobuffer;
import objc.runtime;

@ObjectiveC extern(C++) final:


enum AVAudioConverterPrimeMethod : NSInteger { 
	/// Primes with leading + trailing input frames.
    _Pre       = 0,
    
    /// Only primes with trailing (zero latency). Leading frames are assumed to be silence.
    _Normal    = 1,
    
    /// Acts in "latency" mode. Both leading and trailing frames assumed to be silence.
    _None      = 2
} 


struct AVAudioConverterPrimeInfo
{
    AVAudioFrameCount      leadingFrames;
    AVAudioFrameCount      trailingFrames;
}



enum AVAudioConverterInputStatus : NSInteger { 
	/// This is the normal case where you supply data to the converter.
	_HaveData    = 0,
	
	/// If you are out of data for now, set *ioNumberOfPackets = 0 and return
	/// _NoDataNow; it is possible that some of the supplied input data
	/// may not be converted to output immediately, but instead may be converted to output only
	/// if/when more input is provided or the end-of-stream is indicated with the
	/// _EndOfStream status code.
	_NoDataNow   = 1,
	
	/// If you are at the end of stream, set *ioNumberOfPackets = 0 and return
	/// _EndOfStream.
	_EndOfStream = 2
} 


enum AVAudioConverterOutputStatus : NSInteger { 
	/// All of the requested data was returned.
	_HaveData          = 0,
	
	/// Not enough input was available to satisfy the request at the current time. The output buffer
	/// contains as much as could be converted.
	_InputRanDry       = 1,
	
	/// The end of stream has been reached. No data was returned.
	_EndOfStream       = 2,
	
	/// An error occurred.
	_Error             = 3
} 




alias AVAudioConverterInputBlock_ = AVAudioBuffer function(AVAudioPacketCount inNumberOfPackets, AVAudioConverterInputStatus* outStatus);
alias AVAudioConverterInputBlock = Block!(AVAudioBuffer, AVAudioPacketCount, AVAudioConverterInputStatus*)*;



class AVAudioConverter {
    @nogc nothrow:
    mixin ObjcExtend! NSObject;
    @selector("inputFormat")
    AVAudioFormat inputFormat();

    @selector("outputFormat")
    AVAudioFormat outputFormat();

    @selector("magicCookie")
    NSData magicCookie();

    @selector("setMagicCookie:")
    NSData magicCookie(NSData);

    @selector("downmix")
    BOOL  downmix();

    @selector("setDownmix:")
    BOOL  downmix(BOOL );

    @selector("dither")
    BOOL  dither();

    @selector("setDither:")
    BOOL  dither(BOOL );

    @selector("sampleRateConverterQuality")
    NSInteger  sampleRateConverterQuality();

    @selector("setSampleRateConverterQuality:")
    NSInteger  sampleRateConverterQuality(NSInteger );

    @selector("sampleRateConverterAlgorithm")
    NSString sampleRateConverterAlgorithm();

    @selector("setSampleRateConverterAlgorithm:")
    NSString sampleRateConverterAlgorithm(NSString);

    @selector("primeMethod")
    AVAudioConverterPrimeMethod  primeMethod();

    @selector("setPrimeMethod:")
    AVAudioConverterPrimeMethod  primeMethod(AVAudioConverterPrimeMethod );

    @selector("primeInfo")
    AVAudioConverterPrimeInfo  primeInfo();

    @selector("setPrimeInfo:")
    AVAudioConverterPrimeInfo  primeInfo(AVAudioConverterPrimeInfo );

    @selector("initFromFormat:toFormat:")
    typeof(this) initFromFormat(AVAudioFormat initFromFormat, AVAudioFormat toFormat);

    @selector("reset")
    void reset();


    ///Performs a basic conversion between audio formats that doesn’t involve converting codecs or sample rates.
    @selector("convertToBuffer:fromBuffer:error:")
    BOOL convertToBuffer(AVAudioPCMBuffer convertToBuffer, const AVAudioPCMBuffer fromBuffer, NSError* error);

    /** 
    * Performs a conversion between audio formats, if the system supports it.
    * Look at AVAudioConverterInputBlock_ for more reference in the type.
    */
    @selector("convertToBuffer:error:withInputFromBlock:")
    AVAudioConverterOutputStatus convertToBuffer(AVAudioBuffer convertToBuffer, NSError* error, AVAudioConverterInputBlock withInputFromBlock);

    @selector("bitRate")
    NSInteger  bitRate();

    @selector("setBitRate:")
    NSInteger  bitRate(NSInteger );

    @selector("bitRateStrategy")
    NSString bitRateStrategy();

    @selector("setBitRateStrategy:")
    NSString bitRateStrategy(NSString);

    @selector("maximumOutputPacketSize")
    NSInteger  maximumOutputPacketSize();

}