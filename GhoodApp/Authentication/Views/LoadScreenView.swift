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
                    Image ("landing11")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("landing3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 130)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("landing2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 190)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("landing4")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("landing5")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("landing15")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                VStack(spacing: 8) {
                    Image ("landing7")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("landing17")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 170)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("landing1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text ("ghood.")
                        .font(.custom("Shrikhand-Regular", size: 32))
                        .foregroundColor(.black)
                        .frame(width: 125, height: 150)
                        .background(Color(hex: "#F0F0EA"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    Image ("landing14")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("landing12")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("landing6")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                VStack(spacing: 8) {
                    Image ("landing13")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 110)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("landing16")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("landing6")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("landing10")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("landing19")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125,height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image ("landing18")
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
