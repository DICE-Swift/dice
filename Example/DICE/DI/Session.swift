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
        Dependencies.shared.register(type: DummyServiceType.self) { _ in
            return DummyService(result: "123")
        }
    }
    
}
