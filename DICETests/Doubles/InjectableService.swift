//
//  InjectableService.swift
//  DICETests
//
//  Created by Alexander Tereshkov on 6/28/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import Foundation

protocol InjectableServiceType {
    
    func test()
    
}

class InjectableService: InjectableServiceType {
    
    init() {
        Swift.print("Init InjectableService")
    }
    
    func test() {
        Swift.print("InjectableService test()")
    }
    
}
