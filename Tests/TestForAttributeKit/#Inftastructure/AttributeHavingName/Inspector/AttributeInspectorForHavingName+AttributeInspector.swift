//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

import AttributeKit

extension AttributeInspectorForHavingName: AttributeInspector {

    // MARK: AttributeInspector

    internal mutating func inspectAttribute<Specifier>(for specifierType: Specifier.Type, in accessor: AttributeAccessor) where Specifier : AttributeSpecifier {
        if let specifierType = specifierType as? any AttributeSpecifierHavingName.Type, let attribute = accessor[specifierType] as? AnyHashable {
            everyValueForSpecifierType[specifierType.attributeName] = attribute
        }
    }
}
