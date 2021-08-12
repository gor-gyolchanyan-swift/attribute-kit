//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import AttributeKit

@frozen
internal enum Name_AttributeSchematic: AttributeSchematic {

    // MARK: Type: AttributeSchematic, Topic: Value

    internal typealias Value = String

    internal static var defaultValue: String {
        ""
    }

    // MARK: Type: AttributeSchematic, Topic: Name

    internal static var name: String {
        "name"
    }
}

extension AttributeSet {

    // MARK: Type: AttributeSet, Topic: Name

    internal var name: String {

        get {
            self[Name_AttributeSchematic.self]
        }

        set(name) {
            self[Name_AttributeSchematic.self] = name
        }
    }
}
