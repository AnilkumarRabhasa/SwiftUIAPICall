//
//  JsonData.swift
//  SwiftUIApiCall
//
//  Created by Anilkumar on 28/04/25.
//
import SwiftUI

struct Users: Identifiable, Codable {
    let id: Int
    let name: String
    let email: String
    let isActive: Bool
}

struct UsersData: Codable {
    let users: [Users]
}
