//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

import AttributeKit

internal final class UserAsClass: HasAttributeStorageObject {

    // MARK: HasAttributeStorageObject

    #if !canImport(ObjectiveC)
        internal let attributeStorageObject = AttributeStorageObject()
    #endif
}
