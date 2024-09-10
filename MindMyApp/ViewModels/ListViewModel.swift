//
//  ListViewModel.swift
//  MindMyApp
//
//  Created by Filipe Patricio on 10/09/2024.
//

import Combine
import Foundation
import MindMyLib

class ListViewModel: ObservableObject {
    @Published var organizations: Organizations = []

    private let githubDataService = OrganizationsDataService()

    private var cancelables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    func addSubscribers() {
        githubDataService.$organizations
            .sink { [weak self] returnedOrganization in
                self?.organizations = returnedOrganization
            }
            .store(in: &cancelables)
    }
}
