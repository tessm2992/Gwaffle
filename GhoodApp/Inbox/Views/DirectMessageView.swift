//
//  DirectMessageView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import SwiftUI

struct DirectMessageView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
 
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Direct messages!!!")
            }
            .scrollIndicators(.hidden)
            .foregroundStyle(Color(.systemGray5))
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.bold)
                    })
                }
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        HStack {
                            Image("avatar")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20,height: 20)
                                .clipShape(Circle())
                            Text("tessm234")
                                .foregroundStyle(Color(.black))
                                .fontWeight(.bold)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DirectMessageView()
}
