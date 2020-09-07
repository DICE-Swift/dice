//
//  DummyInternalDependency.swift
//  DICE_Example
//
//  Created by nb-058-41b on 9/7/20.
//  Copyright © 2020 DICE. All rights reserved.
//

protocol DummyInternalDependencyType {
    func test() -> Int
}

class DummyInternalDependency: DummyInternalDependencyType {
    
    private let value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    func test() -> Int {
        return value
    }
    
}
