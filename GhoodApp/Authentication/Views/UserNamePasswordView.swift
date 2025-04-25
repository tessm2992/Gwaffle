//
//  UserNamePasswordView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/24/25.
//

import SwiftUI

struct UserNamePasswordView: View {
    @State private var userEmail = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack {
                    VStack(alignment: .center, spacing: 6) {
                        Text("Create your username and password")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("Your username is what you will go by here. You will be able to modify this later.")
                            .font(.footnote)
                            .padding(.horizontal)
                    }
                    .padding(.top, 120)
                    .padding(.horizontal)
                    VStack(spacing: 24) {
                            HStack(spacing: 0) {
                                TextField("Enter a username", text: $userEmail)
                                    .textInputAutocapitalization(.never)
                                Text("*").foregroundColor(.red)
                            }
                            .padding(12)
                            .background(.white)
                            .frame(width: proxy.size.width - 30, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        SecureField("Password", text: $userEmail)
                            .textInputAutocapitalization(.never)
                            .padding(12)
                            .background(.white)
                            .frame(width: proxy.size.width - 30, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        NavigationLink{
                            AddNameView()
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
                        NavigationLink{
                            LoginView()
                                .navigationBarBackButtonHidden()
                            } label: {
                            Text("Already have an account?")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                        }
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
    UserNamePasswordView()
}
