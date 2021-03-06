//
//  ResolveTests.swift
//  DICETests
//
//  Created by Alexander Tereshkov on 9/7/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import XCTest
@testable import DICE

class ResolveTests: XCTestCase {
    
    let container = DIContainer()
    
    override func setUp() {
        super.setUp()
        
        DICE.use(container)
    }
    
    override func tearDown() {
        super.tearDown()
        
        DICE.use(DIContainer())
    }
    
}

extension ResolveTests {
    
    func testResolveServiceShouldResolveInstance() {
        container.register(FooServiceType.self, tag: "s1", scope: .single) { _ in
            return FooService(test: "s1")
        }
        
        container.register(FooServiceType.self, tag: "s2", scope: .single) { _ in
            return FooService(test: "s2")
        }
        
        let service1: FooServiceType = container.resolve(tag: "s1")
        XCTAssertEqual(service1.test, "s1")
        
        let service2: FooServiceType = container.resolve(tag: "s2")
        XCTAssertEqual(service2.test, "s2")
    }
    
}
