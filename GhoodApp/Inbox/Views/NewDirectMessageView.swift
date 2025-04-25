//
//  NewDirectMessageView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/23/25.
//

import SwiftUI

struct NewDirectMessageView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
 
    @Environment(\.dismiss) private var dismiss
    @State private var mindText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Search for people by username to chat with them")
                        .font(.system(size: 14))
                        .foregroundStyle(Color(.black))
                        .padding(.bottom, 10)
                        .padding(.horizontal)
                    CapsuleSearchBarThree()
                        .padding(.bottom, 10)
                    Text("Type at least 3 characters to search for a username.")
                        .font(.system(size: 14))
                        .foregroundStyle(Color(.black))
                        .padding(.horizontal)
                }
            }
            .scrollIndicators(.hidden)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.bold)
                    })
                }
                ToolbarItem(placement: .principal) {
                    Button(action: {dismiss()}, label: {
                        Text("New Message")
                            .foregroundStyle(Color(.black))
                            .fontWeight(.bold)
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Text("Create")
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
        }
    }
}

#Preview {
    NewDirectMessageView()
}
