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
            LoginView()
                .navigationBarBackButtonHidden()
            } label: {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image("threadpic")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40,height: 40)
                                .clipShape(Circle())
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
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 8)
                                    .background(Color.blue)
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
