//
//  Lazy.swift
//  DICE
//
//  Created by Alexander Tereshkov on 9/6/20.
//

class LazyObject {
    
    var initBlock: () -> Any
    
    init(initBlock: @escaping () -> Any) {
        self.initBlock = initBlock
    }
    
    func resolve<T>() -> T {
        return self.initBlock() as! T
    }
    
}
