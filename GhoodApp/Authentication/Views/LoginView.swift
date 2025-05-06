//
//  LoginView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/24/25.
//

import SwiftUI

struct LoginView: View {
    @State private var userEmail = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                // 🌈 Gradient background
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.4), Color.white.opacity(0.4)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                GeometryReader { proxy in
                    VStack(spacing:70) {
                        Spacer(minLength: 140)
                        VStack(alignment: .center, spacing: 10) {
                            Text("ghood.")
                                .font(.custom("Shrikhand-Regular", size: 45))
                                .foregroundStyle(.black.opacity(0.8))
                                .frame(width: 195, height: 30)
                            
                            Text("The app for girlhood")
                                .font(.system(.body, design: .monospaced))
                                .foregroundStyle(.black.opacity(0.8))
                                .frame(width: 250, height: 30)
                        }
                        VStack(spacing: 24) {
                            TextField("Mobile number or email address", text: $userEmail)
                                .textInputAutocapitalization(.never)
                                .padding(12)
                                .background(.white)
                                .frame(width: proxy.size.width - 70, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            TextField("Password", text: $userEmail)
                                .textInputAutocapitalization(.never)
                                .padding(12)
                                .background(.white)
                                .frame(width: proxy.size.width - 70, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            NavigationLink{
                                TabBarView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Text("Log In")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .frame(width: proxy.size.width - 70, height: 50)
                                    .background(.black.opacity(0.7))
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .shadow(color: Color.black.opacity(0.25), radius: 8, x: 4, y: 6) // Deep shadow
                                    .shadow(color: Color.white.opacity(0.2), radius: 2, x: -2, y: -2)
                                
                            }

                            NavigationLink{
                                AddEmailView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Text("Create new account")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color(.black.opacity(0.7)))
                                    .frame(width: proxy.size.width - 70, height: 50)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color(.black.opacity(0.7)),lineWidth: 1)
                                    }
                                
                            }
                            Button(action: {}, label: {
                                Text("Forgot your password?")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black.opacity(0.4))
                            })
                        }
                        HStack { Spacer()}
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
