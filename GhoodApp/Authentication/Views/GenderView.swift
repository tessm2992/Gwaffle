//
//  GenderView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/24/25.
//

import SwiftUI

struct GenderView: View {
    @State private var userEmail = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack(alignment: .center) {
                    Text("About you")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top)
                    Text("Tell us about yourself")
                        .font(.footnote)
                        .padding(.bottom, 20)
                    VStack(spacing: 24) {
                        NavigationLink{
                            InterestsView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Female")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: proxy.size.width - 30, height: 44)
                                .background(ghoodPink)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                        NavigationLink{
                            InterestsView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Male")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: proxy.size.width - 30, height: 44)
                                .background(ghoodPink)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                        NavigationLink{
                            InterestsView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("I prefer not to say")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: proxy.size.width - 30, height: 44)
                                .background(ghoodPink)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                        Spacer()
                    }
                    HStack { Spacer()}
                    Spacer()
                }
                .background(Color(ghoodLightPink))
            }
        }
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {dismiss()}, label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(Color(ghoodPink))
                        .fontWeight(.bold)
                })
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    InterestsView()
                        .navigationBarBackButtonHidden()
                    } label: {
                        Text("Skip")
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.bold)
                }
            }
        }
    }
}
#Preview {
    GenderView()
}
