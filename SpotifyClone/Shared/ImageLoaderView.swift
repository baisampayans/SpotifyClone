//
//  ImageLoaderView.swift
//  SpotifyClone
//
//  Created by Baisampayan Saha on 19/06/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString: String = Constants.randomImage
    var resizingMode: ContentMode = .fill
    
    var body: some View {
       Rectangle()
            .opacity(0.001)
            .overlay {
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode )
                    .allowsHitTesting(false)
            }
            .clipped()
    }//end of body
}


#Preview {
    ImageLoaderView()
}
