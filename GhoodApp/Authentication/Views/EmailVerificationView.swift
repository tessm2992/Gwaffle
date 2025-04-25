//
//  EmailVerificationView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/24/25.
//

import SwiftUI

struct EmailVerificationView: View {
    @State private var userEmail = ""
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack(spacing:70) {
                    Text("Verify your email")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top)
                    Text("Enter the 6-digit code we sent to your email")
                        .font(.footnote)
                    VStack(spacing: 24) {
                        TextField("Verification code", text: $userEmail)
                            .textInputAutocapitalization(.never)
                            .padding(12)
                            .background(.white)
                            .frame(width: proxy.size.width - 30, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        NavigationLink{
                            UserNamePasswordView()
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
    EmailVerificationView()
}
