module avaudiosequencer;
import objc.meta;
import objc.runtime;
@ObjectiveC extern(C++) final:

enum AVMusicSequenceLoadOptions : NSUInteger { 
	SMF_PreserveTracks		= 0,
	SMF_ChannelsToTracks		= (1UL << 0)
} 


struct AVBeatRange
{
	AVMusicTimeStamp start;
	AVMusicTimeStamp length;
}

AVBeatRange AVMakeBeatRange(AVMusicTimeStamp startBeat, AVMusicTimeStamp lengthInBeats);

alias AVAudioSequencerInfoDictionaryKey = NSString;

__gshared extern
{
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyAlbum;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyApproximateDurationInSeconds;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyArtist;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyChannelLayout;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyComments;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyComposer;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyCopyright;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyEncodingApplication;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyGenre;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyISRC;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyKeySignature;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyLyricist;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyNominalBitRate;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyRecordedDate;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeySourceBitDepth;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeySourceEncoder;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeySubTitle;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyTempo;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyTimeSignature;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyTitle;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyTrackNumber;
    AVAudioSequencerInfoDictionaryKey AVAudioSequencerInfoDictionaryKeyYear;
}


class AVAudioSequencer {
    mixin ObjcExtend! NSObject;
    @selector("tempoTrack")
    AVMusicTrack * tempoTrack();

    @selector("init")
    typeof(this) init();

    @selector("initWithAudioEngine:")
    typeof(this) initWithAudioEngine(AVAudioEngine * initWithAudioEngine);

    @selector("loadFromURL:options:error:")
    BOOL loadFromURL(NSURL * loadFromURL, AVMusicSequenceLoadOptions options, NSError ** error);

    @selector("loadFromData:options:error:")
    BOOL loadFromData(NSData * loadFromData, AVMusicSequenceLoadOptions options, NSError ** error);

    @selector("writeToURL:SMPTEResolution:replaceExisting:error:")
    BOOL writeToURL(NSURL * writeToURL, NSInteger SMPTEResolution, BOOL replaceExisting, NSError ** error);

    @selector("dataWithSMPTEResolution:error:")
    NSData * dataWithSMPTEResolution(NSInteger dataWithSMPTEResolution, NSError ** error);

    @selector("secondsForBeats:")
    NSTimeInterval secondsForBeats(AVMusicTimeStamp secondsForBeats);

    @selector("beatsForSeconds:")
    AVMusicTimeStamp beatsForSeconds(NSTimeInterval beatsForSeconds);

    @selector("reverseEvents")
    void reverseEvents();

    @selector("createAndAppendTrack")
    AVMusicTrack * createAndAppendTrack();

    @selector("removeTrack:")
    BOOL removeTrack(AVMusicTrack * removeTrack);

    @selector("setUserCallback:")
    void setUserCallback(AVAudioSequencerUserCallback setUserCallback = null);

    @selector("currentPositionInSeconds")
    NSTimeInterval  currentPositionInSeconds();

    @selector("setCurrentPositionInSeconds:")
    NSTimeInterval  currentPositionInSeconds(NSTimeInterval );

    @selector("currentPositionInBeats")
    NSTimeInterval  currentPositionInBeats();

    @selector("setCurrentPositionInBeats:")
    NSTimeInterval  currentPositionInBeats(NSTimeInterval );

    @selector("playing")
    BOOL  isPlaying();

    @selector("rate")
    float  rate();

    @selector("setRate:")
    float  rate(float );

    @selector("hostTimeForBeats:error:")
    UInt64 hostTimeForBeats(AVMusicTimeStamp hostTimeForBeats, NSError ** error);

    @selector("beatsForHostTime:error:")
    AVMusicTimeStamp beatsForHostTime(UInt64 beatsForHostTime, NSError ** error);

    @selector("prepareToPlay")
    void prepareToPlay();

    @selector("startAndReturnError:")
    BOOL startAndReturnError(NSError ** startAndReturnError);

    @selector("stop")
    void stop();

}



class AVMusicTrack {
    mixin ObjcExtend! NSObject;
    @selector("destinationAudioUnit")
    AVAudioUnit * destinationAudioUnit();

    @selector("setDestinationAudioUnit:")
    AVAudioUnit * destinationAudioUnit(AVAudioUnit *);

    @selector("destinationMIDIEndpoint")
    MIDIEndpointRef  destinationMIDIEndpoint();

    @selector("setDestinationMIDIEndpoint:")
    MIDIEndpointRef  destinationMIDIEndpoint(MIDIEndpointRef );

    @selector("loopRange")
    AVBeatRange  loopRange();

    @selector("setLoopRange:")
    AVBeatRange  loopRange(AVBeatRange );

    @selector("loopingEnabled")
    BOOL  isLoopingEnabled();

    @selector("setLoopingEnabled:")
    BOOL  loopingEnabled(BOOL );

    @selector("numberOfLoops")
    NSInteger  numberOfLoops();

    @selector("setNumberOfLoops:")
    NSInteger  numberOfLoops(NSInteger );

    @selector("offsetTime")
    AVMusicTimeStamp  offsetTime();

    @selector("setOffsetTime:")
    AVMusicTimeStamp  offsetTime(AVMusicTimeStamp );

    @selector("muted")
    BOOL  isMuted();

    @selector("setMuted:")
    BOOL  muted(BOOL );

    @selector("soloed")
    BOOL  isSoloed();

    @selector("setSoloed:")
    BOOL  soloed(BOOL );

    @selector("lengthInBeats")
    AVMusicTimeStamp  lengthInBeats();

    @selector("setLengthInBeats:")
    AVMusicTimeStamp  lengthInBeats(AVMusicTimeStamp );

    @selector("lengthInSeconds")
    NSTimeInterval  lengthInSeconds();

    @selector("setLengthInSeconds:")
    NSTimeInterval  lengthInSeconds(NSTimeInterval );

    @selector("timeResolution")
    NSUInteger  timeResolution();

     @selector("usesAutomatedParameters")
    BOOL  usesAutomatedParameters();

    @selector("setUsesAutomatedParameters:")
    BOOL  usesAutomatedParameters(BOOL );

    @selector("addEvent:atBeat:")
    void addEvent(AVMusicEvent * addEvent, AVMusicTimeStamp atBeat);

    @selector("moveEventsInRange:byAmount:")
    void moveEventsInRange(AVBeatRange moveEventsInRange, AVMusicTimeStamp byAmount);

    @selector("clearEventsInRange:")
    void clearEventsInRange(AVBeatRange clearEventsInRange);

    @selector("cutEventsInRange:")
    void cutEventsInRange(AVBeatRange cutEventsInRange);

    @selector("copyEventsInRange:fromTrack:insertAtBeat:")
    void copyEventsInRange(AVBeatRange copyEventsInRange, AVMusicTrack * fromTrack, AVMusicTimeStamp insertAtBeat);

    @selector("copyAndMergeEventsInRange:fromTrack:mergeAtBeat:")
    void copyAndMergeEventsInRange(AVBeatRange copyAndMergeEventsInRange, AVMusicTrack * fromTrack, AVMusicTimeStamp mergeAtBeat);

    @selector("enumerateEventsInRange:usingBlock:")
    void enumerateEventsInRange(AVBeatRange enumerateEventsInRange, AVMusicEventEnumerationBlock usingBlock);

}