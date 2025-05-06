//
//  GenderView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/24/25.
//

import SwiftUI

struct GenderView: View {
    @State private var userEmail = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack(alignment: .center, spacing: 20) {
                    Text("Tell us about yourself")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top)
                    Text("This step helps prevent trolls and ensures you're here with real people")
                        .font(.footnote)
                        .padding(.bottom, 20)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Gender")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                        Text("Female")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: proxy.size.width - 30, height: 44)
                            .background(ghoodPink)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        Text("Male")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: proxy.size.width - 30, height: 44)
                            .background(ghoodPink)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Age (Years)")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                        Text("18-24")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: proxy.size.width - 30, height: 44)
                            .background(ghoodPink)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        Text("25-30")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: proxy.size.width - 30, height: 44)
                            .background(ghoodPink)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        Text("31-39")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: proxy.size.width - 30, height: 44)
                            .background(ghoodPink)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        Text("+ 40")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: proxy.size.width - 30, height: 44)
                            .background(ghoodPink)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("City")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                        TextField("Enter your city", text: $userEmail)
                            .textInputAutocapitalization(.never)
                            .padding(12)
                            .background(.white)
                            .frame(width: proxy.size.width - 30, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
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
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    TabBarView()
                        .navigationBarBackButtonHidden()
                    } label: {
                        Text("Finish")
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.bold)
                }
            }
        }
    }
}
#Preview {
    GenderView()
}
