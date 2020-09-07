//
//  DIContainerStorage.swift
//  DICE
//
//  Created by Alexander Tereshkov on 9/6/20.
//

import Foundation

class DIContainerStorage {
    
    let locker = NSRecursiveLock()
    
    lazy var storedObjects: [ObjectIdentifier: DIObject] = [:]
    
    func insert<T>(_ object: DIObject, forType type: T.Type) {
        locker.sync { self.storedObjects[ObjectIdentifier(type)] = object }
    }
    
    var objects: [DIObject] {
        return locker.sync { self.storedObjects.values.compactMap { $0 } }
    }
    
}

extension DIContainerStorage {
    
    subscript(_ type: Any.Type) -> DIObject? {
        return locker.sync { self.storedObjects[ObjectIdentifier(type)] }
    }
    
}
