//
//  OrganizationViewModel.swift
//  MindMyApp
//
//  Created by Filipe Patricio on 10/09/2024.
//

import Combine
import Foundation
import UIKit

class RowItemImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false

    private let rowItem: any RowItem
    private let imageDataService: ImageDataService
    private var cancellable = Set<AnyCancellable>()

    init(rowItem: any RowItem) {
        self.rowItem = rowItem
        self.imageDataService = ImageDataService(rowItem: rowItem)
        addSubscribers()
        self.isLoading = false
    }

    func addSubscribers() {
        imageDataService.$image.sink { [weak self] _ in
            self?.isLoading = false
        } receiveValue: { [weak self] returnedImage in
            self?.image = returnedImage
        }
        .store(in: &cancellable)
    }
}
