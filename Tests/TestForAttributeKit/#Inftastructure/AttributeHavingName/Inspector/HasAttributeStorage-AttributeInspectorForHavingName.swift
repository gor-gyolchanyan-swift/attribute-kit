//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

import AttributeKit

extension HasAttributeStorage {

    // MARK: HasAttributeStorage - AttributeInspectorForHavingName
    
    internal var everyAttributeHavingName: [String: AnyHashable] {
        var inspector = AttributeInspectorForHavingName()
        inspector.inspectEveryAttribute(in: self)
        return inspector.everyValueForSpecifierType
    }
}
