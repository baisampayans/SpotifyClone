//
//  SongRowView.swift
//  SpotifyClone
//
//  Created by Baisampayan Saha on 29/06/24.
//

import SwiftUI

struct SongRowView: View {
    
    var imageSize: CGFloat = 50
    var imageName: String = Constants.randomImage
    var title: String = "Some song name goes here"
    var subtitle: String? = "Some artist name"
    var onCellPressed: (()-> Void)? = nil
    var onEllipsisPressed: (()-> Void)? = nil
    
    var body: some View {
        HStack(spacing: 8.0) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                if let subtitle {
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
                
            }//end of Vstack
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.callout)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    onEllipsisPressed?()
                }
            
                
        }
        .foregroundStyle(.red)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        VStack {
            SongRowView()
            SongRowView()
            SongRowView()
            SongRowView()
        }
    }
}
