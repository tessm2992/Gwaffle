//
//  CommunityAboutView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/18/25.
//

import SwiftUI

struct CommunityAboutView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("About")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(Color(.black))
                                .padding(.bottom, 4)
                            Text("This is the community description. Any background of who the creator is or what the purpose of the group is will be featured here.")
                                .font(.system(size: 16))
                                .foregroundStyle(Color(.black))
                                .padding(.bottom,5)
                            NavigationLink{
                                CommunityExploreNewView()
                                    .navigationBarBackButtonHidden()
                                } label: {
                                Text("Creator Community")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                            }
                            }
                            .padding(.bottom, 5)
                            HStack(spacing: 10) {
                                Image(systemName: "lock.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 12,height: 12)
                                VStack(alignment: .leading) {
                                    Text("Private")
                                        .font(.system(size: 16))
                                        .foregroundStyle(Color(.black))
                                    Text("Only members can see who's in the group and what they post.")
                                        .font(.system(size: 12))
                                        .foregroundStyle(Color(.systemGray))
                                }
                            }
                            .padding(.bottom, 5)
                            HStack(spacing: 10) {
                                Image(systemName: "eye.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 12,height: 12)
                                VStack(alignment: .leading) {
                                    Text("Visible")
                                        .font(.system(size: 16))
                                        .foregroundStyle(Color(.black))
                                    Text("Anyone can find this group.")
                                        .font(.system(size: 12))
                                        .foregroundStyle(Color(.systemGray))
                                }
                            }
                            .padding(.bottom)
                        
                        VStack(alignment: .leading) {
                            Text("Rules")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(Color(.black))
                                .padding(.bottom, 3)
                            Text("1. No promotions or spam")
                                .padding(2)
                                .font(.system(size: 16))
                                .foregroundStyle(Color(.black))
                            Text("2. Be kind & respectful")
                                .padding(2)
                                .font(.system(size: 16))
                                .foregroundStyle(Color(.black))
                            Text("3. Respect everyone's privacy")
                                .padding(2)
                                .font(.system(size: 16))
                                .foregroundStyle(Color(.black))
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading) {
                            Text("Admins")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(Color(.black))
                                .padding(.bottom, 3)
                            ForEach(0 ..< 2) { index in
                                NavigationLink {
                                    ProfileVisitorView(showBackButton: false, showNickname: true)
                                } label: {
                                    HStack {
                                        Image("avatar")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 20,height: 20)
                                            .clipShape(Circle())
                                        Text("tessm345")
                                            .font(.system(size: 15))
                                            .foregroundStyle(Color(.black))
                                    }
                                }
                            }
                        }
                        .padding(.bottom)
                    }
                    .padding(.horizontal)
                    .padding(.top, 0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    .scrollIndicators(.hidden)
                    .foregroundStyle(Color(.systemGray5))
                    .toolbar{
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {dismiss()}, label: {
                                Image(systemName: "chevron.left")
                                    .foregroundStyle(Color(.black))
                            })
                        }
                        ToolbarItem(placement: .principal) {
                            Button(action: {dismiss()}, label: {
                                Text("Tinx's Army")
                                    .foregroundStyle(Color(.black))
                                    .font(.system(size: 20,weight: .semibold))
                            })
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CommunityAboutView()
}
