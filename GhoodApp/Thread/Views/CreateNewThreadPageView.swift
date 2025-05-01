//
//  CreateNewThreadPageView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/1/25.
//

import SwiftUI

struct CreateNewThreadPageView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    @Environment(\.dismiss) private var dismiss
    @State private var groupName: String = "" // State for group name
    @State private var groupDescription: String = "" // State for group description
    @State private var isPrivateOn: Bool = false
    @State private var isHideOn: Bool = false
    @State private var selectedImage: UIImage? = nil // Image state for uploaded image
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 30) {
                VStack {
                    // Rounded rectangle image (or placeholder)
                    ZStack {
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.3))
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .clipped()
                        } else {
                            Image(systemName: "photo.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    // Upload button
                    Button(action: {
                        // Add image picking logic here
                        // For now, we'll simulate an image pick
                        self.selectedImage = UIImage(named: "exampleImage") // Replace with actual image picker
                    }) {
                        Text("Upload Image")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 120, height: 35)
                            .background(ghoodPink)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                }
                
                // Group Name TextField
                TextField("Thread title", text: $groupName)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundStyle(Color(.black))
                
                // Group Description TextField
                TextField("Describe the thread...", text: $groupDescription)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .font(.system(size: 20))
                    .foregroundStyle(Color(.black))
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("THREAD CATEGORY")
                    
                    // Tags NavigationLink
                    NavigationLink {
                        AddCommunityTagsView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "tag.fill")
                            Text("Tags")
                        }
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .frame(width: 90, height: 35)
                        .background(Color(.systemGray5))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("THREAD TAGS")
                    
                    // Tags NavigationLink
                    NavigationLink {
                        AddCommunityTagsView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "tag.fill")
                            Text("Tags")
                        }
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .frame(width: 90, height: 35)
                        .background(Color(.systemGray5))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    })
                }
                
                // Create Button with condition based on name and description fields
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Action for creating the group
                    }, label: {
                        Text("Create")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 100, height: 35)
                            .foregroundStyle((groupName.count == 0 || groupDescription.count == 0) ? Color(.darkGray) : .white)
                            .background((groupName.count == 0 || groupDescription.count == 0) ? Color(.systemGray5) : ghoodPink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    .disabled(groupName.isEmpty || groupDescription.isEmpty) // Disable if either field is empty
                }
            }
        }
    }
}


#Preview {
    CreateNewThreadPageView()
}
