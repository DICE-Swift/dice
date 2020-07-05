//
//  AppDelegate.swift
//  DICE
//
//  Created by atereshkov on 06/27/2020.
//  Copyright (c) 2020 DICE. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var session: SessionType?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.session = Session()
        return true
    }
    
}

