//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import AttributeKit_AttributeKey

extension AttributeSpecificCapsule: AttributeCapsule {

    // MARK: Type: AttributeCapsule, Topic: Schematic

    @inlinable
    internal var key: AttributeKey {
        AttributeKey(accordingTo: Schematic.self)
    }

    // MARK: Type: AttributeCapsule, Topic: Value

    @inlinable
    internal var value: Any {

        get {
            specificValue
        }

        set(value) {
            guard let specificValue = value as? Schematic.Value else {
                preconditionFailure("Caught an attempt to set the value of an attribute whose value type is `\(String(reflecting: Schematic.Value.self))` to an instance of `\(String(reflecting: type(of: value)))`.")
            }
            self.specificValue = specificValue
        }
    }

    @inlinable
    internal var valueDescription: String {
        String(reflecting: specificValue)
    }
}
