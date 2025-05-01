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
    @State private var mindText: String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Divider()
                VStack {
                    VStack {
                        TextField("Name your community",text: $mindText)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 10)
                            .foregroundStyle(Color(.systemGray))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .padding(.horizontal)
                    }
                    TextField("Describe your community so people know what it's about",text: $mindText)
                        .padding(.horizontal, 12)
                        .padding(.top, 5)
                        .padding(.bottom, 70)
                        .background(Color(ghoodPink.opacity(0.06)))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.horizontal)
                    Text("Private group")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color(.black))
                    Text("Only members can see who's in the group and what they post.")
                        .padding(.horizontal)
                    Text("Hide group")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color(.black))
                    Text("Only members can find this group")
                        .padding(.horizontal)
                    Text("Tags")
                        .font(.system(size: 20, weight: .semibold))
                    TextField("Drop down of options",text: $mindText)
                        .padding(.horizontal)
                }
                .padding(.horizontal)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                        })
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {}, label: {
                            Text("Create")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 100,height: 35)
                                .foregroundStyle(mindText.count == 0 ? Color(.darkGray) : .white)
                                .background(mindText.count == 0 ? Color(.systemGray5) : ghoodPink)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        })
                        .disabled(mindText.count == 0)
                    }
                }
            }
        }
    }
}

#Preview {
    CreateNewCommunityView()
}
