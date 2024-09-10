//
//  ItemModel.swift
//  MindMyApp
//
//  Created by Filipe Patricio on 10/09/2024.
//

protocol RowItem: Identifiable, Codable {
    var id: Int { get }
    var title: String { get }
    var avatarURL: String { get }
}
