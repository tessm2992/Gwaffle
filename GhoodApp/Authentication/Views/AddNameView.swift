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
                    Text("Your name will only be visible when joining Communities")
                        .font(.footnote)
                        .padding(.bottom, 20)
                    VStack(spacing: 24) {
                        TextField("Display name", text: $userEmail)
                            .textInputAutocapitalization(.never)
                            .padding(12)
                            .background(.white)
                            .frame(width: proxy.size.width - 70, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        NavigationLink{
                            UserNamePasswordView()
                                .navigationBarBackButtonHidden()
                            } label: {
                                Text("Continue")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .frame(width: proxy.size.width - 70, height: 50)
                                    .background(Color(.blue.opacity(0.8)))
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                
                        }
                        Spacer()
                    }
                    HStack { Spacer()}
                    Spacer()
                }
                .background(Color(hex: "#F7F7F3"))
            }
        }
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {dismiss()}, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color(.black.opacity(0.7)))
                        .fontWeight(.bold)
                })
            }
        }
    }
}

#Preview {
    AddNameView()
}
