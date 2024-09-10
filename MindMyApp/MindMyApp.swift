//
//  MindMyAppApp.swift
//  MindMyApp
//
//  Created by Filipe Patricio on 10/09/2024.
//

import SwiftUI

@main
struct MindMyApp: App {
    @StateObject var listViewModel: ListViewModel = .init()
    var body: some Scene {
        WindowGroup {
            ListView()
        }
    }
}
