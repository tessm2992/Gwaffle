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
            GeometryReader { proxy in
                VStack(spacing:70) {
                    Spacer()
                    VStack(alignment: .center, spacing: 10) {
                        Text("ghood.")
                            .font(.custom("Anton-Regular", size: 45))
                            .foregroundStyle(.black.opacity(0.8))
                            .frame(width: 125, height: 30)
                        
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
                                    .background(.blue.opacity(0.8))
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                
                        }
                        NavigationLink{
                            AddEmailView()
                                .navigationBarBackButtonHidden()
                            } label: {
                            Text("Create new account")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.blue.opacity(0.8)))
                                .frame(width: proxy.size.width - 70, height: 50)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color(.blue.opacity(0.8)),lineWidth: 1)
                                }
                                
                        }
                        Button(action: {}, label: {
                            Text("Forgot your password?")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black.opacity(0.8))
                        })
                    }
                    HStack { Spacer()}
                    Spacer()
                }
            }
            .background(Color(hex: "#F7F7F3"))
        }
    }
}

#Preview {
    LoginView()
}
