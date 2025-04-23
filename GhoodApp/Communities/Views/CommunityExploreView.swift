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
    private var shortcutsArray: [(String,String)] = [
        ("Local & Neighborhoods","gear"),
        ("Creator Communities","gear"),
        ("Support Groups","gear"),
        ("Family & Parenting","gear"),
        ("Social & Hobbies","gear"),
        ("Identity-Based","gear"),
    ]
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
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
                            VStack(alignment: .leading) {
                                HStack { Spacer() }
                                Spacer()
                                Text(shortcutsArray[index].0)
                                    .font(.headline)
                                    .foregroundStyle(Color(.white))
                                HStack { Spacer() }
                        }
                        .padding(.horizontal)
                        .frame(width: proxy.size.width * 0.45,height: 100)
                        .background(ghoodPink.opacity(0.8))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Explore Communities")
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
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.bold)
                    })
                }
                
            }
        }
    }
}

#Preview {
    CommunityExploreView()
}
