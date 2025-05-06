//
//  EmailVerificationView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/24/25.
//

import SwiftUI

struct EmailVerificationView: View {
    @State private var userEmail = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack {
                    Text("Verify your email")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Enter the 6-digit code we sent to your email")
                        .font(.footnote)
                        .padding(.bottom, 20)
                    VStack(spacing: 24) {
                        TextField("Verification code", text: $userEmail)
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
                        VStack(spacing: 4) {
                            Text("By tapping the next arrow you agree to our")
                                .font(.footnote)
                                .foregroundColor(.secondary)

                            Text("Terms of Service and Privacy Policy")
                                .font(.footnote)
                                .foregroundColor(.blue)
                                .underline()
                                .onTapGesture {
                                    if let url = URL(string: "https://goodapp.com") {
                                        UIApplication.shared.open(url)
                                    }
                                }
                        }
                        .font(.footnote)
                        .padding(.bottom, 20)
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
                .background(Color(hex: "#F7F7F3"))
            }
        }
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {dismiss()}, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color(.black.opacity(0.7)))
                        .fontWeight(.semibold)
                })
            }
        }
    }
}

#Preview {
    EmailVerificationView()
}
