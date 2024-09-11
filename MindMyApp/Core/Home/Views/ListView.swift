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
                organizationList
            }
            .navigationTitle("Github Organizations")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    sortButton
                }
            }
        }.searchable(text: $vm.searchText, prompt: "Search for organization...")
    }
}

extension ListView {
    private var organizationList: some View {
        List {
            ForEach(vm.organizations) { organization in
                ZStack {
                    NavigationLink(value: organization) {
                        EmptyView()
                    }.opacity(0)
                    ListRowView(rowItem: organization,
                                isFavorite: vm.isOrganizationFavorite(organization: organization),
                                onFavorite: { vm.toggleFavorite(organization: organization) })
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationDestination(for: Organization.self) { selectedOrganization in
            OrganizationDetail(organization: selectedOrganization)
        }
    }

    private var sortButton: some View {
        Button(action: vm.sortTitleToggle,
               label: {
                   Text("Sort alphabetically \(vm.sortOption == .title ? "▲" : "▼")")
               })
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}
