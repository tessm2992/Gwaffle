//
//  ParallaxEditableHeader.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/18/25.
//

import SwiftUI
import PhotosUI

struct ParallaxEditableHeader: View {
    @Binding var image: UIImage?
    @Binding var imageOffset: CGSize
    @Binding var selectedItem: PhotosPickerItem?
    let height: CGFloat

    var body: some View {
        GeometryReader { geo in
            let y = geo.frame(in: .global).minY

            ZStack(alignment: .bottomTrailing) {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: max(height + (y > 0 ? y : 0), height))
                        .offset(y: y > 0 ? -y : 0)
                        .clipped()
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    imageOffset = gesture.translation
                                }
                        )
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: height)
                        .overlay(Text("Upload a cover photo").foregroundColor(.gray))
                }

                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.blue)
                        .padding(6)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                }
                .padding(12)
            }
            .frame(height: height)
        }
        .frame(height: height)
    }
}


#Preview {
    struct ParallaxHeaderPreviewWrapper: View {
        @State private var image: UIImage? = UIImage(named: "TinxCoverPhoto")
        @State private var offset: CGSize = .zero
        @State private var selectedItem: PhotosPickerItem? = nil

        var body: some View {
            ParallaxEditableHeader(
                image: $image,
                imageOffset: $offset,
                selectedItem: $selectedItem,
                height: 250
            )
        }
    }

    return ParallaxHeaderPreviewWrapper()
}

