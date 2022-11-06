//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

extension AttributeAccessor.Key: Equatable {

    // MARK: Equatable

    internal static func == (_ preceding: Self, _ following: Self) -> Bool {
        typealias ID = ObjectIdentifier
        return ID(preceding.rawValue) == ID(following.rawValue)
    }
}
