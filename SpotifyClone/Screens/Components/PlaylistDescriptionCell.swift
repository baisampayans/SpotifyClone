//
//  PlaylistDescriptionCell.swift
//  SpotifyClone
//
//  Created by Baisampayan Saha on 29/06/24.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    
    var descriptionText: String = Product.mock.description
    var username: String = "Nick"
    var subheadline: String = "Some headline goes here"
    var onAddToPlaylistPressed: (()-> Void)? = nil
    var onDownloadPressed: (()-> Void)? = nil
    var onSharePressed: (()-> Void)? = nil
    var onEllipsisPressed: (()-> Void)? = nil
    var onShufflePressed: (()-> Void)? = nil
    var onPlayPressed: (()-> Void)? = nil

    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(descriptionText)
                .foregroundStyle(.spotifyLightGray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            madeForYouSection
            
            Text(subheadline)
            
            buttonsRow
            
            
            
        }//end of Vstack
        .foregroundStyle(.spotifyLightGray)
        .font(.callout)
        .fontWeight(.medium)
    }//end of body
    
    private var madeForYouSection: some View {
        HStack(spacing: 8.0) {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            
            Text("Made for ")
            +
            Text(username)
                .bold()
                .foregroundStyle(.spotifyWhite)
        }//end of Hstack
    }
    
    
    private var buttonsRow: some View {
        HStack(spacing: 0.0) {
            HStack (spacing: 0.0) {
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
            }
            
            Spacer()
            
            HStack (spacing: 8) {
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 46))
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
            }//end of Hstack
            .foregroundStyle(.spotifyGreen)
        }//end of hstack
        .offset(x: -8)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        PlaylistDescriptionCell()
            .padding()
    }
}
