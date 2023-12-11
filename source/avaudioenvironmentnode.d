module avaudioenvironmentnode;
import avaudionode;


enum AVAudioEnvironmentDistanceAttenuationModel : NSInteger 
{
    AVAudioEnvironmentDistanceAttenuationModelExponential   = 1,
    AVAudioEnvironmentDistanceAttenuationModelInverse       = 2,
    AVAudioEnvironmentDistanceAttenuationModelLinear        = 3
}




class AVAudioEnvironmentDistanceAttenuationParameters {
    mixin ObjcExtend! NSObject;
    @selector("outputVolume")
    float  outputVolume();

    @selector("setOutputVolume:")
    float  outputVolume(float );

    @selector("nextAvailableInputBus")
    AVAudioNodeBus  nextAvailableInputBus();

    @selector("listenerPosition")
    AVAudio3DPoint  listenerPosition();

    @selector("setListenerPosition:")
    AVAudio3DPoint  listenerPosition(AVAudio3DPoint );

    @selector("listenerVectorOrientation")
    AVAudio3DVectorOrientation  listenerVectorOrientation();

    @selector("setListenerVectorOrientation:")
    AVAudio3DVectorOrientation  listenerVectorOrientation(AVAudio3DVectorOrientation );

    @selector("listenerAngularOrientation")
    AVAudio3DAngularOrientation  listenerAngularOrientation();

    @selector("setListenerAngularOrientation:")
    AVAudio3DAngularOrientation  listenerAngularOrientation(AVAudio3DAngularOrientation );

    @selector("distanceAttenuationParameters")
    AVAudioEnvironmentDistanceAttenuationParameters * distanceAttenuationParameters();

    @selector("reverbParameters")
    AVAudioEnvironmentReverbParameters * reverbParameters();

    @selector("init")
    typeof(this) init();

}

