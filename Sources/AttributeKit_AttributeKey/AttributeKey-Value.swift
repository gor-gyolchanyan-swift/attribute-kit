//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

extension AttributeKey {

    // MARK: Type: AttributeKey, Topic: Value

    @inlinable
    public var valueType: Any.Type {
        capsule.valueType
    }

    @inlinable
    public var defaultValue: Any {
        capsule.defaultValue
    }
}
