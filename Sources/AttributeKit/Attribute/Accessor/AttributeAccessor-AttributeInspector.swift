//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

extension AttributeAccessor {

    // MARK: AttributeAccessor - AttributeInspector

    /// Accesses the ``AttributeSpecifier`` set by sequentially providing each ``AttributeSpecifier`` to the given ``AttributeInspector``.
    ///
    /// - parameter inspector: The ``AttributeInspector`` that will inspect each ``AttributeSpecifier`` in the ``AttributeSpecifier`` set.
    public func accessByInspector(_ inspector: inout some AttributeInspector) {
        for key in everyValueForKey.keys {
            inspector.inspectAttribute(for: key.rawValue, in: self)
        }
    }
}
