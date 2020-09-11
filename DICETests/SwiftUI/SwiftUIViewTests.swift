//
//  SwiftUIViewTests.swift
//  DICETests
//
//  Created by Alexander Tereshkov on 9/11/20.
//  Copyright © 2020 DICE. All rights reserved.
//

#if canImport(SwiftUI) && canImport(Combine)

import SwiftUI
import XCTest
@testable import DICE

class SwiftUIViewTests: XCTestCase {
    
}

private struct DummyView: View {
    var body: some View {
        Text("")
    }
}

private class DummyClass: Equatable {
    let id: String = UUID().uuidString
    
    static func == (lhs: DummyClass, rhs: DummyClass) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Inject DIContainer

extension SwiftUIViewTests {
    
    func testContainerShouldBeInjectedToEnvironment() {
        let view = DummyView()
        let container = DIContainer()
        let _ = view.inject(container: container)
        
        // TODO: Add an assertion
    }
    
}

// MARK: - EnvironmetInject

extension SwiftUIViewTests {
    
    func testValueShouldBeInjected() {
        let view = DummyView()
        let dummyClass = DummyClass()
        let _ = view.environmentInject(dummyClass)
        
        // TODO: Add an assertion
    }
    
}

#endif
