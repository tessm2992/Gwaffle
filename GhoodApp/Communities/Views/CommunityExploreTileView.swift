//
//  CommunityExploreTileView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/28/25.
//

import SwiftUI

struct CommunityExploreTileView: View {
    let onFollow: () -> Void
    let ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    var body: some View {
        NavigationLink {
            CommunityPageView()
                .navigationBarBackButtonHidden()
            } label: {
                VStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Image("TinxCoverPhoto")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 110,height: 110)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Text("Tinx's Army")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundColor(.black)
                                    Spacer()
                                    Button(action: onFollow) {
                                        Text("Join")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 4)
                                            .background(Color(ghoodPink))
                                            .cornerRadius(20)
                                    }
                                }
                                Text("19.7k members")
                                    .font(.system(size: 12, weight: .semibold))
                                        .foregroundStyle(Color(.systemGray))
                                Text("This is the community description. Any background on the group's premise ...")
                                    .font(.system(size: 12))
                                    .foregroundColor(.black)
                                HStack {
                                    Text("Creator Community")
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(10)
                                }
                            }
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

#Preview {
    CommunityExploreTileView(onFollow: { print("Followed!")})
}
