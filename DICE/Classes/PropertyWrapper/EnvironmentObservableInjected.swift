//
//  EnvironmentObservableInjected.swift
//  DICE
//
//  Created by Alexander Tereshkov on 9/7/20.
//  Copyright © 2020 DICE. All rights reserved.
//

#if canImport(SwiftUI) && canImport(Combine)

import SwiftUI
import Combine

/// Dynamic view property wrapper that subscribes to a `ObservableObject` automatically invalidating the view when it changes.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper
public struct EnvironmentObservableInjected<Value: ObservableObject>: DynamicProperty {
    
    @ObservedObject private var _wrappedValue: Value
    public var wrappedValue: Value {
        _wrappedValue
    }
    
    /// The binding value, as "unwrapped" by accessing `$foo` on a `@Binding` property.
    public var projectedValue: ObservedObject<Value>.Wrapper {
        return __wrappedValue.projectedValue
    }
    
    public init() {
        let bundle = Bundle(for: Value.self)
        let resolvedValue = Environment(\.container).wrappedValue.resolve(bundle: bundle) as Value
        self.__wrappedValue = ObservedObject<Value>(initialValue: resolvedValue)
    }
    
}

@available(iOS 13.0, *)
extension EnvironmentObservableInjected: InjectableProperty {
    var type: Any.Type {
        return Value.self
    }
}

#endif
