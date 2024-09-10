//
//  ImageDataService.swift
//  MindMyApp
//
//  Created by Filipe Patricio on 10/09/2024.
//

import Combine
import Foundation
import MindMyLib
import UIKit

class ImageDataService {
    @Published var image: UIImage? = nil

    private var rowItem: any RowItem
    private var imageSubscription: AnyCancellable?

    init(rowItem: any RowItem) {
        self.rowItem = rowItem
        downloadImage(urlString: rowItem.avatarURL)
    }

    func downloadImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        imageSubscription = MindMyLib.ApiService().getImage(url: url)
            .tryMap { data -> UIImage? in
                UIImage(data: data)
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: MindMyLib.NetworkManager.handleCompletion,
                  receiveValue: { [weak self] returnedImage in
                      guard let self = self, let downloadedImage = returnedImage else { return }
                      self.image = downloadedImage
                      self.imageSubscription?.cancel()
                  })
    }
}
