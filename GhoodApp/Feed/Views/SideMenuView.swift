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
                    NavigationLink {
                        ExploreThreadsView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Explore Threads")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color(ghoodPink))
                            .padding(.bottom, 10)
                    }
                    DividerThinView(width: proxy.size.width)
                    NavigationLink {
                        SideMenuRecentsView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 20) {
                            Text("Recently Visited")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(Color(ghoodPink))
                            Text("see all")
                                .font(.system(size: 18))
                                .foregroundStyle(Color(ghoodPink))
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
                                    .frame(width: 40,height: 40)
                                    .clipShape(Circle())
                                Text("g/summerhousebravo")
                                    .font(.system(size: 16))
                            }
                        }
                    }
                    .padding(.bottom, 10)
                    DividerThinView(width: proxy.size.width)
                    HStack(spacing: 20) {
                        Text("My Threads")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color(ghoodPink))
                        Text("see all")
                            .font(.system(size: 18))
                            .foregroundStyle(Color(ghoodPink))
                    }
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                    
                    VStack {
                        ForEach(0..<15) { _ in
                            HStack {
                                Image("threadpic")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40,height: 40)
                                    .clipShape(Circle())
                                Text("g/summerhousebravo")
                                    .font(.system(size: 16))
                            }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(ghoodLightPink))
                .edgesIgnoringSafeArea(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    SideMenuView()
}
