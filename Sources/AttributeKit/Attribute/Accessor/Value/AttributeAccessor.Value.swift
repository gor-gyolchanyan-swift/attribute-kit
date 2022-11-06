//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

extension AttributeAccessor {

    // MARK: AttributeAccessor - Value

    /// Serves as an ``AttributeSpecifier/Attribute`` with an unknown ``AttributeSpecifier``.
    internal struct Value: RawRepresentable {

        // MARK: RawRepresentable

        internal typealias RawValue = Any

        internal init(rawValue: RawValue) {
            self.rawValue = rawValue
        }

        internal let rawValue: RawValue
    }
}
