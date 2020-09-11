//
//  DIContainerTests.swift
//  DICETests
//
//  Created by nb-058-41b on 9/11/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import XCTest
@testable import DICE

class DIContainerTests: XCTestCase {
    
}

private class Dummy: Equatable {
    let id: String = UUID().uuidString
    
    static func == (lhs: Dummy, rhs: Dummy) -> Bool {
        return lhs.id == rhs.id
    }
}

private func getDIObject(_ object: Any, container: DIContainer) -> DIObject {
    let container = DIContainer()
    let lazy = LazyObject(initBlock: { _ in
        return object
    }, container: container)
    let key = DependencyKey(type: Dummy.self)
    let object = DIObject(lazy: lazy, type: Dummy.self, scope: .single, key: key)
    return object
}

// MARK: - Description

extension DIContainerTests {
    
    func testInsertedObjectShouldBeAccessibleInObjects() {
        let container = DIContainer()
        XCTAssertFalse(container.description.isEmpty)
    }
    
}

// MARK: - Resolve

extension DIContainerTests {
    
    func testResolveSingletonObject() {
        let container = DIContainer()
        let dummyObject = Dummy()
        
        container.register(scope: .single) { _ in
            return dummyObject
        }
        
        let resolvedObject: Dummy = container.resolve()
        
        XCTAssertEqual(resolvedObject, dummyObject)
    }
    
    func testResolveWeakObject() {
        let container = DIContainer()
        let dummyObject = Dummy()
        
        container.register(scope: .weak) { _ in
            return dummyObject
        }
        
        let resolvedObject: Dummy = container.resolve()
        
        XCTAssertEqual(resolvedObject, dummyObject)
    }
    
    func testPrototypeWeakObject() {
        let container = DIContainer()
        let dummyObject = Dummy()
        
        container.register(scope: .prototype) { _ in
            return dummyObject
        }
        
        let resolvedObject: Dummy = container.resolve()
        
        XCTAssertEqual(resolvedObject, dummyObject)
    }
    
    func testObjectGraphWeakObject() {
        let container = DIContainer()
        let dummyObject = Dummy()
        
        container.register(scope: .objectGraph) { _ in
            return dummyObject
        }
        
        let resolvedObject: Dummy = container.resolve()
        
        XCTAssertEqual(resolvedObject, dummyObject)
    }
    
}

