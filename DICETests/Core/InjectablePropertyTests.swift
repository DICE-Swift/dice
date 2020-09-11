//
//  InjectablePropertyTests.swift
//  DICETests
//
//  Created by nb-058-41b on 9/11/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import XCTest
@testable import DICE

class InjectablePropertyTests: XCTestCase {
    
}

private class DummyProperty: InjectableProperty {
    var key: DependencyKey
    
    init(key: DependencyKey) {
        self.key = key
    }
}

extension InjectablePropertyTests {
    
    func test() {
        let key = DependencyKey(type: DummyProperty.self)
        let property = DummyProperty(key: key)
        
        let bundle = Bundle(for: DummyProperty.self)
        let propertyBundle = property.bundle
        
        XCTAssertEqual(propertyBundle, bundle)
    }
    
}
