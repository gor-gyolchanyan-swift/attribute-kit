# Inspecting Attributes

How to find out what attributes does a type have.

## Overview

Attributes of a type are inspected one at a time in a type-safe manner using an **attribute inspector**.

## Defining An Attribute Inspector

An _attribute inspector_ is defined by creating a type that conforms to the ``AttributeInspector`` protocol.

The perfect implementation of the ``AttributeInspector`` protocol is a `struct` that maintains the state of an ongoing inspection:

```swift
fileprivate struct DebugAttributeSetAttributeInspector {

    // MARK: DebugAttributeSetAttributeInspector

    fileprivate init() {
        debugAttributeSet = .init()
    }

    // MARK: DebugAttributeSetAttributeInspector - DebugAttributeSet

    fileprivate var debugAttributeSet: [String: Any]
}
```

In order to conform ``AttributeInspector`` protocol, the `struct` must implement the ``AttributeInspector/inspectAttribute(for:in:)`` method:

```swift
extension DebugAttributeSetAttributeInspector: AttributeInspector {

    // MARK: AttributeInspector

    mutating func inspectAttribute<Specifier>(for specifierType: Specifier.Type, in accessor: AttributeAccessor)
    where Specifier: AttributeSpecifier {
        debugAttributeSet[String(reflecting: specifierType)] = accessor[specifierType]
    }
}
```

## Using an Attribute Inspector

The ``AttributeAccessor`` provides the ``AttributeAccessor/accessByInspector(_:)`` method that takes a mutable ``AttributeInspector`` and calls its ``AttributeInspector/inspectAttribute(for:in:)`` method for each ``AttributeSpecifier/Attribute`` available to the ``AttributeAccessor``, passing it the respective type-safe ``AttributeSpecifier`` and a reference to itself for ``AttributeSpecifier/Attribute`` lookup purposes.

The result of the ``AttributeInspector`` is made accessible by declaring an `extension` on ``AttributeAccessor`` with a property that finalizes the state of the ongoing inspection:

```swift
extension AttributeAccessor {

    // MARK: AttributeAccessor - DebugAttributeSet

    public var debugAttributeSet: [String: Any] {
        var inspector = DebugAttributeSetAttributeInspector()
        accessByInspector(&inspector)
        return inspector.debugAttributeSet
    }
}
```

This, in turn, makes it available for every attribute-enabled type:

```swift
let user = User()
user.userDisplayName = "John Doe"
print(user.debugAttributeSet) // ["ExampleModule.UserDisplayNameAttributeSpecifier": "John Doe"]
```
