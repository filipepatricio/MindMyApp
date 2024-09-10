//
//  OrganizationImageView.swift
//  MindMyApp
//
//  Created by Filipe Patricio on 10/09/2024.
//

import SwiftUI

struct RowItemImageView: View {
    @StateObject var vm: RowItemImageViewModel

    init(rowItem: any RowItem) {
        _vm = StateObject(wrappedValue: RowItemImageViewModel(rowItem: rowItem))
    }

    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    RowItemImageView(rowItem: DummyModels().organization)
}
