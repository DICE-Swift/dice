//
//  Inject.swift
//  DICE
//
//  Created by Anton Polyakov on 6/27/20.
//

import Foundation

@propertyWrapper
public struct Inject<Value> {
    
    private let name: String?

    public var wrappedValue: Value {
        Dependencies.shared.resolve(with: name)
    }

    public init() {
        self.name = nil
    }
    
    public init(_ name: String) {
        self.name = name
    }
}
