//
//  InternalService.swift
//  DICETests
//
//  Created by nb-058-41b on 9/7/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import Foundation

protocol InternalServiceType {
    
    func test()
    
}

class InternalService: InternalServiceType {
    
    init() {
        Swift.print("Init InternalService")
    }
    
    func test() {
        Swift.print("InternalService")
    }
    
}
