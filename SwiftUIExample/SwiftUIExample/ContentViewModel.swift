//
//  ContentViewModel.swift
//  SwiftUIExample
//
//  Created by nb-058-41b on 9/8/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import Foundation

protocol ContentViewModelType: ObservableObject {
    
}

class ContentViewModel: ContentViewModelType {
    
    @Published private(set) var title: String = ""
    
    func startUpdatingTitle() {
        self.title = "Test"
    }
    
}
