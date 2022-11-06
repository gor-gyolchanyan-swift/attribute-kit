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

    /// The dictionary mapping every ``AttributeAccessor/Key`` to the corresponding ``AttributeAccessor/Value``.
    internal var everyValueForKey: EveryValueForKey
}

extension AttributeAccessor {

    // MARK: AttributeAccessor

    /// Accesses the ``AttributeSpecifier/Attribute`` using the respective ``AttributeSpecifier``.
    ///
    /// - parameter specifierType: The ``AttributeSpecifier`` generic type specifier.
    /// - returns: The accessed ``AttributeSpecifier/Attribute``.
    public subscript<Specifier>(_ specifierType: Specifier.Type) -> Specifier.Attribute
    where Specifier: AttributeSpecifier {

        _read {
            assert(specifierType == Specifier.self, "may not use a generic type specifier parameter whose dynamic type is not the same as the static type")
            let key = Key(rawValue: Specifier.self)
            let attribute: Specifier.Attribute
            if let value = everyValueForKey[key] {
                if let maybeAttribute = value.rawValue as? Specifier.Attribute {
                    attribute = maybeAttribute
                } else {
                    assertionFailure("corrupt attribute accessor: attribute type is incompatible with attribute specifier")
                    attribute = Specifier.makeDefaultAttribute(for: self)
                }
            } else {
                attribute = Specifier.makeDefaultAttribute(for: self)
            }
            yield attribute
        }

        _modify {
            assert(specifierType == Specifier.self, "may not use a generic type specifier parameter whose dynamic type is not the same as the static type")
            let key = Key(rawValue: Specifier.self)
            var attribute = self[Specifier.self]
            defer {
                everyValueForKey[key] = .init(rawValue: attribute)
            }
            yield &attribute
        }
    }
}

extension AttributeAccessor {

    // MARK: AttributeAccessor - EveryValueForKey

    /// The type of dictionary mapping every ``AttributeAccessor/Key`` to the corresponding ``AttributeAccessor/Value``.
    internal typealias EveryValueForKey = [Key: Value]
}
