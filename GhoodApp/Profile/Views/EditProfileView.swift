//
//  EditProfileView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/27/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    
    // State variables
    @State private var showingOptions = false
    @State private var showingPhotoPicker = false
    @State private var profileImage: UIImage? = UIImage(named: "avatar")
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack {
                    HStack {
                        Spacer()
                        VStack {
                            if let profileImage {
                                Image(uiImage: profileImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .padding(12)
                            } else {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.gray)
                                    .padding(12)
                            }
                            
                            Button("Edit picture or avatar") {
                                showingOptions = true
                            }
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundStyle(Color(.blue))
                        }
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    
                    VStack(alignment: .leading) {
                        DividerThinnestView(width: proxy.size.width - 15)
                        HStack(spacing: 52) {
                            Text("Name")
                            Text("Tess M")
                        }
                        .padding(.vertical, 10)
                        DividerThinnestView(width: proxy.size.width - 15)
                        HStack(spacing: 20) {
                            Text("Username")
                            Text("@tessm345")
                        }
                        .padding(.vertical, 10)
                        DividerThinnestView(width: proxy.size.width - 15)
                        HStack(spacing: 43) {
                            Text("Gender")
                            Text("Female")
                        }
                        .padding(.vertical, 10)
                        DividerThinnestView(width: proxy.size.width - 15)
                    }
                    .padding(.horizontal)
                }
            }
            .confirmationDialog("Change Profile Picture", isPresented: $showingOptions, titleVisibility: .visible) {
                Button("Choose from Library") {
                    showingPhotoPicker = true
                }
                
                Button("Remove Current Picture", role: .destructive) {
                    profileImage = nil
                }
                
                Button("Cancel", role: .cancel) {}
            }
            .photosPicker(isPresented: $showingPhotoPicker, selection: $selectedItem, matching: .images)
            // Here's where the changed code goes
            .onChange(of: selectedItem) { _, item in
                Task {
                    if let data = try? await item?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        await MainActor.run {
                            profileImage = uiImage
                        }
                    }
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {dismiss()}, label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(Color(ghoodPink))
                })
            }
            ToolbarItem(placement: .principal) {
                Text("Edit profile")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(Color(.black))
            }
        }
    }
    
    // If you're using the helper function approach:
    func processSelectedItem(_ item: PhotosPickerItem?) {
        Task {
            if let data = try? await item?.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                await MainActor.run {
                    profileImage = uiImage
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
