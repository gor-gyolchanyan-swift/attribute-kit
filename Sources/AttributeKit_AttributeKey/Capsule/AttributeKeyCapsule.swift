//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

@usableFromInline
internal protocol AttributeKeyCapsule {

    // MARK: Type: AttributeKeyCapsule, Topic: Tag

    typealias Tag = ObjectIdentifier

    var tag: Tag { get }

    // MARK: Type: AttributeKeyCapsule, Topic: Value

    var valueType: Any.Type { get }

    var defaultValue: Any { get }

    // MARK: Type: AttributeKeyCapsule, Topic: Name

    var name: String { get }

    // MARK: Type: AttributeKeyCapsule, Topic: Schematic

    var schematicDescription: String { get }
}
