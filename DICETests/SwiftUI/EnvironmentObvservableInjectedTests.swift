//
//  EnvironmentObvservableInjectedTests.swift
//  DICETests
//
//  Created by Alexander Tereshkov on 9/10/20.
//  Copyright © 2020 DICE. All rights reserved.
//

#if canImport(SwiftUI) && canImport(Combine)

import SwiftUI
import Combine
import XCTest
@testable import DICE

class EnvironmentObservableInjectedTests: XCTestCase {
    
    let container = DIContainer()
    
}

private class ViewModel: ObservableObject {
    let barService: BarServiceType?
    
    init(_ barService: BarServiceType? = nil) {
        self.barService = barService
    }
}

private struct DummyView: View {
    @EnvironmentObservableInjected var viewModelOne: ViewModel
    @EnvironmentObservableInjected("dependency1") var viewModelTwo: ViewModel
    
    var body: some View {
        Text("")
    }
}

extension EnvironmentObservableInjectedTests {
    
    func testInjectedServicesShouldBeInitializedAndAccessible() {
        container.register { _ in
            return ViewModel()
        }
        
        container.register(tag: "dependency1") { _ in
            return ViewModel()
        }
        
        container.register(BarServiceType.self) { _ in
            return BarService()
        }
        container.register(ViewModel.self) { container in
            let barService: BarServiceType = container.resolve()
            return ViewModel(barService)
        }
        
        DICE.use(container)
        
//        let dummyView = DummyView()
//        XCTAssertNotNil(dummyView.viewModelOne)
//        XCTAssertNotNil(dummyView.viewModelTwo)
    }
    
}

#endif
