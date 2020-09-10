//
//  DICETests.swift
//  DICETests
//
//  Created by Alexander Tereshkov on 6/28/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import XCTest
@testable import DICE

class InjectedTests: XCTestCase {
    
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

extension InjectedTests {
    
    func testInjectedServiceShouldBeInitializedAndAccessible() {
        class DummyClass {
            @Injected var fooService: FooServiceType
        }
        
        container.register(FooServiceType.self) { _ in
            return FooService()
        }
        
        let dummyClass = DummyClass()
        XCTAssertNotNil(dummyClass.fooService)
    }
    
    func testInjectedServiceWithTagShouldBeInitializedAndAccessible() {
        class DummyClass {
            @Injected("dependency1") var fooService: FooServiceType
        }
        
        container.register(FooServiceType.self, tag: "dependency1") { _ in
            return FooService()
        }
        
        let dummyClass = DummyClass()
        XCTAssertNotNil(dummyClass.fooService)
    }
    
    func testInjectedInternalServiceShouldBeInitializedAndAccessible() {
        class DummyClass {
            @Injected var fooService: FooServiceType
            @Injected("dependency1") var barService: BarServiceType
        }
        
        container.register(BarServiceType.self, tag: "dependency1") { _ in
            return BarService(test: "stringInternal")
        }
        
        container.register(FooServiceType.self) { container in
            let service: BarServiceType = container.resolve(tag: "dependency1")
            return FooService()
        }
        
        let dummyClass = DummyClass()
        XCTAssertNotNil(dummyClass.fooService)
        XCTAssertNotNil(dummyClass.barService)
    }
    
}
