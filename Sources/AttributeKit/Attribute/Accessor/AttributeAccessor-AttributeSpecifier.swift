//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

extension AttributeAccessor {

    // MARK: AttributeAccessor - AttributeSpecifier

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
