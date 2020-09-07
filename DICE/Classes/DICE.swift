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
