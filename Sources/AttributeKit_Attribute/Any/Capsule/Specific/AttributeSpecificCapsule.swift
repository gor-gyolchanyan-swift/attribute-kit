//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import AttributeKit_AttributeSchematic

@frozen
@usableFromInline
internal struct AttributeSpecificCapsule<Schematic>
where Schematic: AttributeSchematic {

    // MARK: Type: AttributeSpecificCapsule

    @inlinable
    internal init(_ value: Schematic.Value? = nil) {
        specificValue = value ?? Schematic.defaultValue
    }

    @usableFromInline
    internal var specificValue: Schematic.Value
}
