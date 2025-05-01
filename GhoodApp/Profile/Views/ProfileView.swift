//
//  ProfileView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/18/25.
//

import SwiftUI

struct ProfileView: View {
    var showBackButton: Bool = false
    
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    @State private var tabOffset: CGFloat = 0
    @State private var pinned = false
    @Environment(\.dismiss) private var dismiss
    init(showBackButton: Bool = false) {
            self.showBackButton = showBackButton
        }
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    VStack {
                        HStack {
                            Spacer()
                            VStack(spacing: 13) {
                                Image("avatar")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 110,height: 110)
                                    .clipShape(Circle())
                                HStack {
                                    Text("Tess M")
                                    Text("|")
                                        .foregroundStyle(Color(.systemGray))
                                    Text("@tessm345")
                                }
                                .font(.system(size: 25,weight: .bold))
                                .foregroundStyle(Color(.black))
                              
                                HStack {
                                    Text("28 y/o")
                                    Circle()
                                        .frame(width: 3, height: 3)
                                    Text("Seattle, WA")
                                }
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(Color(.systemGray))
                                NavigationLink{
                                    EditProfileView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    Text("Edit profile")
                                        .font(.headline)
                                        .foregroundStyle(.black)
                                        .frame(width: 120, height: 33)
                                        .background(Color(.systemGray6))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                    
                                }
                                .padding(.top, 10)
                            }
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        
                        SwipeableTabsView()
                    }
                    .scrollIndicators(.hidden)
                    .toolbar{
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink{
                                SettingsMenuView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Image(systemName: "line.3.horizontal")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(.black)
                                    .padding(.horizontal,4)
                            }
                        }
                        if showBackButton {
                            ToolbarItem(placement: .topBarLeading) {
                                Button(action: {dismiss()}, label: {
                                    Image(systemName: "chevron.left")
                                        .foregroundStyle(Color(.black))
                                })
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
