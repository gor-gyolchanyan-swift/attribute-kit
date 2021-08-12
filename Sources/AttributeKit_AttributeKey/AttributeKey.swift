//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import AttributeKit_AttributeSchematic

@frozen
public struct AttributeKey {

    // MARK: Type: AttributeKey

    @inlinable
    public init<Schematic>(accordingTo schematicType: Schematic.Type)
    where Schematic: AttributeSchematic {
        self.capsule = schematicType.capsule
    }

    @usableFromInline
    internal let capsule: AttributeKeyCapsule
}
