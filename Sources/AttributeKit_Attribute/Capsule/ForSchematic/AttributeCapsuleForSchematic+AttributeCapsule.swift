//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import AttributeKit_AttributeKey

extension AttributeCapsuleForSchematic: AttributeCapsule {

    // MARK: Type: AttributeCapsule, Topic: Schematic

    @inlinable
    internal var key: AttributeKey {
        AttributeKey(accordingTo: Schematic.self)
    }

    // MARK: Type: AttributeCapsule, Topic: Value

    @inlinable
    internal var value: Any {
        schematicValue
    }

    @inlinable
    internal var valueDescription: String {
        String(reflecting: schematicValue)
    }

    @inlinable
    internal func withValue<Value, Success>(
        as valueType: Value.Type,
        execute routine: (Value) throws -> Success
    ) rethrows -> Success? {
        assert(valueType == Value.self, "When accessing attribute value, the specified dynamic value type must match the specified static value type.")
        guard let value = schematicValue as? Value else {
            return nil
        }
        return try routine(value)
    }

    @inlinable
    internal mutating func withMutableValue<Value, Success>(
        as valueType: Value.Type,
        execute routine: (inout Value) throws -> Success
    ) rethrows -> Success? {
        assert(valueType == Value.self, "When accessing attribute value, the specified dynamic value type must match the specified static value type.")
        guard var value = schematicValue as? Value else {
            return nil
        }
        func saveValue() -> Bool {
            guard let specificValue = value as? Schematic.Value else {
                return false
            }
            self.schematicValue = specificValue
            return true
        }
        do {
            let success = try routine(&value)
            return saveValue() ? success : nil
        } catch {
            _ = saveValue()
            throw error
        }
    }
}
