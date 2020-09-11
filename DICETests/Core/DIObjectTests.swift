//
//  DIObjectTests.swift
//  DICETests
//
//  Created by Alexander Tereshkov on 9/11/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import XCTest
@testable import DICE

class DIObjectTests: XCTestCase {
    
}

private class Dummy: Equatable {
    let id: String = UUID().uuidString
    
    static func == (lhs: Dummy, rhs: Dummy) -> Bool {
        return lhs.id == rhs.id
    }
}

private func prepareLazyObject(object: Any, container: DIContainer) -> LazyObject {
    let lazy = LazyObject(initBlock: { _ in
        return object
    }, container: container)
    return lazy
}

// MARK: - Init

extension DIObjectTests {
    
    func testInitialization() {
        let container = DIContainer()
        let dummyObject = Dummy()
        let lazy = prepareLazyObject(object: dummyObject, container: container)
        let key = DependencyKey(type: Dummy.self)
        let object = DIObject(lazy: lazy, type: Dummy.self, scope: .single, key: key)
        let resolvedObject: Dummy = object.lazy.resolve()
        
        XCTAssertEqual(object.key, key)
        XCTAssertEqual(object.scope, .single)
        XCTAssertEqual(resolvedObject, dummyObject)
    }
    
}

// MARK: - Bundle

extension DIObjectTests {
    
    func testObjectBundle() {
        let container = DIContainer()
        let dummyObject = Dummy()
        let lazy = prepareLazyObject(object: dummyObject, container: container)
        let key = DependencyKey(type: Dummy.self)
        let object = DIObject(lazy: lazy, type: Dummy.self, scope: .single, key: key)
        
        XCTAssertEqual(Bundle(for: Dummy.self), object.bundle)
    }
    
}

// MARK: - Debug description

extension DIObjectTests {
    
    func testObjectDebugDescription() {
        let container = DIContainer()
        let dummyObject = Dummy()
        let lazy = prepareLazyObject(object: dummyObject, container: container)
        let key = DependencyKey(type: Dummy.self)
        let object = DIObject(lazy: lazy, type: Dummy.self, scope: .single, key: key)
        
        XCTAssertFalse(object.debugDescription.isEmpty)
    }
    
}
