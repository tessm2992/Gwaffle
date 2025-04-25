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
                VStack(spacing:70) {
                    VStack(spacing: 24) {
                        Text("What's your name?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.top, 200)
                        Text("Your name will not be displayed on your profile.")
                            .font(.footnote)
                        HStack {
                            TextField("First name", text: $userEmail)
                                .textInputAutocapitalization(.never)
                                .padding(12)
                                .background(.white)
                                .frame(width: (proxy.size.width / 2) + 5, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            Spacer()
                            TextField("Last name", text: $userEmail)
                                .textInputAutocapitalization(.never)
                                .padding(12)
                                .background(.white)
                                .frame(width: (proxy.size.width / 2) + 5, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        }
                        NavigationLink{
                            GenderView()
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
    AddNameView()
}
