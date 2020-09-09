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
        
        container.register(InjectableServiceType.self) { _ in
            return InjectableService()
        }.scope(.objectGraph)
        
        DICE.use(container)
    }
    
}

extension ResolveTests {
    
    func testResolveServiceShouldResolveInstance() {
        let service: InjectableServiceType = container.resolve()
        service.test()
    }
    
}
