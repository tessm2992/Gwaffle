//
//  GenderView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/24/25.
//

import SwiftUI

struct GenderView: View {
    @State private var userEmail = ""
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack(alignment: .center) {
                    Text("About you")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top)
                    Text("Tell us about yourself")
                        .font(.footnote)
                        .padding(.bottom, 40)
                    Text("How do you identify?")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.bottom, 10)
                    NavigationLink{
                        InterestsView()
                        } label: {
                            Text("Female")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: proxy.size.width - 30, height: 44)
                                .background(ghoodPink)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    NavigationLink{
                        InterestsView()
                        } label: {
                            Text("Male")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: proxy.size.width - 30, height: 44)
                                .background(ghoodPink)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    NavigationLink{
                        InterestsView()
                        } label: {
                            Text("I prefer not to say")
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
}

#Preview {
    GenderView()
}
