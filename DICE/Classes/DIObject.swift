//
//  DIObject.swift
//  DICE
//
//  Created by Alexander Tereshkov on 9/6/20.
//

import Foundation

class DIObject: CustomDebugStringConvertible {
    
    let lazy: LazyObject
    let type: Any.Type
    
    var scope: DIScope = DICE.Defaults.scope
    
    var debugDescription: String {
        let address = Unmanaged.passUnretained(self).toOpaque()
        let type = String(describing: self.type)
        return String(format: "[DIObject <%@>] %@ - %@", address.debugDescription, type, scope.debugDescription)
    }
    
    var bundle: Bundle? {
        if let anyClass = type as? AnyClass {
            return Bundle(for: anyClass)
        }
        
        return nil
    }
    
    init(lazy: LazyObject, type: Any.Type) {
        self.lazy = lazy
        self.type = type
    }
    
}
