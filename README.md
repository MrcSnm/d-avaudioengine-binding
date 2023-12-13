# d-avaudioengine-binding
Bindings for D for Apple's AVAudioEngine

This project uses the `@ObjectiveC extern(C++) final` style, which makes the project compatible with any D project.

This is part of the group of projects to D Apple Game Development:

- [Metal](https://github.com/MrcSnm/D-Metal-Binding)
- [Base Objective C Reflection](https://github.com/MrcSnm/D-objective-c)


# Note on Handling Objective-C Blocks (delegates)

- They were implemented by using @jacob-carlborg 's amazing clang_block, which made it compatible to use D delegates together with Objective-C blocks.
- Instead of passing D delegates, simply assign it to a variable:
```d
import objc.runtime;
auto convFn = block((AVAudioPacketCount inNumberOfPackets, AVAudioConverterInputStatus* outStatus)
{
    if(temp.frameLength > 0)
    {
        *outStatus = AVAudioConverterInputStatus._HaveData;
        return cast(AVAudioBuffer)temp;
    }
    else
    {
        *outStatus = AVAudioConverterInputStatus._NoDataNow;
        return null;
    }
});
```
- After that, you will need to pass the address of this block to your target function:
```d
converter.convertToBuffer(cast(AVAudioBuffer)buffer.avaudio, &err, &convFn);
```
- This is all that is needed

If you want to represent any type from Objective C in D, just write `code.ns`. `ns` will try to convert to a type representable in Objective C.


## Generating the files

The files are a mix of automatic and manual work. Unfortunately I still don't keep comments inside the properties, classes and methods, so, no comments are available right now. Any contribution to get the comments in are welcomed.
Simply execute `node AVAudioEngine.h` which will generate at source/avaudioengine.d.
