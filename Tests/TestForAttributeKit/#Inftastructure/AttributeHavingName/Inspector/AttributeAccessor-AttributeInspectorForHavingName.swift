//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

import AttributeKit

extension AttributeAccessor {

    // MARK: AttributeAccessor - AttributeInspectorForHavingName
    
    internal var everyAttributeHavingName: [String: AnyHashable] {
        var inspector = AttributeInspectorForHavingName()
        accessByInspector(&inspector)
        return inspector.everyValueForSpecifierType
    }
}
