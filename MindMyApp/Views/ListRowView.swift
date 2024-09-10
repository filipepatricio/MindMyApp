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
    let isFavorite: Bool

    var body: some View {
        HStack {
            Text(rowItem.title)
            Spacer()
            Image(systemName: isFavorite ? "star.fill" : "star")
                .foregroundStyle(.yellow)
        }
        .contentShape(Rectangle())
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    ListRowView(rowItem: DummyModels().organization, isFavorite: true)
}
