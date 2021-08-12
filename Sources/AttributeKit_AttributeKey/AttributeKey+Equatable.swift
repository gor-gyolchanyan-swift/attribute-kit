//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

extension AttributeKey: Equatable {

    // MARK: Type: Equatable

    @inlinable
    public static func == (_ left: Self, _ right: Self) -> Bool {
        left.tag == right.tag
    }
}
