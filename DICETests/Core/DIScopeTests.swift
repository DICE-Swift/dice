//
//  DIScopeTests.swift
//  DICETests
//
//  Created by nb-058-41b on 9/11/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import XCTest
@testable import DICE

class DIScopeTests: XCTestCase {
    
}

// MARK: - debugDescription

extension DIScopeTests {
    
    func testSingleDebugDescription() {
        let scope: DIScope = .single
        XCTAssertEqual(scope.debugDescription, "single")
    }
    
    func testWeakDebugDescription() {
        let scope: DIScope = .weak
        XCTAssertEqual(scope.debugDescription, "weak")
    }
    
    func testPrototypeDebugDescription() {
        let scope: DIScope = .prototype
        XCTAssertEqual(scope.debugDescription, "prototype")
    }
    
    func testObjectGraphDebugDescription() {
        let scope: DIScope = .objectGraph
        XCTAssertEqual(scope.debugDescription, "objectGraph")
    }
    
}
