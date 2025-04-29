//
//  NetworkManager.swift
//  SwiftUIApiCall
//
//  Created by Anilkumar on 28/04/25.
//
import Foundation

class NetworkManager {
    func fetchUsers(apiStr: String, completion: @escaping ([Users]?, String?) -> Void) {
        guard let apiUrl = URL(string: apiStr) else {
            completion(nil, "Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: apiUrl) { data, response, error in
            guard let data = data else {
                completion(nil, "No data")
                return
            }

            do {
                let decoded = try JSONDecoder().decode(UsersData.self, from: data)
                completion(decoded.users, nil)
            } catch {
                print("Decoding error: \(error)") // Add print for debugging
                completion(nil, "Parsing error")
            }
        }.resume()
    }
}
