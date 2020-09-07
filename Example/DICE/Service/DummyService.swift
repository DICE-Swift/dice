//
//  DummyService.swift
//  DICE_Example
//
//  Created by nb-058-41b on 7/5/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import Foundation

protocol DummyServiceType {
    func test() -> String
    func printInternal()
}

class DummyService: DummyServiceType {
    
    private let dummyInternalDependency: DummyInternalDependencyType
    private let res: String
    
    init(res: String, dummyInternalDependency: DummyInternalDependencyType) {
        self.res = res
        self.dummyInternalDependency = dummyInternalDependency
    }
    
    func test() -> String {
        return res
    }
    
    func printInternal() {
        Swift.print(dummyInternalDependency.test())
    }
    
}
