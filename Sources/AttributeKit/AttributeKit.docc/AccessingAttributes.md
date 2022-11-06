# Accessing Attributes

How to give the power of attributes to a type.

## Overview

Attributes are available for a type when it provides storage for them. 

## Storage For Attributes

Attribute storage comes in two variants:
 
- ``AttributeStorage``: A value type that provides storage for attributes that is not shared between copies.
- ``AttributeStorageObject``: A reference type that provides storage for attributes that is shared between copies.

These types cannot be used directly and can only be created and copied. They are used internally for providing access to attributes.

## Providing Storage For Attributes

In order to provide storage for attributes, a type must conform to one of the two protocols:
- ``HasAttributeStorage``: Indicates that the type provides storage for attributes using the ``AttributeStorage`` type by exposing the ``HasAttributeStorage/attributeStorage`` mutable property.
- ``HasAttributeStorageObject``: Indicates that the type provides shared storage for attributes using the ``AttributeStorageObject`` type exposing the ``HasAttributeStorageObject/attributeStorageObject-8fv47`` property. 

In an environment where the Objective-C runtime is available, the implementation of the ``HasAttributeStorageObject`` protocol is provided automatically for conforming types:

```swift
public final class User: HasAttributeStorageObject {
    /* This scope is intentionally left blank. */
}
```

## Accessing Attributes

Any type that conforms to either the ``HasAttributeStorage`` protocol or the ``HasAttributeStorageObject`` protocol will automatically gain access to every attribute made available by declaring an `extension` on ``AttributeAccessor`` with a property for the ``AttributeSpecifier/Attribute``.  

This is done using `@dynamicMemberLookup` through key paths on ``AttributeAccessor``:

```swift
let user = User()
user.userDisplayName = "John Doe"
```
