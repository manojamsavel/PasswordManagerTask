//
//  AccountsDetailsview.swift
//  passmanagerTask
//
//  Created by Manoj Amsavel on 9/19/24.
//

import SwiftUI

struct AccountDetailView: View {
    @EnvironmentObject var passwordStore: PasswordStore
    var password: PasswordEntry
    @State private var showingEdit = false

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Account Details")) {
                    Text("Account Type: \(password.accountType)")
                    Text("Username/Email: \(password.username)")
                    SecureField("Password", text: .constant(password.password)) // Masked password
                        .disabled(true)
                }
            }
            
            HStack {
                Button(action: { showingEdit = true }) {
                    Text("Edit")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Button(action: {
                    if let index = passwordStore.passwords.firstIndex(where: { $0.id == password.id }) {
                        passwordStore.deletePassword(at: IndexSet(integer: index))
                    }
                }) {
                    Text("Delete")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationTitle("Account Details")
        .sheet(isPresented: $showingEdit) {
            EditPasswordView(password: password)
        }
    }
}
