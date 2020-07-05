//
//  Dependencies.swift
//  DICE
//
//  Created by Anton Polyakov on 6/27/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import Foundation

public final class Dependencies {

    public static let shared = Dependencies()

    private var dependencies = [String: FactoryClosure]()

    public func register<T>(type: T.Type, with name: String? = nil, factory: @escaping FactoryClosure) {
        let key = name ?? String(describing: T.self)
        dependencies[key] = factory
    }

    public func resolve<T>(with name: String? = nil) -> T {
        let key = name ?? String(describing: T.self)
        guard let service: T = dependencies[key]?(self) as? T else {
            fatalError("Dependency \(T.self) not resolved")
        }
        return service
    }
}
