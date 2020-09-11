//
//  DIContainerStorageTests.swift
//  DICETests
//
//  Created by nb-058-41b on 9/11/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import XCTest
@testable import DICE

class DIContainerStorageTests: XCTestCase {
    
}

private class Dummy { }

private func getDIObject(_ object: Any, container: DIContainer) -> DIObject {
    let container = DIContainer()
    let lazy = LazyObject(initBlock: { _ in
        return object
    }, container: container)
    let key = DependencyKey(type: Dummy.self)
    let object = DIObject(lazy: lazy, type: Dummy.self, scope: .single, key: key)
    return object
}

// MARK: - Insert

extension DIContainerStorageTests {
    
    func testInsertedObjectShouldBeAccessibleInObjects() {
        let container = DIContainer()
        let dummyObject = Dummy()
        let object = getDIObject(dummyObject, container: container)
        let storage = DIContainerStorage()
        
        XCTAssertEqual(storage.objects.count, 0)
        
        storage.insert(object, forType: Dummy.self)
        
        XCTAssertEqual(storage.objects.count, 1)
    }
    
}

// MARK: - Subscript

extension DIContainerStorageTests {
    
    func testInsertedObjectShouldBeAccessibleBySubscript() {
        let container = DIContainer()
        let lazy = LazyObject(initBlock: { _ in
            return Dummy()
        }, container: container)
        let key = DependencyKey(type: Dummy.self)
        let object = DIObject(lazy: lazy, type: Dummy.self, scope: .single, key: key)
        
        let storage = DIContainerStorage()
        
        storage.insert(object, forType: Dummy.self)
        
        let resolvedObject = storage[key]
        
        XCTAssertEqual(resolvedObject?.key, object.key)
    }
    
}
