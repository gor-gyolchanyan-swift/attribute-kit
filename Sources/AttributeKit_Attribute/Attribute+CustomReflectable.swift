//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

extension Attribute: CustomReflectable {

    // MARK: Type: CustomReflectable

    @inlinable
    public var customMirror: Mirror {
        Mirror(
            self,
            children: [
                "key": key,
                "value": value
            ],
            displayStyle: .struct,
            ancestorRepresentation: .suppressed
        )
    }
}
