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
        
        container.register(as: InternalServiceType.self) { _ in
            return InternalService()
        }
        
        container.register(as: InjectableServiceType.self) { container in
            let service: InternalServiceType = container.resolve()
            service.test()
            Swift.print("Container: \(container.description)")
            return InjectableService()
        }
        
        DICE.use(container)
    }
    
    func testInjectedServiceShouldBeInitializedAndAccessible() {
        let dummyClass = DummyClass()
        XCTAssertNoThrow(try dummyClass.verify())
    }
    
}

class DummyClass {
    
    @Injected var injectableService: InjectableServiceType
    
    func verify() throws -> InjectableServiceType {
        return injectableService
    }
    
}