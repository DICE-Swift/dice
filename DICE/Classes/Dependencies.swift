//
//  Dependencies.swift
//  DICE
//
//  Created by Anton Polyakov on 6/27/20.
//

import Foundation

public final class Dependencies {

    public static let shared = Dependencies()

    private var dependencies = [String: () -> Any]()

    public func register<T>(_ dependency: @escaping () -> T, with name: String? = nil) {
        let key = name ?? String(describing: T.self)
        dependencies[key] = dependency
    }

    public func resolve<T>(with name: String? = nil) -> T {
        let key = name ?? String(describing: T.self)
        guard let service: T = dependencies[key]?() as? T else {
            fatalError("Dependency \(T.self) not resolved")
        }
        return service
    }
}
