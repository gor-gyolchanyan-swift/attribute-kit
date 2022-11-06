//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

extension AttributeAccessor {

    // MARK: AttributeAccessor - AttributeInspector

    /// Accesses the ``AttributeSpecifier`` set by sequentially giving them to the given ``AttributeAccessor``.
    ///
    /// - parameter inspector: The ``AttributeInspector`` that will inspect the ``AttributeSpecifier`` set.
    internal func accessByInspector(_ inspector: inout some AttributeInspector) {
        for key in everyValueForKey.keys {
            inspector.inspectAttribute(for: key.rawValue, in: self)
        }
    }
}
