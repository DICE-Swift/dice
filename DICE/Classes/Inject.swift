//
//  Inject.swift
//  DICE
//
//  Created by Anton Polyakov on 6/27/20.
//

import Foundation

@propertyWrapper
public struct Inject<Value> {

    public var wrappedValue: Value {
        Dependencies.shared.resolve()
    }

    public init() {
    }
}
