//
//  DIContainer.swift
//  DICE
//
//  Created by Alexander Tereshkov on 7/9/20.
//

import Foundation

public final class DIContainer: CustomStringConvertible {
    
    lazy var resolveStorage: [ObjectIdentifier: Any] = [:]
    
    public var description: String {
        return containerStorage.storedObjects.description
    }
    
    var containerStorage = DIContainerStorage()
    
    public init() {
        
    }
    
    @discardableResult
    public func register<T>(as type: T.Type = T.self, _ initialize: @escaping () -> T) -> DIContainerContext<T> {
        let initer = LazyObject(initBlock: initialize)
        return DIContainerContext(container: self, object: DIObject(lazy: initer, type: type))
    }
    
    public func resolve<T>(bundle: Bundle? = nil) -> T {
        if let object = makeObject(for: T.self, bundle: bundle) {
            return object as! T
        } else {
            fatalError("Couldn't found object for type \(T.self)")
        }
    }
    
    public func didSetSharedContainer() {
        resolveSingletones()
    }
    
    // MARK: - Private
    
    func resolveSingletones() {
        let objects = containerStorage.objects.filter { $0.lifeCycle == .single }
        for object in objects {
            addSingletone(object)
        }
    }
    
    @discardableResult
    func registerObject(_ object: DIObject) -> DIContainerContext<Any> {
        return DIContainerContext(container: self, object: object)
    }
    
    func merge(with container: DIContainer) {
        let newContainers = container.containerStorage.storedObjects
        containerStorage.storedObjects.merge(newContainers) { _, new in new }
    }
    
}

private extension DIContainer {
    
    /// Adds singletone instance to the storage making it accessible
    /// - Parameter object: Object to store in storage
    func addSingletone(_ object: DIObject) {
        let resolvedObject = object.lazy.resolve() as Any
        resolveStorage[ObjectIdentifier(object.type)] = resolvedObject
    }
    
    func makeObject(for type: Any.Type, bundle: Bundle?) -> Any? {
        let object = findObject(for: type, bundle: bundle)
        let key = ObjectIdentifier(object.type)
        
        switch object.lifeCycle {
        case .single:
            return resolveStorage[key]
        case .prototype:
            return object.lazy.resolve()
        }
    }
    
    func findObject(for type: Any.Type, bundle: Bundle?) -> DIObject {
        guard let object = containerStorage[type] else {
            fatalError("Can't found object for type \(type)")
        }
        
        if let bundle = bundle {
            if object.bundle != bundle {
                fatalError("Can't resolve object from passed bundle. Bundles are not equal")
            }
        }
        
        return object
    }
    
}
