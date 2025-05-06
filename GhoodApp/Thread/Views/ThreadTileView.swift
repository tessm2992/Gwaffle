//
//  ThreadTileView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/27/25.
//

import SwiftUI

struct ThreadTileView: View {
    let onFollow: () -> Void
    
    var body: some View {
        NavigationLink {
            //the LoginView is a placeholder - it should be ThreadPageView (but viewmodel gets messed up)
            LoginView()
                .navigationBarBackButtonHidden()
            } label: {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image("threadpic")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 38,height: 38)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            VStack(alignment: .leading) {
                                Text("g/summerhousebravo")
                                    .font(.system(size: 15))
                                    .foregroundColor(.black)
                                Text("2.7k followers")
                                        .font(.system(size: 12))
                                        .foregroundStyle(Color(.systemGray))
                            }
                            Spacer()
                            Button(action: onFollow) {
                                Text("Follow")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 8)
                                    .background(ghoodPink)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
                    .background(Color.white)
                }
                .frame(width: 300)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
}

#Preview {
    ThreadTileView(onFollow: { print("Followed!")})
}
