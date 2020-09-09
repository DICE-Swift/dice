//
//  DIContainerBuilder.swift
//  DICE
//
//  Created by Alexander Tereshkov on 9/6/20.
//

import Foundation

public class DIContainerBuilder<T> {
    
    private var manager: DIContainerStorage
    private var object: DIObject
    
    init(container: DIContainer, object: DIObject) {
        self.manager = container.containerStorage
        self.object = object
        self.manager.insert(object, forType: T.self)
    }
    
}

// MARK: API

public extension DIContainerBuilder {
    
    @discardableResult
    func scope(_ scope: DIScope) -> DIContainerBuilder<T> {
        object.scope = scope
        return self
    }
    
}
