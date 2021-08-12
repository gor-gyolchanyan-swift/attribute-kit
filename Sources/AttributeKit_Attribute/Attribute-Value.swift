//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

extension Attribute {

    // MARK: Type: Attribute, Topic: Value

    @inlinable
    public func withValue<Value, Success>(execute routine: (Value) throws -> Success) rethrows -> Success? {
        try capsule.withValue(execute: routine)
    }

    @inlinable
    public mutating func withMutableValue<Value, Success>(execute routine: (inout Value) throws -> Success) rethrows -> Success? {
        try capsule.withMutableValue(execute: routine)
    }
}
