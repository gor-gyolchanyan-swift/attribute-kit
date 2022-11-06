//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE.txt` file in the root directory of the repository this file is in.
//

#if canImport(ObjectiveC)
    import func ObjectiveC.objc_getAssociatedObject
    import func ObjectiveC.objc_setAssociatedObject

    extension HasAttributeStorageObject
    where Self: AnyObject {

        // MARK: HasAttributeStorage

        public var attributeStorageObject: AttributeStorageObject {
            let attributeStorageObject: AttributeStorageObject
            let mustSaveAttributeStorageObject: Bool

            if let associationValue = ObjectiveC.objc_getAssociatedObject(self, associationKeyForAttributeStorageObject) {
                if let maybeAttributeStorageObject = associationValue as? AttributeStorageObject {
                    attributeStorageObject = maybeAttributeStorageObject
                    mustSaveAttributeStorageObject = false
                } else {
                    assertionFailure("corrupt attribute storage object: attribute storage object has incompatible type")
                    attributeStorageObject = .init()
                    mustSaveAttributeStorageObject = true
                }
            } else {
                attributeStorageObject = .init()
                mustSaveAttributeStorageObject = true
            }

            if mustSaveAttributeStorageObject {
                ObjectiveC.objc_setAssociatedObject(
                    self,
                    associationKeyForAttributeStorageObject,
                    attributeStorageObject,
                    .OBJC_ASSOCIATION_RETAIN
                )
            }

            return attributeStorageObject
        }
    }

    /// The Objective-C association key for ``HasAttributeStorageObject/attributeStorageObject-8fv47``.
    fileprivate var associationKeyForAttributeStorageObject: UnsafeMutableRawPointer = .init(&associationKeyForAttributeStorageObject)
#endif
