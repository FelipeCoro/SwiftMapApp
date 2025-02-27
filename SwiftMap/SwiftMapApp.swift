//
//  SwiftMapApp.swift
//  SwiftMap
//
//  Created by Felipe Coronado on 21/02/25.
//

import SwiftUI

@main
struct SwiftMapApp: App {
    
    @StateObject  var viewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
        }.environmentObject(viewModel)
    }
}
