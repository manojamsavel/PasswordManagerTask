//
//  passwordStore.swift
//  passmanagerTask
//
//  Created by Manoj Amsavel on 9/19/24.
//

import Foundation

class PasswordStore: ObservableObject {
    @Published var passwords: [PasswordEntry] = [] {
        didSet {
            savePasswords()
        }
    }

    private let passwordKey = "SavedPasswords"

    init() {
        loadPasswords()
    }

    func addPassword(accountType: String, username: String, password: String) {
        let newPassword = PasswordEntry(id: UUID(), accountType: accountType, username: username, password: password)
        passwords.append(newPassword)
    }

    func editPassword(id: UUID, newPassword: String) {
        if let index = passwords.firstIndex(where: { $0.id == id }) {
            passwords[index].password = newPassword
        }
    }

    func deletePassword(at offsets: IndexSet) {
        passwords.remove(atOffsets: offsets)
    }

    private func savePasswords() {
        if let encoded = try? JSONEncoder().encode(passwords) {
            UserDefaults.standard.set(encoded, forKey: passwordKey)
        }
    }

    private func loadPasswords() {
        if let savedPasswords = UserDefaults.standard.data(forKey: passwordKey),
           let decoded = try? JSONDecoder().decode([PasswordEntry].self, from: savedPasswords) {
            passwords = decoded
        }
    }
}

