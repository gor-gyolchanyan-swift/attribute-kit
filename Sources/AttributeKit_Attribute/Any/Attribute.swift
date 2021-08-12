//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import AttributeKit_AttributeSchematic

@frozen
public struct Attribute {

    // MARK: Type: Attribute

    @inlinable
    public init<Schematic>(_ value: Schematic.Value? = nil, accordingTo schematicType: Schematic.Type)
    where Schematic: AttributeSchematic {
        capsule = schematicType.capsule(with: value)
    }

    @usableFromInline
    internal var capsule: AttributeCapsule
}
