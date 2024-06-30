//
//  SpotifyHomeView.swift
//  SpotifyClone
//
//  Created by Baisampayan Saha on 19/06/24.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Categories? = nil
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                
                LazyVStack(spacing: 10,
                           pinnedViews: [.sectionHeaders],
                           content: {
                    Section {
                        VStack {
                            recentSection
                            
                            if let product = products.first {
                                newReleaseSection(product: product)
                            }//end of if let
                            
                            
                            listView
                            
                            
                        }//end of Vstack
                        .padding(.horizontal)
                        
                        
                        
                    } header: {
                        header
                    }
                })//end of lazyvstack
                .padding(.top, 8)
            }//end of scrollview
            .scrollIndicators(.hidden)
            .clipped()
            
        }//end of zstack
        .task {
            await getData()
        }
    }//end of body
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category.rawValue,
            title: product.title,
            subtitle: product.description) {
                
            } onPlayPressed: {
    
            }
    }//end of newReleaseSection
    
    
    
    private var header: some View {
        HStack (spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView()
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }

                }//end of if let statement
            } //end of zstack
            .frame(width: 30, height: 30)
            
            
            ScrollView(.horizontal) {
                HStack(spacing: 8, content: {
                    ForEach(Categories.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }) //end of HStack
                .padding(.horizontal)
            }//end of scrollview
            .scrollIndicators(.hidden)
        }//end of hstack
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background {
            Color.spotifyBlack
        }
    }//end of header
    
    
    private var recentSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                SpotifyRecentsCell(
                    imageName: product.firstImage,
                    title: product.title
                )
                .asButton(.press) {
                    
                }
            }
        }
    }
    
    
      
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first 
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map { $0.brand })
            for brand in allBrands {
                if let brand {
                    rows.append(ProductRow(title: brand.capitalized, products: products))
                }
                
                
            }
            productRows = rows
            
        } catch {
            
        }
    }//end of getData
    
    
    private var listView: some View {
        ForEach(productRows) { row in
            VStack(spacing: 8.0) {
                Text(row.title)
                    .foregroundStyle(.spotifyWhite)
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 16.0) {
                        ForEach(row.products) { product in
                            ImageTitleRowCell(
                                imageSize: 120,
                                imageName: product.firstImage,
                                title: product.title
                            )
                            .asButton(.press) {
                        
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }//end of scrollview
            }//end of vstack
            .padding(.horizontal)
        }
    }
}

#Preview {
    SpotifyHomeView()
}
