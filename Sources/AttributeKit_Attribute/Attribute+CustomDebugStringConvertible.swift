//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

extension Attribute: CustomDebugStringConvertible {

    // MARK: Type: CustomDebugStringConvertible

    @inlinable
    public var debugDescription: String {
        "\(String(reflecting: Self.self))(\(capsule.valueDescription), accordingTo: \(key.description).self)"
    }
}
