//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

public protocol AttributeSchematic {

    // MARK: Type: AttributeSchematic

    associatedtype Value

    static var defaultValue: Value { get }
}
