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
        specificValue
    }

    @inlinable
    internal var valueDescription: String {
        String(reflecting: specificValue)
    }
}
