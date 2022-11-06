//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

extension AttributeAccessor.Key: Hashable {

    // MARK: Hashable

    internal func hash(into hasher: inout Hasher) {
        typealias ID = ObjectIdentifier
        hasher.combine(ID(rawValue))
    }
}
