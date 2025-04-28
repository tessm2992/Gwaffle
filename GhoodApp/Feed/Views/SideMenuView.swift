//
//  SideMenuView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/22/25.
//

import SwiftUI

struct SideMenuView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    DividerThinView(width: proxy.size.width)
                    NavigationLink {
                        ExploreThreadsView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Explore Threads")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color(.black))
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                    }
                    
                    DividerThinView(width: proxy.size.width)
                    
                    NavigationLink {
                        SideMenuRecentsView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack {
                            Text("Recently Visited")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(Color(.black))
                            Text("see all")
                                .font(.system(size: 18))
                                .foregroundStyle(Color(.black))
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    }
                    
                    VStack {
                        ForEach(0..<3) { _ in
                            HStack {
                                Image("threadpic")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 35,height: 35)
                                    .clipShape(Circle())
                                Text("g/summerhousebravo")
                                    .font(.system(size: 16))
                                    .foregroundStyle(Color(ghoodPink))
                            }
                        }
                    }
                    .padding(.bottom, 10)
                    
                    DividerThinView(width: proxy.size.width)
                    
                    Text("My Threads")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(Color(.black))
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                    
                    VStack {
                        ForEach(0..<10) { _ in
                            HStack {
                                Image("threadpic")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 35,height: 35)
                                    .clipShape(Circle())
                                Text("g/summerhousebravo")
                                    .font(.system(size: 16))
                                    .foregroundStyle(Color(ghoodPink))
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10) // Safe area inset to prevent clipping at top
                .padding(.bottom, 50) // Safe area inset to prevent clipping at bottom
            }
            .scrollIndicators(.hidden)
            .background(Color(.white))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    SideMenuView()
}
