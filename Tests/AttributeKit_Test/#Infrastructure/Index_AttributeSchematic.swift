//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import AttributeKit

@frozen
internal enum Index_AttributeSchematic: AttributeSchematic {

    // MARK: Type: AttributeSchematic, Topic: Value

    internal typealias Value = Int

    internal static var defaultValue: Value {
        0
    }
}

extension AttributeSet {

    // MARK: Type: AttributeSet, Topic: Comment

    internal var index: Int {

        get {
            self[Index_AttributeSchematic.self]
        }

        set(comment) {
            self[Index_AttributeSchematic.self] = comment
        }
    }
}
