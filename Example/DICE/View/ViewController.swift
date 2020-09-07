//
//  ViewController.swift
//  DICE
//
//  Created by atereshkov on 06/27/2020.
//  Copyright (c) 2020 DICE. All rights reserved.
//

import UIKit
import DICE

class ViewController: UIViewController {
    
    @Injected var dummyService: DummyServiceType
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result = dummyService.test()
        Swift.print(result)
        
        dummyService.printInternal()
    }
    
}

