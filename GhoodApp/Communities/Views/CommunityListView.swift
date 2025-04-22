//
//  CommunityListView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct CommunityListView: View {
    @Binding var selectedTab: Int
    @State private var showCreateGroup: Bool = false
    
    
    var body: some View {
        GeometryReader { proxy in
            NavigationStack {
                VStack(spacing: 0) {
                    HStack(spacing: -12) {
                        HomeLogo(selectedTab: $selectedTab)
                        Text("Communities")
                            .font(.system(size: 20,weight: .bold))
                            .foregroundStyle(Color(ghoodPink))
                            .padding(.bottom,4)
                    }
                    
                    ScrollView  {
                        CapsuleSearchBar()
                            .padding(.bottom,10)
                        Button(action: {
                            showCreateGroup.toggle()
                        }, label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50,height: 50)
                                    .foregroundColor(Color(.systemGray3))
                                Text("Create a community")
                                    .font(.system(size: 17,weight: .semibold))
                                    .foregroundStyle(Color(.black))
                                Spacer()
                            }
                        })
                        .fullScreenCover(isPresented: $showCreateGroup, content: {
                            CreateNewGroupView()
                        })
                        .padding(.horizontal)
                        DividerThinnestView(width: proxy.size.width - 15)
                        VStack {
                            ForEach(0..<4) { _ in
                                CommunityTile()
                                DividerThinnestView(width: proxy.size.width - 15)
                            }
                        }
                        Spacer()
                            .frame(height: 20)
                        NavigationLink {
                            CommunityExploreView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            HStack {
                                Text("Explore Communities")
                                    .font(.system(size: 20,weight: .semibold))
                                    .foregroundStyle(Color(ghoodPink))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color(ghoodPink))
                                    .fontWeight(.bold)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var selectedTab = 1
        
        var body: some View {
            CommunityListView(selectedTab: $selectedTab)
        }
    }
    return PreviewWrapper()
}
