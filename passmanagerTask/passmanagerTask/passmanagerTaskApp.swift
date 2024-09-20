//
//  passmanagerTaskApp.swift
//  passmanagerTask
//
//  Created by Manoj Amsavel on 9/19/24.
//

import SwiftUI

@main
struct passmanagerTaskApp: App {
    @StateObject private var passwordStore = PasswordStore()

    var body: some Scene {
        WindowGroup {
            PasswordListView()
                .environmentObject(passwordStore)
        }
        }
    }
