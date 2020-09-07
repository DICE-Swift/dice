//
//  DICE.swift
//  DICE
//
//  Created by Alexander Tereshkov on 9/6/20.
//

import Foundation

public struct DICE {
    
    internal private(set) static var sharedContainer: DIContainer = DIContainer()
    
    public enum Defaults {
        /// Set default lifetime for container instances. `DILifeCycle.single` is set by default
        public static var scope: DIScope = .single
    }
    
    /// When container is set for usage then dependencies can be resolved through environment variables `Injected`, `EnvironmentObservedInject` and `EnvironmentInject`
    public static func use(_ container: DIContainer) {
        self.sharedContainer = container
        container.didSetSharedContainer()
    }
}

public enum DIScope {
    /// Dependency is created per container as single instance.
    case single
    
    /// Dependency instance is created each time.
    case prototype
}

extension DIScope: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        switch self {
            case .single:
                return "single"
            case .prototype:
                return "prototype"
        }
    }
    
}
