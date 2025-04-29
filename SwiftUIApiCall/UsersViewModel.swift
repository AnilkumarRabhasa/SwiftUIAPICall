//
//  UsersViewModel.swift
//  SwiftUIApiCall
//
//  Created by Anilkumar on 28/04/25.
//
import Foundation

class UsersViewModel: ObservableObject {
    
    @Published var userData: [Users] = []

    func fetchUsersData(completion: @escaping() -> Void) {
        NetworkManager().fetchUsers(apiStr: "https://iosinsights.co.uk/users.json") { [weak self] usersData, error in
            if let userInfo = usersData {
                DispatchQueue.main.async {
                    self?.userData = userInfo
                    completion()
                 }
            }
        }
    }
}
