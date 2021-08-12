//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import AttributeKit_Attribute
import AttributeKit_AttributeKey
import AttributeKit_AttributeSchematic

@frozen
public struct AttributeSet {

    // MARK: Type: AttributeSet

    @usableFromInline
    internal typealias AttributeByAttributeKey = Dictionary<AttributeKey, Attribute>

    @usableFromInline
    internal typealias AttributeKeySetByName = Dictionary<String, Set<AttributeKey>>

    @inlinable
    public init() {
        attributeByAttributeKey = [:]
        attributeKeySetByName = [:]
    }

    @usableFromInline
    internal var attributeByAttributeKey: AttributeByAttributeKey

    @usableFromInline
    internal var attributeKeySetByName: AttributeKeySetByName
}

extension AttributeSet {

    // MARK: Type: AttributeSet

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

    @inlinable
    internal subscript<Schematic>(attribute schematicType: Schematic.Type) -> Attribute
    where Schematic: AttributeSchematic {

        get {
            let attributeKey = AttributeKey(accordingTo: schematicType)
            if let attribute = attributeByAttributeKey[attributeKey] {
                return attribute
            } else {
                return Attribute(accordingTo: schematicType)
            }
        }

        set(attribute) {
            let attributeKey = AttributeKey(accordingTo: schematicType)
            assert(attribute.key == attributeKey, "When setting the attribute for an attribute schematic in an attribute set, the key of the new attribute must match the attribute key for the schematic.")
            attributeByAttributeKey[attributeKey] = attribute
            attributeKeySetByName[attributeKey.name, default: []].insert(attributeKey)
        }
    }

    @inlinable
    public func keySet(forName name: String) -> Set<AttributeKey> {
        attributeKeySetByName[name, default: []]
    }

    @inlinable
    public mutating func delete(forKey attributeKey: AttributeKey) {
        if var remainingAttributeKeySet = attributeKeySetByName[attributeKey.name] {
            remainingAttributeKeySet.remove(attributeKey)
            attributeKeySetByName[attributeKey.name] = remainingAttributeKeySet.isEmpty ? nil : remainingAttributeKeySet
        }
        attributeByAttributeKey[attributeKey] = nil
    }

    @inlinable
    public func valueByName(choosingKeyWith chooseKey: (Set<AttributeKey>) throws -> AttributeKey) rethrows -> [String: Any] {
        var valueByName: [String: Any] = [:]
        for (name, keySet) in attributeKeySetByName {
            let chosenKey: AttributeKey
            if keySet.count > 1 {
                chosenKey = try chooseKey(keySet)
            } else if keySet.count > 0 {
                chosenKey = keySet[keySet.startIndex]
            } else {
                continue
            }
            guard let attribute = attributeByAttributeKey[chosenKey] else {
                continue
            }
            valueByName[name] = attribute.value
        }
        return valueByName
    }
}
