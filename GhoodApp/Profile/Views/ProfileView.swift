//
//  ProfileView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/18/25.
//

import SwiftUI

struct ProfileView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    @State private var tabOffset: CGFloat = 0
    @State private var pinned = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        VStack(spacing: 5) {
                            Image("avatar")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 110,height: 110)
                                .clipShape(Circle())
                                .padding(12)
                            Text("tessm345")
                                .font(.system(size: 27,weight: .bold))
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
                    .padding(.bottom, 10)
                    
                    
                    SwipeableTabsView()
                }
                .scrollIndicators(.hidden)
                .padding(.top, -60)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("Profile")
                                .foregroundStyle(Color(ghoodPink))
                                .font(.system(size: 20,weight: .semibold))
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
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


#Preview {
    ProfileView()
}
