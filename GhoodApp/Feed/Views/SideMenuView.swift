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
            VStack(alignment: .leading) {
                HStack(spacing: 20) {
                    Text("Recently Visited")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(Color(ghoodPink))
                    Text("see all")
                        .font(.system(size: 18))
                        .foregroundStyle(Color(ghoodPink))
                }
                .padding(.top, 100)
                .padding(.bottom, 10)
                VStack {
                    HStack {
                        Image("threadpic")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40,height: 40)
                            .clipShape(Circle())
                        Text("g/summerhousebravo")
                            .font(.system(size: 16))
                    }
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
                .padding(.bottom, 15)
                
                HStack(spacing: 20) {
                    Text("My Threads")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(Color(ghoodPink))
                    Text("see all")
                        .font(.system(size: 18))
                        .foregroundStyle(Color(ghoodPink))
                }
                .padding(.bottom, 10)
                .padding(.top, 20)
                VStack {
                    HStack {
                        Image("threadpic")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40,height: 40)
                            .clipShape(Circle())
                        Text("g/summerhousebravo")
                            .font(.system(size: 16))
                    }
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
                Spacer()
                
                DividerThinView(width: proxy.size.width)
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Image(systemName: "gearshape")
                            .frame(width: 24)
                        Text("Settings")
                            .padding(.vertical, 10)
                    }
                    HStack {
                        Image(systemName: "questionmark.circle")
                            .frame(width: 24)
                        Text("Help Center")
                            .padding(.vertical, 10)
                    }
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .frame(width: 24)
                        Text("Sign Out")
                            .padding(.vertical, 10)
                    }
                }
                .foregroundStyle(Color(ghoodPink))
                .padding(.bottom,100)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(ghoodLightPink))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    SideMenuView()
}
