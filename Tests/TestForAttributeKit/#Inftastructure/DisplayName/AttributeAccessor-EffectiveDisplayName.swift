//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

import AttributeKit

extension AttributeAccessor {

    // MARK: AttributeAccessor - EffectiveDisplayName

    internal var effectiveDisplayName: String {
        displayName ?? "Anonymous"
    }
}
