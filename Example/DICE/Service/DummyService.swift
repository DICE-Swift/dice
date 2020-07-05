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
}

class DummyService: DummyServiceType {
    
    private let result: String
    
    init(result: String) {
        self.result = result
    }
    
    func test() -> String {
        return result
    }
    
}
