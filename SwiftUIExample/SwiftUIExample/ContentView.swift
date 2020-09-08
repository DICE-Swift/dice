//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by nb-058-41b on 9/8/20.
//  Copyright © 2020 DICE. All rights reserved.
//

import SwiftUI
import DICE

struct ContentView: View {
    
    @EnvironmentObservableInjected var viewModel: ContentViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.title)
        }.onAppear { self.viewModel.startUpdatingTitle() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
