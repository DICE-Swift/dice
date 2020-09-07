//
//  DIContainer.swift
//  DICE
//
//  Created by Alexander Tereshkov on 7/9/20.
//

import Foundation

public final class DIContainer: CustomStringConvertible {
    
    lazy var resolveStorage: [ObjectIdentifier: Any] = [:]
    private(set) var containerStorage = DIContainerStorage()
    
    lazy var resolveObjectGraphStorage: [ObjectIdentifier: Any] = [:]
    var objectGraphStackDepth: Int = 0
    
    public var description: String {
        return containerStorage.storedObjects.description
    }
    
    @discardableResult
    public func register<T>(_ type: T.Type = T.self, _ initialize: @escaping (DIContainer) -> T) -> DIContainerBuilder<T> {
        let initer = LazyObject(initBlock: initialize, container: self)
        return DIContainerBuilder(container: self, object: DIObject(lazy: initer, type: type))
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
        let objects = containerStorage.objects.filter { $0.scope == .single }
        for object in objects {
            addSingleton(object)
        }
    }
    
}

private extension DIContainer {
    
    /// Adds singletone instance to the storage making it accessible
    /// - Parameter object: Object to store in storage
    func addSingleton(_ object: DIObject) {
        let resolvedObject = object.lazy.resolve() as Any
        resolveStorage[ObjectIdentifier(object.type)] = resolvedObject
    }
    
    func makeObject(for type: Any.Type, bundle: Bundle?, usingObject: DIObject? = nil) -> Any? {
        let object = usingObject ?? findObject(for: type, bundle: bundle)
        let key = ObjectIdentifier(object.type)
        
        switch object.scope {
        case .single:
            return resolveStorage[key]
        case .prototype:
            return object.lazy.resolve()
        case .weak:
            if let weakReference = resolveStorage[key] as? WeakObject<AnyObject> {
                return weakReference.value
            }
            
            let resolvedObject = object.lazy.resolve() as AnyObject
            let weakObject = WeakObject(value: resolvedObject)
            resolveStorage[key] = weakObject
            return resolvedObject
        case .objectGraph:
            defer { objectGraphStackDepth -= 1 }
            
            if let object = resolveObjectGraphStorage[key] {
                if objectGraphStackDepth == 0 {
                    resolveObjectGraphStorage.removeAll()
                }
                return object
            }
            
            objectGraphStackDepth += 1
            let value = object.lazy.resolve() as Any
            resolveObjectGraphStorage[key] = value
            
            let mirror = Mirror(reflecting: value)
            
            for child in mirror.children {
                if let injectable = child.value as? InjectableProperty {
                    let subject = findObject(for: injectable.type, bundle: injectable.bundle)
                    if subject.scope != .single && subject.scope != .weak {
                        objectGraphStackDepth += 1
                        resolveObjectGraphStorage[ObjectIdentifier(subject.type)] = self.makeObject(for: subject.type, bundle: subject.bundle, usingObject: subject)
                    }
                }
            }
            
            return value
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
