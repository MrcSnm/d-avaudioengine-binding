module avaudioenvironmentnode;

import objc.meta;
import objc.runtime;
public import avaudionode;
public import avaudiomixing;

@ObjectiveC extern(C++) final:

enum AVAudioEnvironmentDistanceAttenuationModel : NSInteger { 
    Exponential   = 1,
    Inverse       = 2,
    Linear        = 3
} 




class AVAudioEnvironmentDistanceAttenuationParameters {
    mixin ObjcExtend! NSObject;
    @selector("distanceAttenuationModel")
    AVAudioEnvironmentDistanceAttenuationModel  distanceAttenuationModel();

    @selector("setDistanceAttenuationModel:")
    AVAudioEnvironmentDistanceAttenuationModel  distanceAttenuationModel(AVAudioEnvironmentDistanceAttenuationModel );

    @selector("referenceDistance")
    float  referenceDistance();

    @selector("setReferenceDistance:")
    float  referenceDistance(float );

    @selector("maximumDistance")
    float  maximumDistance();

    @selector("setMaximumDistance:")
    float  maximumDistance(float );

    @selector("rolloffFactor")
    float  rolloffFactor();

    @selector("setRolloffFactor:")
    float  rolloffFactor(float );

    @selector("init")
    typeof(this) init();

}



class AVAudioEnvironmentReverbParameters {
    mixin ObjcExtend! NSObject;
    @selector("enable")
    BOOL  enable();

    @selector("setEnable:")
    BOOL  enable(BOOL );

    @selector("level")
    float  level();

    @selector("setLevel:")
    float  level(float );

    @selector("filterParameters")
    AVAudioUnitEQFilterParameters * filterParameters();

    @selector("init")
    typeof(this) init();

    @selector("loadFactoryReverbPreset:")
    void loadFactoryReverbPreset(AVAudioUnitReverbPreset loadFactoryReverbPreset);

}




enum AVAudioEnvironmentOutputType : NSInteger { 
    Auto                = 0,
    Headphones          = 1,
    BuiltInSpeakers     = 2,
    ExternalSpeakers    = 3
} 





class AVAudioEnvironmentNode {
    mixin ObjcExtend! AVAudioNode;
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