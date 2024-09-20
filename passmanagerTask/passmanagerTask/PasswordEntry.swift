//
//  passwordEntry.swift
//  passmanagerTask
//
//  Created by Manoj Amsavel on 9/19/24.
//
import Foundation

struct PasswordEntry: Identifiable, Codable {
    let id: UUID
    var accountType: String
    var username: String
    var password: String
}
