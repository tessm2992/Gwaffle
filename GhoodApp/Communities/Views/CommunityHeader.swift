//
//  CommunityHeader.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct CommunityHeader: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    @Binding var groupName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                NavigationLink {
                    CommunityAboutView()
                        .navigationBarBackButtonHidden()
                } label: {
                    VStack(alignment: .leading,spacing: 3) {
                        HStack {
                            Text(groupName)
                                .font(.system(size: 25,weight: .semibold))
                                .foregroundStyle(Color(.black))
                            Image(systemName: "chevron.right")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 8, height: 8)
                                .foregroundStyle(Color(.black))
                        }
                        HStack {
                            Image(systemName: "lock.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 9, height: 9)
                            Text("Private group")
                                .font(.system(size: 12))
                            Circle()
                                .frame(width: 3, height: 3)
                            HStack(spacing: 4) {
                                Text("19.7k")
                                    .font(.system(size: 12,weight: .semibold))
                                Text("members")
                                    .font(.system(size: 12))
                            }
                        }
                        .foregroundStyle(Color(.systemGray))
                    }
                }
                Spacer()
                JoinButton()
            }
            .padding(.horizontal)
            NavigationLink {
                MembersMainView()
                    .navigationBarBackButtonHidden()
            } label: {
                CommunityAvatarsView()
            }
            
        }
    }
    init(groupName: Binding<String> = .constant("Tinx's Army")) {
           self._groupName = groupName
   }
}

#Preview {
    CommunityHeader()
}
