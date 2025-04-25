//
//  DirectMessageView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import SwiftUI

struct DirectMessageView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
 
    @Environment(\.dismiss) private var dismiss
    @State private var mindText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
               
                ScrollView {
                    VStack {
                        Text("[chat history]")
                            .foregroundStyle(.black)
                        Spacer(minLength: 20)
                    }
                    .padding(0)
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    TextField("Messsage",text: $mindText)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                        .foregroundStyle(.black)
                    Button(action: {}, label: {
                        Image(systemName: "paperplane.fill")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 60,height: 35)
                            .foregroundStyle(mindText.count == 0 ? Color(.darkGray) : .white)
                            .background(mindText.count == 0 ? Color(.systemGray5) : ghoodPink)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    })
                    .disabled(mindText.count == 0)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color(.systemBackground))
                .shadow(color: Color(.systemGray5), radius: 5, y: -2)
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.bold)
                    })
                }
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        HStack {
                            Image("avatar")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20,height: 20)
                                .clipShape(Circle())
                            Text("tessm234")
                                .foregroundStyle(Color(.black))
                                .fontWeight(.bold)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DirectMessageView()
}
