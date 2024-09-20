//
//  AddpasswordView.swift
//  passmanagerTask
//
//  Created by Manoj Amsavel on 9/19/24.
//

import SwiftUI

struct AddPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var passwordStore: PasswordStore
    @State private var accountType = ""
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Account Details")) {
                    TextField("Account Name", text: $accountType)
                    TextField("Username/Email", text: $username)
                    SecureField("Password", text: $password)
                }
            }
            .navigationTitle("Add New Account")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        passwordStore.addPassword(accountType: accountType, username: username, password: password)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}
