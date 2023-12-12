module avmusicevents;

public import avaudiotypes;
import objc.runtime;

@ObjectiveC extern(C++) final:


///A type you use to enumerate and remove music events, if necessary.
alias AVMusicEventEnumerationBlock = void function(AVMusicEvent event, AVMusicTimeStamp *timeStamp, BOOL *removeEvent);

class AVMusicEvent {
    mixin ObjcExtend! NSObject;
}




class AVMIDINoteEvent {
    mixin ObjcExtend! AVMusicEvent;
    @selector("channel")
    uint  channel();

    @selector("setChannel:")
    uint  channel(uint );

    @selector("key")
    uint  key();

    @selector("setKey:")
    uint  key(uint );

    @selector("velocity")
    uint  velocity();

    @selector("setVelocity:")
    uint  velocity(uint );

    @selector("duration")
    AVMusicTimeStamp  duration();

    @selector("setDuration:")
    AVMusicTimeStamp  duration(AVMusicTimeStamp );

    @selector("initWithChannel:key:velocity:duration:")
    typeof(this) initWithChannel(uint initWithChannel, uint key, uint velocity, AVMusicTimeStamp duration);

}




class AVMIDIChannelEvent {
    mixin ObjcExtend! AVMusicEvent;
    @selector("channel")
    uint  channel();

    @selector("setChannel:")
    uint  channel(uint );

}



enum AVMIDIControlChangeMessageType : NSInteger { 
	BankSelect			= 0,
	ModWheel			= 1,
	Breath				= 2,
	Foot				= 4,
	PortamentoTime		= 5,
	DataEntry			= 6,
	Volume				= 7,
	Balance				= 8,
	Pan					= 10,
	Expression			= 11,
	
	// these events have value (0-63) == off, (64-127) == on
	Sustain				= 64,
	Portamento			= 65,
	Sostenuto			= 66,
	Soft				= 67,
	LegatoPedal			= 68,
	Hold2Pedal			= 69,

	FilterResonance		= 71,
	ReleaseTime			= 72,
	AttackTime			= 73,
	Brightness			= 74,
	DecayTime			= 75,
	VibratoRate			= 76,
	VibratoDepth		= 77,
	VibratoDelay		= 78,
	
	ReverbLevel			= 91,
	ChorusLevel			= 93,
	RPN_LSB				= 100,
	RPN_MSB				= 101,
	AllSoundOff			= 120,
	ResetAllControllers	= 121,
	AllNotesOff			= 123,
	OmniModeOff			= 124,
	OmniModeOn			= 125,
	MonoModeOn			= 126,
	MonoModeOff			= 127
} 



class AVMIDIControlChangeEvent {
    mixin ObjcExtend! AVMIDIChannelEvent;
    @selector("messageType")
    AVMIDIControlChangeMessageType  messageType();

    @selector("value")
    uint  value();

    @selector("initWithChannel:messageType:value:")
    typeof(this) initWithChannel(uint initWithChannel, AVMIDIControlChangeMessageType messageType, uint value);

}




class AVMIDIPolyPressureEvent {
    mixin ObjcExtend! AVMIDIChannelEvent;
    @selector("key")
    uint  key();

    @selector("setKey:")
    uint  key(uint );

    @selector("pressure")
    uint  pressure();

    @selector("setPressure:")
    uint  pressure(uint );

    @selector("initWithChannel:key:pressure:")
    typeof(this) initWithChannel(uint initWithChannel, uint key, uint pressure);

}




class AVMIDIProgramChangeEvent {
    mixin ObjcExtend! AVMIDIChannelEvent;
    @selector("programNumber")
    uint  programNumber();

    @selector("setProgramNumber:")
    uint  programNumber(uint );

    @selector("initWithChannel:programNumber:")
    typeof(this) initWithChannel(uint initWithChannel, uint programNumber);

}




class AVMIDIChannelPressureEvent {
    mixin ObjcExtend! AVMIDIChannelEvent;
    @selector("pressure")
    uint  pressure();

    @selector("setPressure:")
    uint  pressure(uint );

    @selector("initWithChannel:pressure:")
    typeof(this) initWithChannel(uint initWithChannel, uint pressure);

}




class AVMIDIPitchBendEvent {
    mixin ObjcExtend! AVMIDIChannelEvent;
    @selector("value")
    uint  value();

    @selector("setValue:")
    uint  value(uint );

    @selector("initWithChannel:value:")
    typeof(this) initWithChannel(uint initWithChannel, uint value);

}




class AVMIDISysexEvent {
    mixin ObjcExtend! AVMusicEvent;
    @selector("sizeInBytes")
    uint  sizeInBytes();

    @selector("initWithData:")
    typeof(this) initWithData(NSData * initWithData);

}



enum AVMIDIMetaEventType : NSInteger { 
	SequenceNumber		= 0x00,
	Text					= 0x01,
	Copyright			= 0x02,
	TrackName			= 0x03,
	Instrument			= 0x04,
	Lyric				= 0x05,
	Marker				= 0x06,
	CuePoint				= 0x07,
	MidiChannel			= 0x20,
	MidiPort				= 0x21,
	EndOfTrack			= 0x2f,
	Tempo				= 0x51,
	SmpteOffset			= 0x54,
	TimeSignature		= 0x58,
	KeySignature			= 0x59,
	ProprietaryEvent		= 0x7f
} 



class AVMIDIMetaEvent {
    mixin ObjcExtend! AVMusicEvent;
    @selector("type")
    AVMIDIMetaEventType  type();

    @selector("initWithType:data:")
    typeof(this) initWithType(AVMIDIMetaEventType initWithType, NSData * data);

}




class AVMusicUserEvent {
    mixin ObjcExtend! AVMusicEvent;
    @selector("sizeInBytes")
    uint  sizeInBytes();

    @selector("initWithData:")
    typeof(this) initWithData(NSData * initWithData);

}





extern __gshared const uint  AVExtendedNoteOnEventDefaultInstrument;



class AVExtendedNoteOnEvent {
    mixin ObjcExtend! AVMusicEvent;
    @selector("midiNote")
    float  midiNote();

    @selector("setMidiNote:")
    float  midiNote(float );

    @selector("velocity")
    float  velocity();

    @selector("setVelocity:")
    float  velocity(float );

    @selector("instrumentID")
    uint  instrumentID();

    @selector("setInstrumentID:")
    uint  instrumentID(uint );

    @selector("groupID")
    uint  groupID();

    @selector("setGroupID:")
    uint  groupID(uint );

    @selector("duration")
    AVMusicTimeStamp  duration();

    @selector("setDuration:")
    AVMusicTimeStamp  duration(AVMusicTimeStamp );

    @selector("initWithMIDINote:velocity:groupID:duration:")
    typeof(this) initWithMIDINote(float initWithMIDINote, float velocity, uint groupID, AVMusicTimeStamp duration);

    @selector("initWithMIDINote:velocity:instrumentID:groupID:duration:")
    typeof(this) initWithMIDINote(float initWithMIDINote, float velocity, uint instrumentID, uint groupID, AVMusicTimeStamp duration);

}




class AVParameterEvent {
    mixin ObjcExtend! AVMusicEvent;
    @selector("parameterID")
    uint  parameterID();

    @selector("setParameterID:")
    uint  parameterID(uint );

    @selector("scope")
    uint  scope_();

    @selector("setScope:")
    uint  scope_(uint );

    @selector("element")
    uint  element();

    @selector("setElement:")
    uint  element(uint );

    @selector("value")
    float  value();

    @selector("setValue:")
    float  value(float );

    @selector("initWithParameterID:scope:element:value:")
    typeof(this) initWithParameterID(uint initWithParameterID, uint scope_, uint element, float value);

}





class AVAUPresetEvent {
    mixin ObjcExtend! AVMusicEvent;
    @selector("scope")
    uint  scope_();

    @selector("setScope:")
    uint  scope_(uint );

    @selector("element")
    uint  element();

    @selector("setElement:")
    uint  element(uint );

    @selector("presetDictionary")
    NSDictionary * presetDictionary();

    @selector("initWithScope:element:dictionary:")
    typeof(this) initWithScope(uint initWithScope, uint element, NSDictionary * dictionary);

}




class AVExtendedTempoEvent {
    mixin ObjcExtend! AVMusicEvent;
    @selector("tempo")
    double  tempo();

    @selector("setTempo:")
    double  tempo(double );

    @selector("initWithTempo:")
    typeof(this) initWithTempo(double initWithTempo);

}