//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

extension Attribute {

    // MARK: Type: Attribute, Topic: Value

    @inlinable
    public var value: Any {
        capsule.value
    }

    @inlinable
    public func withValue<Value, Success>(as valueType: Value.Type = Value.self, execute routine: (Value) throws -> Success) rethrows -> Success? {
        try capsule.withValue(as: valueType, execute: routine)
    }

    @inlinable
    @discardableResult
    public func withValue<Value>(as valueType: Value.Type = Value.self, execute routine: (Value) throws -> Void) rethrows -> Bool {
        try withValue(as: valueType, execute: routine) != nil
    }

    @inlinable
    public mutating func withMutableValue<Value, Success>(as valueType: Value.Type = Value.self, execute routine: (inout Value) throws -> Success) rethrows -> Success? {
        try capsule.withMutableValue(as: valueType, execute: routine)
    }

    @inlinable
    public mutating func withMutableValue<Value>(as valueType: Value.Type = Value.self, execute routine: (inout Value) throws -> Void) rethrows -> Bool {
        try withMutableValue(as: valueType, execute: routine) != nil
    }
}
