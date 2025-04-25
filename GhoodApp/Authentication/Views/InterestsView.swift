//
//  InterestsView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/24/25.
//

import SwiftUI

struct InterestsView: View {
    @State private var userEmail = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack {
                    Text("Interests")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top)
                    Text("Pick topics that are relevant to you")
                        .font(.footnote)
                    VStack(spacing: 24) {
                    NavigationLink{
                        TabBarView()
                            .navigationBarBackButtonHidden()
                        } label: {
                            Text("Create an account")
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
        }
    }
}

#Preview {
    InterestsView()
}
