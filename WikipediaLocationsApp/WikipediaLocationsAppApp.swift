//
//  WikipediaLocationsAppApp.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import SwiftUI

@main
struct WikipediaLocationsAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(viewModel: LocationsViewModel())
            }
        }
    }
}
