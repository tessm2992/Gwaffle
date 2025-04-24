//
//  SideMenuRecentsView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/23/25.
//

import SwiftUI

struct SideMenuRecentsView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                HStack(spacing: 20) {
                    Text("Recently Visited")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(Color(ghoodPink))
                    Text("clear all")
                        .font(.system(size: 18))
                        .foregroundStyle(Color(ghoodPink))
                }
                .padding(.top, 100)
                .padding(.bottom, 10)
                VStack {
                    HStack(spacing: 30) {
                        HStack {
                            Image("threadpic")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40,height: 40)
                                .clipShape(Circle())
                            Text("g/summerhousebravo")
                                .font(.system(size: 16))
                        }
                        Image(systemName:"xmark")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 15,height: 15)
                    }
                    HStack(spacing: 30) {
                        HStack {
                            Image("threadpic")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40,height: 40)
                                .clipShape(Circle())
                            Text("g/summerhousebravo")
                                .font(.system(size: 16))
                        }
                        Image(systemName:"xmark")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 15,height: 15)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(ghoodLightPink))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    SideMenuRecentsView()
}
