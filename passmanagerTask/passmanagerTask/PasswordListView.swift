//
//  passwordListView.swift
//  passmanagerTask
//
//  Created by Manoj Amsavel on 9/19/24.
//

import SwiftUI

struct PasswordListView: View {
    @EnvironmentObject var passwordStore: PasswordStore
    @State private var showingAddPassword = false

    var body: some View {
        NavigationView {
           
            List {
               
                ForEach(passwordStore.passwords) { password in
                    NavigationLink(destination: AccountDetailView(password: password)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(password.accountType)
                                    .font(.headline).tint(.pink)
                                Text(password.username)
                                    .font(.subheadline)
                                    .foregroundColor(.gray).tint(.pink)
                            }
                            Spacer()
                            SecureField("", text: .constant(password.password)) // Masked password
                                .disabled(true)
                        }
                    }
                }
                .onDelete(perform: passwordStore.deletePassword)
            }
            .navigationTitle("Password Manager")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddPassword.toggle() }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddPassword) {
                AddPasswordView()
            }
            
           
        }
    }
}

