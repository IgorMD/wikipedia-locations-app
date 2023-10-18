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
        constructView().navigationTitle("Locations")
    }
    
    @ViewBuilder private func constructView() -> some View {
        switch viewModel.viewState {
        case .loading:
            HStack {
                ProgressView {
                    Text("Loading locations...")
                }.onAppear(perform: {
                    viewModel.getLocations()
                })
            }
        case .error(let string):
            VStack {
                Text(string)
            }
        case .display:
            List(viewModel.locations) { location in
                ListCellView(location: location)
                    .onTapGesture(perform: {
                        viewModel.onLocationTapped(with: location)
                    })
            }.listStyle(.plain)
        }
    }
}

#Preview {
    NavigationView {
        LocationsListView(viewModel: LocationsViewModel())
    }
}
