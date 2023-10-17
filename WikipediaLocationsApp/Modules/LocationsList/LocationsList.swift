//
//  ContentView.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
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
                   
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.white)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .onTapGesture(perform: {
                        UIApplication.shared.open(URL(string: "wikipedia://places?lat=\(location.lattitude)&lon=\(location.longiture)")!)
                    })
            }.listStyle(.plain)
        }
    }
}

#Preview {
    NavigationView {
        ContentView(viewModel: LocationsViewModel())
    }
}