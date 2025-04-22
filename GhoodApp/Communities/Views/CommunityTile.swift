//
//  CommunityTile.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct CommunityTile: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink {
                CommunityPageView()
                    .navigationBarBackButtonHidden()
            } label: {
                HStack {
                    Image("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50,height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading,spacing: 0) {
                        Text("The Toast After Dark")
                            .font(.system(size: 17,weight: .semibold))
                            .foregroundStyle(Color(.black))
                        HStack {
                            Circle()
                                .frame(width: 5,height: 5)
                                .foregroundColor(.red)
                            Text("5 new posts")
                                .font(.system(size: 14))
                                .foregroundStyle(Color(.systemGray))
                        }
                    }
                    Spacer()
                    Text("10:30 AM")
                        .font(.system(size: 14))
                        .foregroundStyle(Color(.systemGray))
                    
                }
            }
            .padding(.horizontal)
            .padding(.vertical,3)
        }
    }
}


#Preview {
    CommunityTile()
}
