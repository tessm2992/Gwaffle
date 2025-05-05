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
    @State private var showImagePicker: Bool = false // To trigger ImagePicker
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 30) {
                // Image upload section
                HStack {
                    Button {
                        showImagePicker = true
                    } label: {
                        ZStack {
                            if let selectedImage = selectedImage {
                                Image(uiImage: selectedImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 120)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .clipped()
                            } else {
                                Image("uploadplaceholder")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                            }
                            
                            // Pencil icon with improved shadow
                            ZStack {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                                    .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 1)
                                    .offset(x: 48, y: 45)
                                
                                Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                                    .offset(x: 49, y: 45)
                            }
                        }
                    }
                    Spacer()
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(selectedImage: $selectedImage)
                }
                
                // Group Name TextField - improved alignment
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 0) {
                        Text("g/")
                            .font(.system(size: 25, weight: .semibold))
                        TextField("threadname", text: $groupName)
                            .padding(.vertical, 5)
                            .font(.system(size: 25, weight: .semibold))
                            .textInputAutocapitalization(.never)
                            .foregroundStyle(Color(.black))
                    }
                }
                
                // Group Description TextField with character limit and text wrapping
                VStack(alignment: .leading, spacing: 5) {
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $groupDescription)
                            .frame(minHeight: 60)
                            .font(.system(size: 20))
                            .foregroundStyle(Color(.black))
                            .background(Color.clear)
                            .lineLimit(nil)
                            .onChange(of: groupDescription) { newValue in
                                if newValue.count > 200 {
                                    groupDescription = String(newValue.prefix(250))
                                }
                            }
                        
                        if groupDescription.isEmpty {
                            Text("Describe the thread...")
                                .font(.system(size: 20))
                                .foregroundColor(.gray.opacity(0.7))
                                .padding(.top, 8)
                                .padding(.leading, 5)
                        }
                    }
                    
                    Text("\(groupDescription.count)/200")
                        .font(.caption)
                        .foregroundColor(groupDescription.count >= 200 ? .red : .gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("THREAD CATEGORY")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemGray))
                    
                    // Tags NavigationLink
                    NavigationLink {
                        AddCommunityTagsView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "plus")
                            Text("Add")
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

// Add this ImagePicker struct to handle the photo library selection
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let editedImage = info[.editedImage] as? UIImage {
                parent.selectedImage = editedImage
            } else if let originalImage = info[.originalImage] as? UIImage {
                parent.selectedImage = originalImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}



#Preview {
    CreateNewThreadPageView()
}
