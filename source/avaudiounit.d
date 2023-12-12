module avaudiounit;
import objc.runtime;
import objc.meta;
public import avaudionode;
public import avaudiotypes;

@ObjectiveC extern(C++) final:


class AVAudioUnit {
    mixin ObjcExtend! AVAudioNode;
    @selector("audioComponentDescription")
    AudioComponentDescription  audioComponentDescription();

    @selector("audioUnit")
    AudioUnit audioUnit();

    @selector("name")
    NSString name();

    @selector("manufacturerName")
    NSString manufacturerName();

    @selector("version")
    NSUInteger  version_();

    @selector("instantiateWithComponentDescription:options:completionHandler:")
    static void instantiateWithComponentDescription(AudioComponentDescription instantiateWithComponentDescription, AudioComponentInstantiationOptions options, void function() completionHandler);

    @selector("loadAudioUnitPresetAtURL:error:")
    BOOL loadAudioUnitPresetAtURL(NSURL loadAudioUnitPresetAtURL, NSError* error);

}