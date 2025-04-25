//
//  UserNamePasswordView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/24/25.
//

import SwiftUI

struct UserNamePasswordView: View {
    @State private var userEmail = ""
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack(spacing:70) {
                    Text("Create your username and password")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top)
                    Text("Your username is what you will go by here.")
                        .font(.footnote)
                    VStack(spacing: 24) {
                        TextField("Username", text: $userEmail)
                            .textInputAutocapitalization(.never)
                            .padding(12)
                            .background(.white)
                            .frame(width: proxy.size.width - 30, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        TextField("Password", text: $userEmail)
                            .textInputAutocapitalization(.never)
                            .padding(12)
                            .background(.white)
                            .frame(width: proxy.size.width - 30, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        NavigationLink{
                            AddNameView()
                            } label: {
                                Text("Continue")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .frame(width: proxy.size.width - 30, height: 44)
                                    .background(ghoodPink)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                
                        }
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
    }
}

#Preview {
    UserNamePasswordView()
}
