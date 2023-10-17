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
                Text(location.name ?? "Get lucky").font(.headline)
                Text("Lat: \(location.lattitude)").font(.subheadline)
                Text("Long: \(location.longiture)").font(.subheadline)
            }
            Spacer()
        }.listRowSeparator(.hidden)
    }
}

#Preview {
    ListCellView(location: .init(name: "Amsterdam",
                                 lattitude: 111111,
                                 longiture: 222222))
}
