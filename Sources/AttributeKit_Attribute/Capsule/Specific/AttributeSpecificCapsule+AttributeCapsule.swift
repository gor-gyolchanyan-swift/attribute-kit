//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import AttributeKit_AttributeKey

extension AttributeSpecificCapsule: AttributeCapsule {

    // MARK: Type: AttributeCapsule, Topic: Schematic

    @inlinable
    internal var key: AttributeKey {
        AttributeKey(accordingTo: Schematic.self)
    }

    // MARK: Type: AttributeCapsule, Topic: Value

    @inlinable
    internal var valueDescription: String {
        String(reflecting: specificValue)
    }

    @inlinable
    internal func withValue<Value, Success>(execute routine: (Value) throws -> Success) rethrows -> Success? {
        guard Value.self == Schematic.Value.self else {
            return nil
        }
        let value = specificValue as! Value
        return try routine(value)
    }

    @inlinable
    internal mutating func withMutableValue<Value, Success>(execute routine: (inout Value) throws -> Success) rethrows -> Success? {
        guard Value.self == Schematic.Value.self else {
            return nil
        }
        var value = specificValue as! Value
        defer {
            specificValue = value as! Schematic.Value
        }
        return try routine(&value)
    }
}
