//
//  SpotifyPlaylistView.swift
//  SpotifyClone
//
//  Created by Baisampayan Saha on 29/06/24.
//

import SwiftUI
import SwiftfulUI

struct SpotifyPlaylistView: View {
    
    var product: Product = Product.mock
    var user: User = User.mock
    
    @State private var products: [Product] = []
    @State private var loadingError: String?
    @State private var showHeader: Bool = false
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12,
                           content: {
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand ?? "",
                        imageName: product.thumbnail
                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150 ? true : false
                    }
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        username: user.firstName,
                        subheadline: product.category.rawValue.capitalized,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal)
                    
                    
                    ForEach(products) { product in
                        SongRowView(
                            imageSize: 50,
                            imageName: product.firstImage,
                            title: product.title,
                            subtitle: product.brand) {
                                
                            } onEllipsisPressed: {
                                
                            }
                            .padding(.leading)

                    }
                    
                })
            }//end of scrollview
            .scrollIndicators(.hidden)
            
            ZStack {
                Text(product.title)
                    .font(.headline)
                    .foregroundStyle(.spotifyWhite)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(.spotifyBlack)
                    .offset(y: showHeader ? 0 : -40)
                    .opacity(showHeader ? 1 : 0)
                
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .padding(10)
                    .background(showHeader ? .spotifyBlack.opacity(0.001) : .spotifyGray.opacity(0.7))
                    .clipShape(Circle())
                    .onTapGesture {
                        
                    }
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundStyle(.spotifyWhite)
            .frame(maxHeight: .infinity, alignment: .top)
            .animation(.smooth(duration: 0.2), value: showHeader)
            
            
            
        }//end of zstack
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }//end of body
    
    private func getData() async {
        do {
            products = try await DatabaseHelper().getProducts()
            print(1)
        } catch {
            loadingError = error.localizedDescription
            print(loadingError ?? "error")
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
