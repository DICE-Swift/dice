//
//  LazyObjectTests.swift
//  DICETests
//
//  Created by nb-058-41b on 9/11/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import XCTest
@testable import DICE

class LazyObjectTests: XCTestCase {
    
}

private class Dummy: Equatable {
    let id: String = UUID().uuidString
    
    static func == (lhs: Dummy, rhs: Dummy) -> Bool {
        return lhs.id == rhs.id
    }
}

private extension LazyObjectTests {
    
    func prepareClosue(with object: Any, container: DIContainer) -> (DIContainer) -> Any {
        return { container in
            return object
        }
    }
    
}

// MARK: - Init

extension LazyObjectTests {
    
    func testPassedContainer() {
        let container = DIContainer()
        let dummy = Dummy()
        let initBlock = prepareClosue(with: dummy, container: container)
        let object = LazyObject(initBlock: initBlock, container: container)
        
        XCTAssertEqual(object.container, container)
    }
    
}

// MARK: - Resolve

extension LazyObjectTests {
    
    func testResolvedObjectShouldBeEqualToRegisteredObject() {
        let container = DIContainer()
        let dummy = Dummy()
        let initBlock = prepareClosue(with: dummy, container: container)
        let object = LazyObject(initBlock: initBlock, container: container)
        
        let dummyResolve: Dummy = object.resolve()
        
        XCTAssertEqual(dummyResolve, dummy)
    }
    
}
