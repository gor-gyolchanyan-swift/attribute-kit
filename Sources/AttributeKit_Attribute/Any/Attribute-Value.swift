//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

extension Attribute {

    // MARK: Type: Attribute, Topic: Value

    @inlinable
    public var value: Any {

        get {
            capsule.value
        }

        set(value) {
            capsule.value = value
        }
    }
}
