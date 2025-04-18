//
//  CommentView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/18/25.
//

import SwiftUI

struct CommentView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        NavigationLink {
                            ProfileView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Image("avatar")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20,height: 20)
                                .clipShape(Circle())
                        }
                        NavigationLink {
                            ProfileView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("tessm234")
                                .font(.system(size: 13,weight: .semibold))
                                .foregroundStyle(ghoodPink.opacity(0.7))
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical,2)
                    Text("I'm elaborating on the head of this post. So I'm asking everyone else for advice. You know what I mean? Or no?")
                        .font(.system(size: 12))
                        .foregroundStyle(Color(.black))
                        .padding(.horizontal)
                        .padding(.top, 0)
                    HStack(spacing: 7) {
                        Text("1h")
                            .font(.system(size: 11))
                            .foregroundStyle(Color(.systemGray))
                            .padding(.top, 2)
                        Text("Like")
                            .font(.system(size: 11))
                            .foregroundStyle(Color(.systemGray))
                            .padding(.top, 2)
                        Text("Reply")
                            .font(.system(size: 11))
                            .foregroundStyle(Color(.systemGray))
                            .padding(.top, 2)
                        Spacer()
                        Text("18")
                            .foregroundStyle(Color(ghoodPink))
                        Image(systemName: "hand.thumbsup.circle.fill")
                            .resizable()
                            .frame(width: 18,height: 18)
                            .foregroundStyle(Color(ghoodPink))
                    }
                    .padding(.horizontal)
                    .font(.system(size: 13))
                }
                
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Threads")
            .foregroundStyle(Color(.systemGray5))
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.bold)
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {dismiss()}, label: {
                        Text("g/summerhousebravo")
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.bold)
                    })
                }
                
            }
        }
    }
}

#Preview {
    CommentView()
}
