//
//  ContentView.swift
//  MindMyApp
//
//  Created by Filipe Patricio on 10/09/2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        VStack {
            ForEach(listViewModel.organizations) { organization in
                Text(organization.login)
            }
        }
        .padding()
    }
}

#Preview {
    ListView().environmentObject(ListViewModel())
}
