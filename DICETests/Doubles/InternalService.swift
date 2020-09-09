//
//  InternalService.swift
//  DICETests
//
//  Created by nb-058-41b on 9/7/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import Foundation

protocol InternalServiceType {
    var test: String? { get set }
}

class InternalService: InternalServiceType {
    
    var test: String?
    
    init(test: String? = nil) {
        Swift.print("Init InternalService")
        self.test = test
    }
    
}
