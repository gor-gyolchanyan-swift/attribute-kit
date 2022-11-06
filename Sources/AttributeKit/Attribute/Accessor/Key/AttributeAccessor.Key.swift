//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

extension AttributeAccessor {

    // MARK: AttributeAccessor - Key

    /// Serves as a key for accessing an ``AttributeSpecifier/Attribute``.
    internal struct Key: RawRepresentable {

        // MARK: RawRepresentable

        internal typealias RawValue = any AttributeSpecifier.Type

        internal init(rawValue: RawValue) {
            self.rawValue = rawValue
        }

        internal let rawValue: RawValue
    }
}
