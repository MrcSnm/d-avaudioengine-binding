
Convert from objective C style to D.
- Remove all the documentation code
- @interface becomes class
- @protocol becomes interface
- Change typedef ReturnType (TypeName)(Arguments) to alias TypeName = ReturnType function(Arguments)
- Change typedef NS_ENUM(EnumType, EnumName) to D style enum EnumName : EnumType. Strip from the enum members the enum prefix
- Since this is a definition file, EVERY METHOD has no block for implementation definition, they end with ;
- If a @interface or @protocol extends a class, use mixin ObjcExtend!(Type) in the class body instead of using inheritance syntax.
- Move out all of the (Type) functionName(functionArguments) to the class or interface body.
- Move all of the Objective-C selectors to just above the method definition and use @selector("$selectorName"), changing where it has $selectorName to the actual selector used by the language.
- Remove all API_AVAILABLE expressions
- Use the names before : as the parameter names for the methods
- Move all of the @property to inside the class or interface body
- If a @property has a nullable qualifier, remove it.
- If a @property is readonly, only define the getter inside the class.
- Else, also define a function which has the selector ending with :, and the method only receive a type without a parameter name as its arguments. Remember the selector for setters always starts with set and ends with a :.
- If a @property has a nonatomic qualifier, remove it.
- If a @property has a getter= expression, use the name after = for the method name.
- If a generic type is found, for example, NSArray<>, append an _ to the type name and change the <> to use !() instead, the argument inside it is the same as the one inside Objective C.


If anything falls outside the rules here defined, keep it as it is, do not try to convert to D.