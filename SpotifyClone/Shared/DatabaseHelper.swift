//
//  DatabaseHelper.swift
//  SpotifyClone
//
//  Created by Baisampayan Saha on 19/06/24.
//

import Foundation


class DatabaseHelper {
    
    func getProducts() async throws -> [Product] {
        
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        print(products.products)
        return products.products
    }//end of getproducts
    
    func getUsers() async throws -> [User] {
        
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode(UserArray.self, from: data)
        
        return users.users
    }//end of getUsers
}





