//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import AttributeKit_Attribute
import AttributeKit_AttributeKey
import AttributeKit_AttributeSchematic

@frozen
public struct AttributeSet {

    // MARK: Type: AttributeSet, Topic: Mapping

    @usableFromInline
    internal typealias Mapping = Dictionary<AttributeKey, Attribute>

    @inlinable
    internal init(mapping: Mapping) {
        self.mapping = mapping
    }

    @usableFromInline
    internal var mapping: Mapping
}

extension AttributeSet {

    // MARK: Type: AttributeSet

    @inlinable
    public init() {
        self.init(mapping: [:])
    }

    @inlinable
    public subscript<Schematic>(_ schematicType: Schematic.Type) -> Schematic.Value
    where Schematic: AttributeSchematic {

        get {
            let attribute = self[attribute: schematicType]
            guard let schematicValue = attribute.withValue(as: Schematic.Value.self, execute: { $0 }) else {
                preconditionFailure("execution has reached a routine that is not supposed to be reachable")
            }
            return schematicValue
        }

        set(schematicValue) {
            guard self[attribute: schematicType].withMutableValue(execute: { $0 = schematicValue }) else {
                preconditionFailure("execution has reached a routine that is not supposed to be reachable")
            }
        }
    }
}

extension AttributeSet {

    // MARK: Type: AttributeSet

    @inlinable
    internal subscript<Schematic>(attribute schematicType: Schematic.Type) -> Attribute
    where Schematic: AttributeSchematic {

        get {
            let attributeKey = AttributeKey(accordingTo: schematicType)
            if let attribute = mapping[attributeKey] {
                return attribute
            } else {
                return Attribute(accordingTo: schematicType)
            }
        }

        set(attribute) {
            let attributeKey = AttributeKey(accordingTo: schematicType)
            assert(attribute.key == attributeKey, "When setting the attribute for an attribute schematic in an attribute set, the key of the new attribute must match the attribute key for the schematic.")
            mapping[attributeKey] = attribute
        }
    }
}
