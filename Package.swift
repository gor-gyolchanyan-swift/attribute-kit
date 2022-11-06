// swift-tools-version:5.7

//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

import PackageDescription

let package = Package(
    name: "AttributeKit",
    products: [
        .library(
            name: "AttributeKit",
            targets: ["AttributeKit"]
        )
    ],
     targets: [
        .target(
            name: "AttributeKit"
        ),
        .testTarget(
            name: "TestForAttributeKit",
            dependencies: [
                "AttributeKit"
            ]
        )
     ]
)
