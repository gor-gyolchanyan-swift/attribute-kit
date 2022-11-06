//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

/// A type that can inspect an ``AttributeSpecifier/Attribute`` set one at a time in a type-safe manner.
public protocol AttributeInspector {

    // MARK: AttributeInspector

    /// Inspects the given ``AttributeSpecifier`` in the given ``AttributeAccessor``.
    ///
    /// - parameter specifierType: The ``AttributeSpecifier`` to inspect.
    /// - parameter accessor: The ``AttributeAccessor`` that the ``AttributeSpecifier`` is in.
    mutating func inspectAttribute<Specifier>(for specifierType: Specifier.Type, in accessor: AttributeAccessor)
    where Specifier: AttributeSpecifier
}
