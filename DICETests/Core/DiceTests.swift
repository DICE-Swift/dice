//
//  DiceTests.swift
//  DICETests
//
//  Created by Alexander Tereshkov on 9/10/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import XCTest
@testable import DICE

class DiceTests: XCTestCase {
    
    override func tearDown() {
        super.tearDown()
        
        DICE.use(DIContainer())
    }
    
}

extension InjectedTests {
    
    func testWhenContainerIsPassedItShouldBeUsedAsSharedContainer() {
        let container = DIContainer()
        
        DICE.use(container)
        
        XCTAssertEqual(DICE.sharedContainer, container)
    }
    
}
