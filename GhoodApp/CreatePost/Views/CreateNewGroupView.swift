//
//  CreateNewGroupView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct CreateNewGroupView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    @Environment(\.dismiss) private var dismiss
    @State private var mindText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Divider()
                Text("Name")
                TextField("Name your group",text: $mindText)
                    .padding(.horizontal)
                Text("Privacy")
                TextField("Name your group",text: $mindText)
                    .padding(.horizontal)
                Spacer()
                Divider()
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        Text("Create community")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 300,height: 35)
                            .foregroundStyle(mindText.count == 0 ? Color(.darkGray) : .white)
                            .background(mindText.count == 0 ? Color(.systemGray5) : ghoodPink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    .disabled(mindText.count == 0)
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
                }
            }
        }
    }
}

#Preview {
    CreateNewGroupView()
}
