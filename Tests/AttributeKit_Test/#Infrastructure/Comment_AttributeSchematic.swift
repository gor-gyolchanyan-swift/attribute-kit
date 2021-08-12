//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import AttributeKit

@frozen
internal enum Comment_AttributeSchematic: AttributeSchematic {

    // MARK: Type: AttributeSchematic, Topic: Value

    internal typealias Value = String

    internal static var defaultValue: Value {
        ""
    }

    // MARK: Type: AttributeSchematic, Topic: Name

    internal static var name: String? {
        "comment"
    }
}

extension AttributeSet {

    // MARK: Type: AttributeSet, Topic: Comment

    internal var comment: String {

        get {
            self[Comment_AttributeSchematic.self]
        }

        set(comment) {
            self[Comment_AttributeSchematic.self] = comment
        }
    }
}
