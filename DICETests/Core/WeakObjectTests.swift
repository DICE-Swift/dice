//
//  WeakObjectTests.swift
//  DICETests
//
//  Created by Alexander Tereshkov on 9/11/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import XCTest
@testable import DICE

class WeakObjectTests: XCTestCase {
    
}

private class Dummy: Equatable {
    let id: String = UUID().uuidString
    
    static func == (lhs: Dummy, rhs: Dummy) -> Bool {
        return lhs.id == rhs.id
    }
}

extension WeakObjectTests {
    
    func testWeakObjectShouldReturnSameWeakValue() {
        let dummy = Dummy()
        let object = WeakObject(value: dummy)
        
        XCTAssertEqual(dummy, object.value)
    }
    
    func testWeakObjectShouldBeOptional() {
        let dummy = Dummy()
        let object = WeakObject(value: dummy)
        object.value = nil
        
        XCTAssertEqual(object.value, nil)
    }
    
}

extension WeakObjectTests {
    
    func testDescriptionShouldNotBeEmpty() {
        let dummy = Dummy()
        let object = WeakObject(value: dummy)
        
        XCTAssert(!object.debugDescription.isEmpty)
    }
    
}
