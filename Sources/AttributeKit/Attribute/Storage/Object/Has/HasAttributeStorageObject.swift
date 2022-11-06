//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

/// A type that contains ``AttributeStorageObject``.
@dynamicMemberLookup
public protocol HasAttributeStorageObject {

    // MARK: HasAttributeStorageObject

    /// The ``AttributeStorageObject`` contained inside this ``HasAttributeStorageObject``.
    var attributeStorageObject: AttributeStorageObject { get }
}

extension HasAttributeStorageObject {

    // MARK: HasAttributeStorageObject - DynamicMemberLookup

    /// Accesses a mutable property that is also available on ``AttributeAccessor``.
    ///
    /// - parameter memberKeyPath: The `WritableKeyPath` from ``AttributeAccessor`` to the property.
    /// - returns: The accessed property.
    public subscript<Member>(dynamicMember memberKeyPath: WritableKeyPath<AttributeAccessor, Member>) -> Member {

        _read {
            yield attributeStorageObject.accessor[keyPath: memberKeyPath]
        }

        nonmutating _modify {
            yield &attributeStorageObject.accessor[keyPath: memberKeyPath]
        }
    }

    /// Accesses a property that is also available on ``AttributeAccessor``.
    ///
    /// - parameter memberKeyPath: The `KeyPath` from ``AttributeAccessor`` to the property.
    /// - returns: The accessed property.
    public subscript<Member>(dynamicMember memberKeyPath: KeyPath<AttributeAccessor, Member>) -> Member {
        _read {
            yield attributeStorageObject.accessor[keyPath: memberKeyPath]
        }
    }
}
