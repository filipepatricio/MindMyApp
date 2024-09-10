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
                if vm.organizations.isEmpty {
                    ProgressView()
                }
                List {
                    ForEach(vm.organizations) { organization in
                        ListRowView(rowItem: organization, isFavorite: vm.isOrganizationFavorite(organization: organization))
                            .onTapGesture {
                                withAnimation(.linear) {
                                    vm.toggleFavorite(organization: organization)
                                }
                            }
                    }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("Github Organizations")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: vm.sortTitleToggle,
                           label: {
                               Text("Sort alphabetically \(vm.sortOption == .title ? "▲" : "▼")")
                           })
                }
            }
        }.searchable(text: $vm.searchText, prompt: "Search for organization...")
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}
