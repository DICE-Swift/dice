//
//  DIComponentContext.swift
//  DICE
//
//  Created by Alexander Tereshkov on 9/6/20.
//

import Foundation

public class DIContainerContext<T> {
    
    private var manager: DIContainerStorage
    private var object: DIObject
    
    init(container: DIContainer, object: DIObject) {
        self.manager = container.containerStorage
        self.object = object
        self.manager.insert(object, forType: T.self)
    }
    
    @discardableResult
    public func lifeCycle(_ lifeCycle: DIScope) -> DIContainerContext<T> {
        object.lifeCycle = lifeCycle
        return self
    }
    
    @discardableResult
    public func `as`<U>(_ type: U.Type) -> DIContainerContext<T> {
        manager.insert(object, forType: type)
        return self
    }
    
    // TODO add 'name' or 'tag' here for property wrapper injections
    
}
