//
//  SpotifyNewReleaseCell.swift
//  SpotifyClone
//
//  Created by Baisampayan Saha on 22/06/24.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    var imageName:  String = Constants.randomImage
    var headline: String? = "New release from"
    var subheadline:  String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - title"
    var onAddToPLaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16.0) {
            HStack(spacing: 8.0) {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .background(.spotifyDarkGray)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2, content: {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }//end of if
                    
                    if let subheadline {
                        Text(subheadline.capitalized)
                            .foregroundStyle(.spotifyWhite)
                            .fontWeight(.medium)
                            .font(.title2)
                            
                    }//end of if
                })//end of Vstack
            }//end of hstack
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                
                VStack (alignment: .leading, spacing: 32.0) {
                    VStack(alignment: .leading, spacing: 2.0) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                        }//end of if
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                                .lineLimit(2)
                        }//end of if
                    }//end of Vstack
                    
                    HStack(spacing: 0.0) {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .offset(x: -4)
                            .background(.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPLaylistPressed?()
                            }//end of onTap
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "play.circle.fill")
                            .font(.title)
                            .foregroundStyle(.spotifyWhite)
                            
                    }//end of Hstack
                    
                    
                }//end of Vstack
                .padding(.trailing)
                .padding(.vertical, 8.0)
                
                
            }
           //end of HStack
            .themeCOlors(isSelected: false)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .onTapGesture {
                onPlayPressed?()
            }
            
        }//end of Vstack
        .padding(.top)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        SpotifyNewReleaseCell()
            .padding()
    }
}
