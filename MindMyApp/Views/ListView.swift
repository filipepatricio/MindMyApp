//
//  ContentView.swift
//  MindMyApp
//
//  Created by Filipe Patricio on 10/09/2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var vm: ListViewModel

    var body: some View {
        ZStack {
            List {
                ForEach(vm.organizations) { organization in
                    ListRowView(rowItem: organization)
                }
            }.listStyle(PlainListStyle())
        }
        .navigationTitle("Github Organizations")
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}
