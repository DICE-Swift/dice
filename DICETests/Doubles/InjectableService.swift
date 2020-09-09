//
//  InjectableService.swift
//  DICETests
//
//  Created by Alexander Tereshkov on 6/28/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import Foundation

protocol FooServiceType {
    var test: String? { get set }
}

class FooService: FooServiceType {
    
    var test: String?
    
    init(test: String? = nil) {
        Swift.print("Init InjectableService with test string: \(test ?? "nil")")
        self.test = test
    }
    
}
