module avaudiotypes;
import core.stdc.stdint;
import objc.runtime;
import objc.meta;


extern(C++) final @ObjectiveC:

alias AVAudioFramePosition = int64_t;
alias AVAudioFrameCount = uint32_t;
alias AVAudioPacketCount = uint32_t;
alias AVAudioChannelCount = uint32_t;
alias AVAudioNodeCompletionHandler = void function ();
alias AVAudioNodeBus = NSUInteger;
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