//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

extension AttributeInspector {

    // MARK: AttributeInspector - HasAttributeStorageObject

    /// Inspects every ``AttributeSpecifier`` in the given ``HasAttributeStorageObject``.
    ///
    /// - parameter attributeSet: The ``HasAttributeStorageObject`` whose ``AttributeSpecifier`` set to inspect.
    public mutating func inspectEveryAttribute(in attributeSet: some HasAttributeStorageObject) {
        attributeSet.attributeStorageObject.accessor.accessByInspector(&self)
    }
}
