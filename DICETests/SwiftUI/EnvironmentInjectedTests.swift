//
//  EnvironmentInjectedTests.swift
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

class EnvironmentInjectedTests: XCTestCase {
    
    let container = DIContainer()
    
}

private protocol ServiceType {
    
}

private class Service: ServiceType {
    let barService: BarServiceType
    
    init(_ barService: BarServiceType) {
        self.barService = barService
    }
}

private class DummyClass {
    @EnvironmentInjected var fooService: FooService
    @EnvironmentInjected("dependency1") var barService: BarService
    @EnvironmentInjected var service: Service
}

extension EnvironmentInjectedTests {
    
    func testInjectedServicesShouldBeInitializedAndAccessible() {
        container.register { _ in
            return FooService()
        }
        
        container.register(tag: "dependency1") { _ in
            return BarService(test: "stringDependency1")
        }
        
        container.register(BarServiceType.self) { _ in
            return BarService(test: "internalDependency")
        }
        
        container.register(Service.self) { container in
            let _: BarService = container.resolve(tag: "dependency1")
            let barService: BarServiceType = container.resolve()
            return Service(barService)
        }
        
        DICE.use(container)
        
        let dummyClass = DummyClass()
        XCTAssertNotNil(dummyClass.fooService)
        XCTAssertNotNil(dummyClass.barService)
        XCTAssertNotNil(dummyClass.service)
    }
    
}

#endif
