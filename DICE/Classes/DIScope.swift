//
//  DIScope.swift
//  DICE
//
//  Created by Alexander Tereshkov on 9/7/20.
//  Copyright © 2020 DICE. All rights reserved.
//

public enum DIScope {
    /// Dependency is created per container as single instance.
    case single
    
    /// Dependency instance is created each time.
    case prototype
}

extension DIScope: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        switch self {
            case .single:
                return "single"
            case .prototype:
                return "prototype"
        }
    }
    
}
