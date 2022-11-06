//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

/// Provides access to an ``AttributeSpecifier/Attribute`` set using a respective ``AttributeSpecifier`` set.
public struct AttributeAccessor {

    // MARK: AttributeAccessor

    /// Creates an empty ``AttributeAccessor``.
    ///
    /// - returns: The created ``AttributeAccessor``.
    internal init() {
        self.everyValueForKey = .init()
    }

    // MARK: AttributeStorage - EveryValueForKey

    /// The type of dictionary mapping every ``AttributeAccessor/Key`` to the corresponding ``AttributeAccessor/Value``.
    internal typealias EveryValueForKey = [Key: Value]

    /// The dictionary mapping every ``AttributeAccessor/Key`` to the corresponding ``AttributeAccessor/Value``.
    internal var everyValueForKey: EveryValueForKey
}
