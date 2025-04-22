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
                VStack {
                    Text("Name")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color(.black))
                    VStack {
                        TextField("Name your community",text: $mindText)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 10)
                            .background(Color(ghoodPink.opacity(0.06)))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .padding(.horizontal)
                    }
                    Text("Privacy")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color(.black))
                    Text("Choose visibility")
                        .padding(.horizontal)
                    Text("Visibility")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color(.black))
                    Text("Choose visibility")
                        .padding(.horizontal)
                    Text("Description")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color(.black))
                    TextField("Describer your community so people who what it's about",text: $mindText)
                        .padding(.horizontal, 12)
                        .padding(.top, 5)
                        .padding(.bottom, 70)
                        .background(Color(ghoodPink.opacity(0.06)))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.horizontal)
                    Text("Category")
                        .font(.system(size: 20, weight: .semibold))
                    TextField("Drop down of options",text: $mindText)
                        .padding(.horizontal)
                }
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
                
                .toolbar{
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
                        Text("Create Community")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

#Preview {
    CreateNewGroupView()
}
