//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

extension AttributeKey: CustomStringConvertible {

    // MARK: Type: CustomStringConvertible

    @inlinable
    public var description: String {
        capsule.schematicDescription
    }
}
