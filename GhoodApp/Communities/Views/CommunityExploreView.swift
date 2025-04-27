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
    
    // Enhanced with icons and gradients
    private var shortcutsArray: [(String,String,Color,Color)] = [
        ("Local & Neighborhoods","mappin.circle.fill",.orange,.yellow),
        ("Creator Communities","sparkles",.blue,.cyan),
        ("Support Groups","heart.circle.fill",.pink,.red),
        ("Family & Parenting","figure.2.and.child.holdinghands",.green,.mint),
        ("Social & Hobbies","paintpalette.fill",.indigo,.purple),
        ("Identity-Based","person.3.fill",.mint,.teal),
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
                    
                    VStack(spacing: 13) {
                        ForEach(0 ..< 6) { index in
                            NavigationLink {
                                CommunityDiscoverView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                ZStack {
                                    // Gradient background
                                    LinearGradient(
                                        colors: [shortcutsArray[index].2, shortcutsArray[index].3],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                    
                                    // Icon in background
                                    Image(systemName: shortcutsArray[index].1)
                                        .font(.system(size: 80))
                                        .foregroundStyle(.white.opacity(0.1))
                                        .offset(x: 90, y: 0)
                                    
                                    // Content
                                    VStack(alignment: .leading, spacing: 8) {
                                        Image(systemName: shortcutsArray[index].1)
                                            .font(.system(size: 24))
                                            .foregroundStyle(.white)
                                        
                                        Spacer()
                                        
                                        Text(shortcutsArray[index].0)
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundStyle(.white)
                                            .multilineTextAlignment(.leading)
                                    }
                                    .padding(12)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                }
                                .frame(width: proxy.size.width * 0.92, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
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
