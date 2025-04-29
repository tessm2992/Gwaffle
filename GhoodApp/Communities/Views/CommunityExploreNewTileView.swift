//
//  CommunityExploreNewTileView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/28/25.
//

import SwiftUI

struct CommunityExploreNewTileView: View {
    let onFollow: () -> Void
    let ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    var body: some View {
        NavigationLink {
            LoginView()
                .navigationBarBackButtonHidden()
            } label: {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image("TinxCoverPhoto")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 90,height: 90)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            VStack(alignment: .leading) {
                                Text("Tinx's Army")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.black)
                                Text("2.7k followers")
                                    .font(.system(size: 12, weight: .semibold))
                                        .foregroundStyle(Color(.systemGray))
                                Text("This is the community description. Any ...")
                                    .font(.system(size: 12))
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            Button(action: onFollow) {
                                Text("Join")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 8)
                                    .background(Color(ghoodPink))
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
                    .background(Color.white)
                }
                .frame(width: 360)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
}

#Preview {
    CommunityExploreNewTileView(onFollow: { print("Followed!")})
}
