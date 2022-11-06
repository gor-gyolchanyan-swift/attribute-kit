//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

extension AttributeInspector {

    // MARK: AttributeInspector - HasAttributeStorage

    /// Inspects every ``AttributeSpecifier`` in the given ``HasAttributeStorage``.
    ///
    /// - parameter attributeSet: The ``HasAttributeStorage`` whose ``AttributeSpecifier`` set to inspect.
    public mutating func inspectEveryAttribute(in attributeSet: some HasAttributeStorage) {
        attributeSet.attributeStorage.accessor.accessByInspector(&self)
    }
}
