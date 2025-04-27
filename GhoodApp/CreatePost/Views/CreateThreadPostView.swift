//
//  CreateThreadPostView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import SwiftUI
import PhotosUI

struct CreateThreadPostView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    @Environment(\.dismiss) private var dismiss
    @State private var mindText: String = ""
    @State private var selectedPhotoItem: PhotosPickerItem?
    @State private var selectedPhoto: UIImage?
    @State private var showPhotoPicker = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Divider()
                HStack {
                    Image("avatar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40,height: 40)
                        .clipShape(Circle())
                    Text("tessm345")
                    
                }
                .padding()
                TextField("Submit a post for admin approval...",text: $mindText)
                    .padding(.horizontal)
                
                // Display selected photo if available
                if let selectedPhoto = selectedPhoto {
                    Image(uiImage: selectedPhoto)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 200)
                        .padding()
                }
                
                Spacer()
                Divider()
                HStack {
                    Spacer()
                    
                    // Photo/Video picker button
                    PhotosPicker(selection: $selectedPhotoItem,
                                matching: .any(of: [.images, .videos])) {
                        Image(systemName: "photo.fill.on.rectangle.fill")
                            .foregroundStyle(.green)
                    }
                    .onChange(of: selectedPhotoItem) { oldValue, newValue in
                        Task {
                            if let data = try? await newValue?.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data) {
                                selectedPhoto = uiImage
                            }
                        }
                    }
                    
                    Spacer()
                    Button(action:{}, label: {
                        Image(systemName: "face.smiling.fill")
                            .foregroundStyle(.blue)
                    })
                    Spacer()
                    Button(action:{}, label: {
                        Image(systemName: "photo.fill.on.rectangle.fill")
                            .foregroundStyle(.orange)
                    })
                    Spacer()
                }
            .navigationBarTitleDisplayMode(.inline)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(ghoodPink)
                            .fontWeight(.bold)
                    })
                }
                ToolbarItem(placement: .principal) {
                    Text("Create Post")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.black))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 80,height: 35)
                            .foregroundStyle(mindText.count == 0 ? Color(.darkGray) : .white)
                            .background(mindText.count == 0 ? Color(.systemGray5) : ghoodPink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    .disabled(mindText.count == 0)
                }
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    CreateThreadPostView()
}
