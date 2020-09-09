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
        container.register(InternalServiceType.self, tag: "dependency1") { _ in
            return InternalService(test: "stringInternal")
        }
        
        container.register(InjectableServiceType.self) { container in
            let service: InternalServiceType = container.resolve(tag: "dependency1")
            return InjectableService()
        }
        
        DICE.use(container)
        
        let dummyClass = DummyClass()
        XCTAssertNoThrow(try dummyClass.verify())
        XCTAssertNoThrow(try dummyClass.verify2())
    }
    
}

class DummyClass {
    
    @Injected var injectableService: InjectableServiceType
    @Injected("dependency1") var internalService: InternalServiceType
    
    func verify() throws -> InjectableServiceType {
        return injectableService
    }
    
    func verify2() throws -> InternalServiceType {
        return internalService
    }
    
}
