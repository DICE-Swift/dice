//
//  BarService.swift
//  DICETests
//
//  Created by nb-058-41b on 9/7/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import Foundation

protocol BarServiceType {
    var test: String? { get set }
}

class BarService: BarServiceType {
    
    var test: String?
    
    init(test: String? = nil) {
        Swift.print("Init \(self) with test string: \(test ?? "nil")")
        self.test = test
    }
    
}
