//
//  CommunityExploreView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct CommunityExploreView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    @Environment(\.dismiss) private var dismiss
    private var gridItems: [GridItem] = [
        .init(.flexible(),spacing: 15),
        .init(.flexible(),spacing: 15),
    ]
    private var shortcutsArray: [(String,String,Color)] = [
        ("Local & Neighborhoods","gear",.orange),
        ("Creator Communities","gear",.blue),
        ("Support Groups","gear",.pink),
        ("Family & Parenting","gear",.green),
        ("Social & Hobbies","gear",.indigo),
        ("Identity-Based","gear",.mint),
    ]
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    CapsuleSearchBar()
                        .padding(.bottom,10)
                    HStack {
                        Text("Categories")
                            .font(.system(size: 20,weight: .semibold))
                            .foregroundStyle(Color(ghoodPink))
                        Spacer()
                    }
                    .padding(.top, 10)
                    LazyVGrid(columns: gridItems,spacing: 15) {
                        ForEach(0 ..< 6) { index in
                            NavigationLink {
                                CommunityDiscoverView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                ZStack(alignment: .bottomLeading) {
                                    Text(shortcutsArray[index].0)
                                        .font(.headline)
                                        .foregroundStyle(Color(.white))
                                        .padding(.top)
                                }
                                .padding(.horizontal)
                                .frame(width: proxy.size.width * 0.45,height: 100)
                                .background(shortcutsArray[index].2)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal)
                .foregroundStyle(Color(.systemGray5))
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {dismiss()}, label: {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(Color(ghoodPink))
                                .fontWeight(.bold)
                        })
                    }
                    ToolbarItem(placement: .principal) {
                        Button(action: {dismiss()}, label: {
                            Text("Explore Communities")
                                .foregroundStyle(Color(.black))
                                .fontWeight(.bold)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    CommunityExploreView()
}
