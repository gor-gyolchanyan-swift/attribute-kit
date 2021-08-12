//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

extension AttributeKeyCapsuleForSchematic: AttributeKeyCapsule {

    // MARK: Type: AttributeKeyCapsule, Topic: Tag

    @inlinable
    internal var tag: Tag {
        Tag(Schematic.self)
    }

    // MARK: Type: AttributeKeyCapsule, Topic: Value

    @inlinable
    internal var valueType: Any.Type {
        Schematic.Value.self
    }

    @inlinable
    internal var defaultValue: Any {
        Schematic.defaultValue
    }

    // MARK: Type: AttributeKeyCapsule, Topic: Name

    @inlinable
    internal var name: String {
        Schematic.name
    }

    // MARK: Type: AttributeKeyCapsule, Topic: Schematic

    @inlinable
    internal var schematicDescription: String {
        String(reflecting: Schematic.self)
    }
}
