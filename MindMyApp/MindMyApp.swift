//
//  MindMyAppApp.swift
//  MindMyApp
//
//  Created by Filipe Patricio on 10/09/2024.
//

import SwiftUI

@main
struct MindMyApp: App {
    @StateObject private var listViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            ListView().environmentObject(listViewModel)
        }
    }
}
