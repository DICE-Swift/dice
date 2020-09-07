//
//  Session.swift
//  DICE_Example
//
//  Created by nb-058-41b on 7/5/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import Foundation
import DICE

protocol SessionType {}

class Session: SessionType {
    
    let container = DIContainer()
    
    init() {
        let internalDependency = DummyInternalDependency(value: 100)
        
        container.register(as: DummyServiceType.self, {
            return DummyService(res: "123", dummyInternalDependency: internalDependency)
        })
        
        container.register({
            return UIView()
        })
        
        DICE.Defaults.lifeCycle = .single
        DICE.use(container)
        
        Swift.print(container.description)
        
        let resolvedService: DummyServiceType = container.resolve()
        Swift.print("Resolved service test: \(resolvedService.test())")
    }
    
}
