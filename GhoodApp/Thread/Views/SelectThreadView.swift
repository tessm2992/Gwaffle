//
//  SelectThreadView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/27/25.
//

import SwiftUI

struct SelectThreadView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            CapsuleSearchBarTwo()
            ForEach(0..<4) { _ in
                SelectThreadSearchView()
                    .padding(.vertical, 5)
                DividerThinnestView(width: UIScreen.main.bounds.width)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                })
            }
        }
    }
}

#Preview {
    SelectThreadView()
}
