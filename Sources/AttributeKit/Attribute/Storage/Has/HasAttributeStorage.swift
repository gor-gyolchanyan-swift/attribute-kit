//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

/// A type that has an ``AttributeStorage``.
@dynamicMemberLookup
public protocol HasAttributeStorage {

    // MARK: HasAttributeStorage

    /// The ``AttributeStorage`` of this ``HasAttributeStorage``.
    var attributeStorage: AttributeStorage { get set }
}

extension HasAttributeStorage {

    // MARK: HasAttributeStorage - DynamicMemberLookup

    /// Accesses a mutable property that is also available on ``AttributeAccessor``.
    ///
    /// - parameter memberKeyPath: The `WritableKeyPath` from ``AttributeAccessor`` to the property.
    /// - returns: The accessed property.
    public subscript<Member>(dynamicMember memberKeyPath: WritableKeyPath<AttributeAccessor, Member>) -> Member {

        _read {
            yield attributeStorage.accessor[keyPath: memberKeyPath]
        }

        _modify {
            yield &attributeStorage.accessor[keyPath: memberKeyPath]
        }
    }

    /// Accesses a property that is also available on ``AttributeAccessor``.
    ///
    /// - parameter memberKeyPath: The `KeyPath` from ``AttributeAccessor`` to the property.
    /// - returns: The accessed property.
    public subscript<Member>(dynamicMember memberKeyPath: KeyPath<AttributeAccessor, Member>) -> Member {
        _read {
            yield attributeStorage.accessor[keyPath: memberKeyPath]
        }
    }
}
