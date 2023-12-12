module avaudiochannellayout;
public import avaudiotypes;

import objc.meta;
import objc.runtime;

@ObjectiveC extern(C++) final:


class AVAudioChannelLayout {
    mixin ObjcExtend! NSObject;
    @selector("layoutTag")
    AudioChannelLayoutTag  layoutTag();

    @selector("channelCount")
    AVAudioChannelCount  channelCount();

    @selector("init")
    typeof(this) init();

    @selector("initWithLayoutTag:")
    typeof(this) initWithLayoutTag(AudioChannelLayoutTag initWithLayoutTag);

    @selector("initWithLayout:")
    typeof(this) initWithLayout(const AudioChannelLayout * initWithLayout);

    @selector("isEqual:")
    BOOL isEqual(void* isEqual);

    @selector("layoutWithLayoutTag:")
    static typeof(this) layoutWithLayoutTag(AudioChannelLayoutTag layoutWithLayoutTag);

    @selector("layoutWithLayout:")
    static typeof(this) layoutWithLayout(const AudioChannelLayout * layoutWithLayout);

}