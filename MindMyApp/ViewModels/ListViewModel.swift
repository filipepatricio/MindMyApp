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
    
    @Published var favoriteOrganizations: Organizations = []
    
    enum SortOptions {
        case title
        case titleReversed
    }
    
    private let githubDataService = OrganizationsDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    let favoritesKey: String = "favorites_list"
    
    init() {
        addSubscribers()
        getFavorites()
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
    
    private func getFavorites() {
        guard
            let data = UserDefaults.standard.data(forKey: favoritesKey),
            let savedOrganizations = try? JSONDecoder().decode(Organizations.self, from: data)
        else { return }
        
        favoriteOrganizations = savedOrganizations
    }
    
    func addFavorite(organization: Organization) {
        favoriteOrganizations.append(organization)
        updateFavoriteList()
    }
    
    func removeFavorite(organization: Organization) {
        favoriteOrganizations.removeAll(where: { $0.id == organization.id })
        updateFavoriteList()
    }
    
    func updateFavoriteList() {
        if let data = try? JSONEncoder().encode(favoriteOrganizations) {
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
    }
    
    func isOrganizationFavorite(organization: Organization) -> Bool {
        return favoriteOrganizations.contains(where: { $0.id == organization.id })
    }
    
    func toggleFavorite(organization: Organization) {
        isOrganizationFavorite(organization: organization) ? removeFavorite(organization: organization) : addFavorite(organization: organization)
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
