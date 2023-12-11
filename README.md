# d-avaudioengine-binding
Bindings for D for Apple's AVAudioEngine

This project uses the `@ObjectiveC extern(C++) final` style, which makes the project compatible with any D project.

This is part of the group of projects to D Apple Game Development:

- [Metal](https://github.com/MrcSnm/D-Metal-Binding)
- [Base Objective C Reflection]()

If you want to represent any type from Objective C in D, just write `code.ns`. `ns` will try to convert to a type representable in Objective C.


## Generating the files

The files are a mix of automatic and manual work. Unfortunately I still don't keep comments inside the properties, classes and methods, so, no comments are available right now. Any contribution to get the comments in are welcomed.
Simply execute `node AVAudioEngine.h` which will generate at source/avaudioengine.d.
