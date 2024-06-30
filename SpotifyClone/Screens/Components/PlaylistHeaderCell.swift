//
//  PlaylistHeaderCell.swift
//  SpotifyClone
//
//  Created by Baisampayan Saha on 29/06/24.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    
    var height: CGFloat = 300
    var title: String = "Some playlist title goes here"
    var subtitle: String = "Subtitle goes here"
    var imageName: String = Constants.randomImage
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                ImageLoaderView(urlString: imageName)
            }
            .overlay(alignment: .bottomLeading, content: {
                VStack(alignment: .leading, spacing: 8.0, content: {
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                })
                .foregroundStyle(.spotifyWhite)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(LinearGradient(colors: [shadowColor, shadowColor.opacity(0)], startPoint: .bottom, endPoint: .top))
            })
            .asStretchyHeader(startingHeight: height)
            
            
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        ScrollView {
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
}
