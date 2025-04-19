//
//  ProfileView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/18/25.
//

import SwiftUI

struct ProfileView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    VStack(alignment: .leading) {
                        Image("avatar")
                        
                        Text("About")
                            .font(.system(size: 20))
                            .foregroundStyle(Color(.black))
                        Text("this is context on the community etc")
                            .font(.system(size: 20))
                            .foregroundStyle(Color(.black))
                    }
                    
                    .scrollIndicators(.hidden)
                    .toolbar{
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {dismiss()}, label: {
                                Image(systemName: "arrow.left")
                                    .foregroundStyle(Color(ghoodPink))
                                    .fontWeight(.bold)
                                    .font(.system(size: 20,weight:.semibold))
                            })
                        }
                        ToolbarItem(placement: .principal) {
                            HStack(spacing: 24) {
                                Text("Profile")
                                    .foregroundStyle(ghoodPink)
                                    
                            }
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            HStack(spacing: 24) {
                                Image(systemName: "gearshape.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(ghoodPink)
                            }
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
