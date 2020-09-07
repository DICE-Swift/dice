//
//  InjectableProperty.swift
//  DICE
//
//  Created by Alexander Tereshkov on 9/6/20.
//

import Foundation

protocol InjectableProperty {
    var type: Any.Type { get }
    var bundle: Bundle? { get }
}

extension InjectableProperty {
    var bundle: Bundle? {
        return (type as? AnyClass).flatMap { Bundle(for: $0) }
    }
}
