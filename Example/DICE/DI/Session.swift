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
    
    init() {
        Dependencies.shared.register({ DummyService(result: "123") as DummyServiceType })
    }
    
}
