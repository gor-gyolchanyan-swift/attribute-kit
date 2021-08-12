//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import AttributeKit_AttributeSchematic

@frozen
@usableFromInline
internal struct AttributeCapsuleForSchematic<Schematic>
where Schematic: AttributeSchematic {

    // MARK: Type: AttributeCapsuleForSchematic

    @inlinable
    internal init(_ schematicValue: Schematic.Value?) {
        self.schematicValue = schematicValue ?? Schematic.defaultValue
    }

    @usableFromInline
    internal var schematicValue: Schematic.Value
}
