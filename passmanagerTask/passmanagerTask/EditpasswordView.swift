//
//  editpassword.swift
//  passmanagerTask
//
//  Created by Manoj Amsavel on 9/19/24.
//

import SwiftUI

struct EditPasswordView: View {
    @EnvironmentObject var passwordStore: PasswordStore
    var password: PasswordEntry
    @State private var newPassword = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Password")) {
                    SecureField("New Password", text: $newPassword)
                }
            }
            .navigationTitle("Edit \(password.accountType)")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        passwordStore.editPassword(id: password.id, newPassword: newPassword)
                    }
                }
            }
        }
    }
}
