//
//  ContentView.swift
//  SpotifyClone
//
//  Created by Baisampayan Saha on 19/06/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    @State private var localisedError: String?
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(products) { product in
                    Text(product.title)
                        .foregroundStyle(.spotifyGreen)
                }
            }//end of vstack
            .padding()
            .task {
                await getData()
        }
        }//end of scrollview
    }//end of body
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
            localisedError = error.localizedDescription
            print(localisedError ?? "error")
        }
    }
}

#Preview {
    ContentView()
}
