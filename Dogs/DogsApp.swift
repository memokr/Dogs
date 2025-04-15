//
//  DogsApp.swift
//  Dogs
//
//  Created by Guillermo Kramsky on 14/04/25.
//

import SwiftUI

@main
struct DogsApp: App {
    @State private var viewModel: DogViewModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
