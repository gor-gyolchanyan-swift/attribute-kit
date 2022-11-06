//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

/// A type that serves as a specification for an attribute.
public protocol AttributeSpecifier {

    // MARK: AttributeSpecifier

    /// The type of the attribute specifed by this ``AttributeSpecifier``.
    associatedtype Attribute

    /// Creates a default ``Attribute`` for the given ``AttributeStorage``.
    ///
    /// - parameter accessor: The ``AttributeAccessor`` to create the ``Attribute`` for.
    /// - returns: The created ``Attribute``.
    static func makeDefaultAttribute(for accessor: AttributeAccessor) -> Attribute
}
