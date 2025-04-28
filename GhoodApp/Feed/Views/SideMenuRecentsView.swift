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
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(spacing: 20) {
                        Text("Recently Visited")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color(.black))
                        Button(action: {
                            // Add delete action here
                        }, label: {
                            Text("clear all")
                                .font(.system(size: 18))
                                .foregroundStyle(Color(.black))
                        })
                    }
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                    
                    VStack(spacing: 15) {
                        ForEach(0..<20) { _ in
                            HStack(spacing: 20) {
                                HStack {
                                    Image("threadpic")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 35, height: 35)
                                        .clipShape(Circle())
                                    Text("g/summerhousebravo")
                                        .font(.system(size: 16))
                                        .foregroundStyle(Color(ghoodPink))
                                }
                                Button(action: {
                                    // Add delete action here
                                }, label: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 13, height: 13)
                                        .foregroundStyle(Color.gray)
                                })
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 50)
            }
            .scrollIndicators(.hidden)
            .background(Color(.white))
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {dismiss()}, label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(Color(ghoodPink))
                })
            }
        }
    }
}

#Preview {
    SideMenuRecentsView()
}
