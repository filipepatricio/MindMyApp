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
    @Published var searchText = ""
    @Published var sortOption: SortOptions = .title

    enum SortOptions {
        case title
        case titleReversed
    }

    private let githubDataService = OrganizationsDataService()

    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    private func addSubscribers() {
        $searchText
            .combineLatest(githubDataService.$organizations, $sortOption)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterAndSortOrganizations)
            .sink { [weak self] returnedOrganizations in
                self?.organizations = returnedOrganizations
            }
            .store(in: &cancellables)
    }

    func sortTitleToggle() {
        if sortOption == .title {
            sortOption = .titleReversed
        } else {
            sortOption = .title
        }
    }

    private func filterAndSortOrganizations(text: String, organizations: Organizations, sort: SortOptions) -> Organizations {
        var updatedOrganizations = filterOrganizations(text: text, organizations: organizations)
        sortOrganizations(sort: sort, organizations: &updatedOrganizations)
        return updatedOrganizations
    }

    private func filterOrganizations(text: String, organizations: Organizations) -> Organizations {
        guard !text.isEmpty else {
            return organizations
        }

        let lowercasedText = text.lowercased()

        return organizations.filter { organization in
            organization.title.lowercased().contains(lowercasedText) ||
                organization.id.description.lowercased().contains(lowercasedText)
        }
    }

    private func sortOrganizations(sort: SortOptions, organizations: inout Organizations) {
        switch sort {
        case .title:
            organizations.sort(by: { $0.title.lowercased() < $1.title.lowercased() })
        case .titleReversed:
            organizations.sort(by: { $0.title.lowercased() > $1.title.lowercased() })
        }
    }
}
