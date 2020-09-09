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
    
    override func tearDown() {
        super.tearDown()
        
        DICE.use(DIContainer())
    }
    
}

extension InjectedTests {
    
    func testInjectedServiceShouldBeInitializedAndAccessible() {
        container.register(BarServiceType.self, tag: "dependency1") { _ in
            return BarService(test: "stringInternal")
        }
        
        container.register(FooServiceType.self) { container in
            let service: BarServiceType = container.resolve(tag: "dependency1")
            return FooService()
        }
        
        DICE.use(container)
        
        let dummyClass = DummyClass()
        XCTAssertNotNil(dummyClass.fooService)
        XCTAssertNotNil(dummyClass.barService)
    }
    
}

class DummyClass {
    @Injected var fooService: FooServiceType
    @Injected("dependency1") var barService: BarServiceType
}
