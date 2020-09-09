//
//  ResolveTests.swift
//  DICETests
//
//  Created by nb-058-41b on 9/7/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import XCTest
@testable import DICE

class ResolveTests: XCTestCase {
    
    let container = DIContainer()
    
    override func setUp() {
        super.setUp()
        
        container.register(InjectableServiceType.self, tag: "s1", scope: .single) { _ in
            return InjectableService(test: "s1")
        }
        
        container.register(InjectableServiceType.self, tag: "s2", scope: .single) { _ in
            return InjectableService(test: "s2")
        }
        
        DICE.use(container)
    }
    
}

extension ResolveTests {
    
    func testResolveServiceShouldResolveInstance() {
        let service1: InjectableServiceType = container.resolve(tag: "s1")
        XCTAssertEqual(service1.test, "s1")
        
        let service2: InjectableServiceType = container.resolve(tag: "s2")
        XCTAssertEqual(service2.test, "s2")
    }
    
}
