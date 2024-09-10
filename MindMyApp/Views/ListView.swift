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
            ForEach(listViewModel.organizations, id: \.self) { organization in
                Text(organization)
            }
        }
        .padding()
    }
}

#Preview {
    ListView().environmentObject(ListViewModel())
}
