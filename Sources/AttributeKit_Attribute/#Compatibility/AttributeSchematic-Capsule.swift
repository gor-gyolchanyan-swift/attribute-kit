//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import AttributeKit_AttributeSchematic

extension AttributeSchematic {

    // MARK: Type: AttributeSchematic, Topic: Capsule

    @inlinable
    internal static func capsule(with value: Value? = nil) -> AttributeCapsule {
        AttributeCapsuleForSchematic<Self>(value)
    }
}
