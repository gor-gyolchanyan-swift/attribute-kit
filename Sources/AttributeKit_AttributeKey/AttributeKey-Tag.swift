//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

extension AttributeKey {

    // MARK: Type: AttributeKey, Topic: Tag

    @usableFromInline
    internal typealias Tag = AttributeKeyCapsule.Tag

    @inlinable
    internal var tag: Tag {
        capsule.tag
    }
}
