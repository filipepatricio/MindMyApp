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
    ListRowView(rowItem: Organization(title: "First organization", id: 1, nodeID: "1", url: "1", reposURL: "1", eventsURL: "1", hooksURL: "1", issuesURL: "1", membersURL: "1", publicMembersURL: "1", avatarURL: "1", description: "1"))
}
