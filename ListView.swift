//
//  ListView.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 18/10/2023.
//

import SwiftUI

struct ListView: View {
    @Binding var locations: [Location]
    var onTap: (Location) -> Void
    var body: some View {
        List(locations) { location in
            ListCellView(location: location)
                .onTapGesture(perform: { onTap(location) })
        }.listStyle(.plain)
    }
}
