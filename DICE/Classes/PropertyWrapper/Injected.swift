//
//  Inject.swift
//  DICE
//
//  Created by Alexander Tereshkov on 6/27/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import Foundation

@propertyWrapper
public struct Injected<Value> {
    
    typealias LazyInject = () -> Value
    
    private let name: String?
    private var _value: Value?
    private var lazy: LazyInject?
    
    public var wrappedValue: Value {
        mutating get {
            if let value = _value {
                return value
            } else if let lazy = self.lazy {
                self._value = lazy()
                return _value!
            } else {
                fatalError("Bad init")
            }
        }
    }

    public init() {
        let bundle = (Value.self as? AnyClass).flatMap { Bundle(for: $0) }
        let lazy: LazyInject = { DICE.sharedContainer.resolve(bundle: bundle) }
        self.lazy = lazy
        self.name = nil
    }
    
    // TODO - Add implementation so we can inject by property name
//    public init(_ name: String) {
//        let bundle = (Value.self as? AnyClass).flatMap { Bundle(for: $0) }
//        let lazy: LazyInject = { DICE.sharedContainer.resolve(bundle: bundle) }
//        self.lazy = lazy
//        self.name = name
//    }
    
}

extension Injected: InjectableProperty {
    
    var type: Any.Type {
        return Value.self
    }
    
}
