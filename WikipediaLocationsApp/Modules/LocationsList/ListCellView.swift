//
//  ListCellView.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import SwiftUI

struct ListCellView: View {
    var location: Location
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(location.name ?? Strings.getLucky).font(.headline)
                Text(location.latitudeDescription).font(.subheadline)
                Text(location.longitudeDescription).font(.subheadline)
            }
            Spacer()
        }.listRowSeparator(.hidden)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.white)
            .cornerRadius(15)
            .shadow(radius: 3)
    }
}

#Preview {
    ListCellView(location: .init(name: "Amsterdam",
                                 lattitude: 111111,
                                 longiture: 222222))
}
