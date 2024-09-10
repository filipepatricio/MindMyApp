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
        NavigationStack {
            ZStack {
                List {
                    ForEach(vm.organizations) { organization in
                        ListRowView(rowItem: organization)
                    }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("Github Organizations")
        }.searchable(text: $vm.searchText, prompt: "Search for organization...")
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}
