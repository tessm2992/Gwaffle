//
//  StaticCoverBanner.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct StaticCoverBanner: View {
    var image: UIImage?
    var imageOffset: CGSize

    var body: some View {
        ZStack {
            Rectangle().fill(Color.gray.opacity(0.2))
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 180)
                    .offset(imageOffset)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
        .frame(height: 180)
    }
}


#Preview {
    StaticCoverBanner(
        image: UIImage(named: "TinxCoverPhoto"),
        imageOffset: .zero
    )
}

