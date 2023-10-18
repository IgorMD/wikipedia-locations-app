//
//  ContentView.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import SwiftUI

struct LocationsListView: View {
    @StateObject var viewModel: LocationsViewModel
    var body: some View {
        constructView().navigationTitle(Strings.navigationTitle)
    }
    
    @ViewBuilder private func constructView() -> some View {
        switch viewModel.viewState {
        case .loading:
            HStack {
                ProgressView {
                    Text(Strings.loadingTitle)
                }.onAppear(perform: {
                    viewModel.getLocations()
                })
            }
        case .error(let string):
            VStack {
                Text(string)
            }
        case .display:
            ListView(locations: $viewModel.locations) { location in
                viewModel.onLocationTapped(with: location)
            }
        }
    }
}

#Preview {
    NavigationView {
        LocationsListView(viewModel: LocationsViewModel())
    }
}
