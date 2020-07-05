//
//  DICETests.swift
//  DICETests
//
//  Created by Alexander Tereshkov on 6/28/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import XCTest
@testable import DICE

class InjectTests: XCTestCase {
    
    @Inject var injectableService: InjectableServiceType
    @Inject("injectableService2") var injectableService2: InjectableServiceType
    
    override func setUp() {
        super.setUp()
        
        Dependencies.shared.register(type: InjectableServiceType.self) { _ in
            return InjectableService()
        }
        
        Dependencies.shared.register(type: InjectableServiceType.self, with: "injectableService2") { _ in
            return InjectableService()
        }
    }
    
    func testInjectatbleServiceShouldBeAccessible() {
        injectableService.test()
    }
    
    func testInjectableServiceWithNameShouldBeAccessible() {
        injectableService2.test()
    }
    
}
