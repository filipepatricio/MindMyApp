//
//  OrganizationDetail.swift
//  MindMyApp
//
//  Created by Filipe Patricio on 10/09/2024.
//

import SwiftUI

struct OrganizationDetail: View {
    @State var organization: Organization

    init(organization: Organization) {
        self.organization = organization
        print("init with organization: \(organization.title)")
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                detailsTitle
                descriptionLabel
            }.padding()
        }
        .navigationTitle(organization.title)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                RowItemImageView(rowItem: organization)
                    .frame(width: 40, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}

extension OrganizationDetail {
    private var detailsTitle: some View {
        Text("Details")
            .font(.title)
            .bold()
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var descriptionLabel: some View {
        Text(organization.description)
            .foregroundStyle(.secondary)
            .font(.callout)
            .padding(.vertical, 4)
    }
}

#Preview {
    NavigationView {
        OrganizationDetail(organization: DummyModels().organization)
    }
}
