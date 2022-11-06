# Creating Attributes

How to create a new attribute and provide access to it.

## Overview

Each attribute is exhaustivey defined by and exclusively accessed through an **attribute specifier**.

## Defining An Attribute Specifier

An _attribute specifier_ is defined by creating a type that conforms to the ``AttributeSpecifier`` protocol.

The ``AttributeSpecifier`` protocol is a **specifier protocol**, which means that it has only static requirements and its implementation is never supposed to be instantiated.

Just like any other _specifier protocol_, the perfect implementation of the ``AttributeSpecifier`` protocol is a `case`-less `enum`: 

```swift
fileprivate enum UserDisplayNameAttributeSpecifier {
    /* This scope is intentionally left blank. */
}
```

In order to conform to the ``AttributeSpecifier`` protocol, the `enum` must declare the ``AttributeSpecifier/Attribute`` type and implement the ``AttributeSpecifier/makeDefaultAttribute(for:)`` method:

```swift
extension UserDisplayNameAttributeSpecifier: AttributeSpecifier {

    // MARK: AttributeSpecifier

    fileprivate typealias Attribute = String

    fileprivate static func makeDefaultAttribute(for accessor: AttributeAccessor) -> Attribute {
        "Anonymous"
    }
}
```

The `enum` is not supposed to be made public and its sole purpose is to help provide acess to the attribute.  

## Providing Access To The Attribute

Each attribute is accessed through an instance of ``AttributeAccessor`` using its ``AttributeAccessor/subscript(_:)`` that takes the _type object_ of a type that conforms to the ``AttributeSpecifier`` protocol and provides mutable access to the ``AttributeSpecifier/Attribute`` value. 

An attribute is made accessible by declaring an `extension` on ``AttributeAccessor`` with a property for the ``AttributeSpecifier/Attribute``:

```swift
extension AttributeAccessor {

    // MARK: AttributeAccessor - UserDisplayName

    public var userDisplayName: String {
        
        get { 
            self[UserDisplayNameAttributeSpecifier.self] 
        }
        
        set(userDisplayName) {
            self[UserDisplayNameAttributeSpecifier.self] = userDisplayName
        }
    }
}
```

The `AttributeAccessor` type cannot be created or copied. It is created internally to provide access to attributes and is not responsible for providing storage for them.
