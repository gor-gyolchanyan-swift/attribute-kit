// swift-tools-version:5.4

//
// Introductory information can be found in the `README.md` file located at the root of the repository that contains this file.
// Licensing information can be found in the `LICENSE` file located at the root of the repository that contains this file.
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
            name: "AttributeKit",
            dependencies: [
                "AttributeKit_AttributeKey",
                "AttributeKit_AttributeSchematic"
            ]
        ),
        .target(
            name: "AttributeKit_AttributeKey",
            dependencies: [
                "AttributeKit_AttributeSchematic"
            ]
        ),
        .target(
            name: "AttributeKit_AttributeSchematic"
        )
     ]
)
