//
//  AddNameView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/24/25.
//

import SwiftUI

struct AddNameView: View {
    @State private var userEmail = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack {
                    Text("What's your name?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("You can choose to keep your name hidden from your profile")
                        .font(.footnote)
                        .padding(.bottom, 20)
                    VStack(spacing: 24) {
                        TextField("Display name", text: $userEmail)
                            .textInputAutocapitalization(.never)
                            .padding(12)
                            .background(.white)
                            .frame(width: proxy.size.width - 30, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        NavigationLink{
                            UserNamePasswordView()
                                .navigationBarBackButtonHidden()
                            } label: {
                                Text("Continue")
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
                    UserNamePasswordView()
                        .navigationBarBackButtonHidden()
                    } label: {
                        Text("Skip")
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    AddNameView()
}
