//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

import AttributeKit

extension DisplayNameAttributeSpecifier: AttributeSpecifier {

    // MARK: AttributeSpecifier

    internal typealias Attribute = String?

    internal static func makeDefaultAttribute(for accessor: AttributeAccessor) -> String? {
        nil
    }
}
