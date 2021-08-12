//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
//

import XCTest
import AttributeKit

internal final class MainTestCase: XCTestCase {

    // MARK: Type: MainTestCase

    // This scope is intentionally left blank.
}

extension MainTestCase {

    // MARK: Type: MainTestCase, Topic: Testing

    internal func testAttributeKey() throws {
        let attributeKey = AttributeKey(accordingTo: Comment_AttributeSchematic.self)
        XCTAssertEqual(ObjectIdentifier(attributeKey.valueType), ObjectIdentifier(String.self))
        XCTAssertEqual(Mirror(reflecting: attributeKey).children.map(\.label), [])
        XCTAssertEqual(attributeKey.description, String(reflecting: Comment_AttributeSchematic.self))
        XCTAssertEqual(attributeKey.debugDescription, "\(String(reflecting: AttributeKey.self))(accordingTo: \(String(reflecting: Comment_AttributeSchematic.self)).self)")
        XCTAssertEqual(try XCTUnwrap(attributeKey.defaultValue as? String), "")
    }

    internal func testAttribute() throws {
        var attribute = Attribute("This is a comment.", accordingTo: Comment_AttributeSchematic.self)
        XCTAssertEqual(Mirror(reflecting: attribute).children.map(\.label), ["key", "value"])
        XCTAssertEqual(attribute.key, AttributeKey(accordingTo: Comment_AttributeSchematic.self))
        XCTAssertEqual(try XCTUnwrap(attribute.value as? String), "This is a comment.")
        attribute.withMutableValue(as: String.self) {
            $0 = "This is also a comment!"
        }
        XCTAssertEqual(try XCTUnwrap(attribute.withValue(as: String.self) { $0 }), "This is also a comment!")
    }

    internal func testAttributeSet() throws {
        var attributeSet = AttributeSet()
        XCTAssertEqual(attributeSet.name, "")
        XCTAssertEqual(attributeSet.comment, "")
        attributeSet.name = "This is a name."
        XCTAssertEqual(attributeSet.name, "This is a name.")
        XCTAssertEqual(attributeSet.comment, "")
        attributeSet.comment = "This is a comment."
        XCTAssertEqual(attributeSet.name, "This is a name.")
        XCTAssertEqual(attributeSet.comment, "This is a comment.")
        XCTAssertEqual(attributeSet.keySet(forName: "name"), [AttributeKey(accordingTo: Name_AttributeSchematic.self)])
        XCTAssertEqual(attributeSet.keySet(forName: "comment"), [AttributeKey(accordingTo: Comment_AttributeSchematic.self)])
        attributeSet.delete(forKey: AttributeKey(accordingTo: Name_AttributeSchematic.self))
        XCTAssertEqual(attributeSet.keySet(forName: "name"), [])
        XCTAssertEqual(attributeSet.keySet(forName: "comment"), [AttributeKey(accordingTo: Comment_AttributeSchematic.self)])
    }
}
