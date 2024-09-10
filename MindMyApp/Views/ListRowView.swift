//
//  ListRowView.swift
//  MindMyApp
//
//  Created by Filipe Patricio on 10/09/2024.
//

import MindMyLib
import SwiftUI

struct ListRowView: View {
    let rowItem: any RowItem

    var body: some View {
        HStack {
            Text(rowItem.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    ListRowView(rowItem: DummyModels().organization)
}
