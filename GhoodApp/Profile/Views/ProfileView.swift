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
                    VStack {
                        HStack {
                            Spacer()
                            VStack(spacing: 5) {
                                Image("avatar")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 130,height: 130)
                                    .clipShape(Circle())
                                    .padding(15)
                                Text("tessm345")
                                    .font(.system(size: 28,weight: .bold))
                                    .foregroundStyle(Color(.black))
                                HStack {
                                    Text("28 y/o")
                                    Text("Seattle, WA")
                                }
                                .font(.system(size: 17,weight: .bold))
                                .foregroundStyle(Color(.systemGray2))
                            }
                            Spacer()
                        }
                        
                    }
                    .scrollIndicators(.hidden)
                    .toolbar{
                        ToolbarItem(placement: .principal) {
                            HStack(spacing: 24) {
                                Text("Profile")
                                    .foregroundStyle(Color(ghoodPink))
                                    .font(.system(size: 20,weight: .semibold))
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
