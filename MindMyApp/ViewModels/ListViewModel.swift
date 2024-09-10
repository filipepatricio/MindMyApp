//
//  ListViewModel.swift
//  MindMyApp
//
//  Created by Filipe Patricio on 10/09/2024.
//

import Foundation
import MindMyLib

class ListViewModel: ObservableObject {
    @Published var organizations: [String] = []

    init() {
        getOrganizations()
    }

    func getOrganizations() {
        organizations = MindMyLib.GithubService().getOrganizations()
    }
}
