//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import AttributeKit_AttributeKey

@usableFromInline
internal protocol AttributeCapsule {

    // MARK: Type: AttributeCapsule, Topic: Key

    var key: AttributeKey { get }

    // MARK: Type: AttributeCapsule, Topic: Value

    var value: Any { get }

    var valueDescription: String { get }
}
