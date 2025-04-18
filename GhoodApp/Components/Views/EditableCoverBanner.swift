//
//  EditableCoverBanner.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI
import PhotosUI

struct EditableCoverBanner: View {
    @Binding var image: UIImage?
    @Binding var imageOffset: CGSize
    var onSave: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))

                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 180)
                        .offset(imageOffset)
                        .clipped()
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    imageOffset = gesture.translation
                                }
                        )
                } else {
                    Text("Upload a cover photo")
                        .foregroundColor(.gray)
                }
            }
            .frame(height: 180)
            .clipped()

            HStack {
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    HStack {
                        Image(systemName: "pencil")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.gray)
                            .padding(8)
                            .background(Color.white)
                        Text("Edit")
                    }
                }
                Button("Save", action: onSave)
                    .fontWeight(.semibold)
            }
        }
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    image = uiImage
                    imageOffset = .zero
                }
            }
        }
    }

    @State private var selectedItem: PhotosPickerItem? = nil
}


#Preview {
    struct EditableBannerPreviewWrapper: View {
        @State private var image: UIImage? = UIImage(named: "TinxCoverPhoto")
        @State private var offset: CGSize = .zero

        var body: some View {
            EditableCoverBanner(
                image: $image,
                imageOffset: $offset,
                onSave: { print("Saved!") }
            )
        }
    }

    return EditableBannerPreviewWrapper()
}

