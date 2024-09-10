//
//  GithubDataService.swift
//  MindMyApp
//
//  Created by Filipe Patricio on 10/09/2024.
//

import Combine
import Foundation
import MindMyLib

class OrganizationsDataService {
    @Published var organizations: Organizations = []
    var organizationSubscription: AnyCancellable?

    init() {
        getOrganizations()
    }

    func getOrganizations() {
        do {
            organizationSubscription = try MindMyLib.ApiService().getOrganizations()
                .decode(type: [Organization].self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: MindMyLib.NetworkManager.handleCompletion,
                      receiveValue: { [weak self] returnedOrganizations in
                          self?.organizations = returnedOrganizations
                          self?.organizationSubscription?.cancel()
                      })
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
