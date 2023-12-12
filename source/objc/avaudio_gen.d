module objc.avaudio_gen;
import objc.meta;
import objc.runtime;

import avaudiobuffer,
    avaudiochannellayout,
    avaudioconnectionpoint,
    avaudioengine,
    avaudioenvironmentnode,
    avaudiofile,
    avaudioformat,
    avaudioionode,
    avaudiomixernode,
    avaudiomixing,
    avaudionode,
    avaudioplayer,
    avaudioplayernode,
    avaudiosequencer,
    avaudiosettings,
    avaudiosinknode,
    avaudiosourcenode,
    avaudiotime,
    avaudiotypes,
    avaudiounit,
    avaudiouniteffect,
    avaudiouniteq,
    avaudiounitreverb,
    avmusicevents;


mixin ObjcLinkModule!(avaudiobuffer);
mixin ObjcLinkModule!(avaudiochannellayout);
mixin ObjcLinkModule!(avaudioconnectionpoint);
mixin ObjcLinkModule!(avaudioengine);
mixin ObjcLinkModule!(avaudioenvironmentnode);
mixin ObjcLinkModule!(avaudiofile);
mixin ObjcLinkModule!(avaudioformat);
mixin ObjcLinkModule!(avaudioionode);
mixin ObjcLinkModule!(avaudiomixernode);
mixin ObjcLinkModule!(avaudiomixing);
mixin ObjcLinkModule!(avaudionode);
mixin ObjcLinkModule!(avaudioplayer);
mixin ObjcLinkModule!(avaudioplayernode);
mixin ObjcLinkModule!(avaudiosequencer);
mixin ObjcLinkModule!(avaudiosettings);
mixin ObjcLinkModule!(avaudiosinknode);
mixin ObjcLinkModule!(avaudiosourcenode);
mixin ObjcLinkModule!(avaudiotime);
mixin ObjcLinkModule!(avaudiotypes);
mixin ObjcLinkModule!(avaudiounit);
mixin ObjcLinkModule!(avaudiouniteffect);
mixin ObjcLinkModule!(avaudiouniteq);
mixin ObjcLinkModule!(avaudiounitreverb);
mixin ObjcLinkModule!(avmusicevents);
mixin ObjcInitSelectors!(__traits(parent, {}));
