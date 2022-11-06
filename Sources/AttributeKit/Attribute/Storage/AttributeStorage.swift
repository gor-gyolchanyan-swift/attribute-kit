//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

/// Provides storage for an ``AttributeSpecifier/Attribute`` set.
public struct AttributeStorage {

    // MARK: AttributeStorage

    /// Creates an ``AttributeStorage`` which contains the same ``AttributeSpecifier/Attribute`` set as the one in the given ``AttributeAccessor``.
    ///
    /// - parameter accessor: The ``AttributeAccessor`` whose ``AttributeSpecifier/Attribute`` set to copy.
    /// - returns: The created ``AttributeStorageObject``.
    internal init(accessor: AttributeAccessor) {
        self.accessor = accessor
    }

    // MARK: AttributeStorage - Accessor

    /// The ``AttributeAccessor`` providing access to the ``AttributeSpecifier/Attribute`` set.
    internal var accessor: AttributeAccessor
}

extension AttributeStorage {

    // MARK: AttributeStorage

    /// Creates an empty ``AttributeStorage``.
    ///
    /// - returns: The created ``AttributeStorage``.
    public init() {
        self.init(accessor: .init())
    }

    /// Creates an ``AttributeStorage`` which contains the same ``AttributeSpecifier/Attribute`` set as the one in the given ``AttributeStorage``.
    ///
    /// - parameter storage: The ``AttributeStorage`` whose ``AttributeSpecifier/Attribute`` set to copy.
    /// - returns: The created ``AttributeStorage``.
    public init(_ storage: AttributeStorage) {
        self.init(accessor: storage.accessor)
    }

    /// Creates an ``AttributeStorage`` which contains the same ``AttributeSpecifier/Attribute`` set as the one in the given ``AttributeStorageObject``.
    ///
    /// - parameter storage: The ``AttributeStorageObject`` whose ``AttributeSpecifier/Attribute`` set to copy.
    /// - returns: The created ``AttributeStorage``.
    public init(_ storage: AttributeStorageObject) {
        self.init(accessor: storage.accessor)
    }
}
