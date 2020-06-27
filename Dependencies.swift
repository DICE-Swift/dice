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

    func register<T>(_ dependency: @escaping () -> T) {
        let key = String(describing: T.self)
        dependencies[key] = dependency
    }

    func resolve<T>() -> T {
        let key = String(describing: T.self)
        guard let service: T = dependencies[key]?() as? T else {
            fatalError("Dependency \(T.self) not resolved")
        }
        return service
    }
}
