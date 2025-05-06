//
//  LoadScreenView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/4/25.
//

import SwiftUI

struct LoadScreenView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            HStack(spacing: 8) {
                VStack(spacing: 8) {
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 130)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 130)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                VStack(spacing: 8) {
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 130)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text ("ghood.")
                        .font(.custom("Anton-Regular", size: 40))
                        .frame(width: 125, height: 150)
                        .background(Color(hex: "#F0F0EA"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                VStack(spacing: 8) {
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}

#Preview {
    LoadScreenView()
}
