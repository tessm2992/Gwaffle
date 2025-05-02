//
//  CreateNewCommunityView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct CreateNewCommunityView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    @Environment(\.dismiss) private var dismiss
    @State private var groupName: String = "" // State for group name
    @State private var groupDescription: String = "" // State for group description
    @State private var isPrivateOn: Bool = false
    @State private var isHideOn: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 40) {
                VStack(alignment: .leading) {
                    // Group Name TextField
                    TextField("Name your community", text: $groupName)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 10)
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundStyle(Color(.black))
                    
                    // Group Description with TextEditor for wrapping
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $groupDescription)
                            .padding(.horizontal, 8)
                            .font(.system(size: 20))
                            .foregroundStyle(Color(.black))
                            .frame(minHeight: 80)
                            .scrollContentBackground(.hidden)
                        
                        if groupDescription.isEmpty {
                            Text("Describe your community...")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                                .allowsHitTesting(false)
                        }
                    }
                }
                
                // Tags NavigationLink
                VStack(alignment: .leading, spacing: 10) {
                    Text("COMMUNITY TYPE")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemGray))
                    
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
                
                // Toggles for Private and Hide options
                VStack(alignment: .leading, spacing: 30) {
                    Toggle(isOn: $isPrivateOn) {
                        VStack(alignment: .leading) {
                            Text("Private group")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(Color(.black))
                            Text("Only members can see who's in the group and what they post.")
                                .foregroundStyle(Color(.systemGray))
                        }
                    }
                    .toggleStyle(SwitchToggleStyle(tint: ghoodPink))
                    
                    Toggle(isOn: $isHideOn) {
                        VStack(alignment: .leading) {
                            Text("Hide group")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(Color(.black))
                            Text("Only members can find this group.")
                                .foregroundStyle(Color(.systemGray))
                        }
                    }
                    .toggleStyle(SwitchToggleStyle(tint: ghoodPink))
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
    CreateNewCommunityView()
}
