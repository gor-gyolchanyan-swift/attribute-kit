//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

import XCTest

@testable
import AttributeKit

internal final class MainTestCase: XCTestCase {
    /* This scope is intentionally left blank. */
}

extension MainTestCase {

    // MARK: MainTestCase

    internal func testMiscellany() async throws {
        var userAsStruct = UserAsStruct()
        XCTAssertEqual(userAsStruct.effectiveDisplayName, "Anonymous")
        userAsStruct.displayName = "Bob"
        XCTAssertEqual(userAsStruct.displayName, "Bob")

        let userAsClass = UserAsClass()
        XCTAssertEqual(userAsClass.effectiveDisplayName, "Anonymous")
        userAsClass.displayName = "Bill"
        XCTAssertEqual(userAsClass.displayName, "Bill")
    }
}
