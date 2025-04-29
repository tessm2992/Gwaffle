//
//  FilterDropDownButton.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct FilterDropDownButton: View {
    @Binding var selected: FilterDropDownOption
    @Binding var isExpanded: Bool

    var body: some View {
        Button(action: {
            withAnimation { isExpanded.toggle() }
        }) {
            HStack(spacing: 6) {
                Text(selected.rawValue)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.black)

                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 10, height: 5)
                    .rotationEffect(.degrees(isExpanded ? 180 : 0))
                    .foregroundColor(ghoodPink)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
        }
    }
}


#Preview {
    struct FilterDropDownButtonPreview: View {
        @State private var selected = FilterDropDownOption.mostRecent
        @State private var isExpanded = false

        var body: some View {
            FilterDropDownButton(selected: $selected, isExpanded: $isExpanded)
                .padding()
                .background(Color.gray.opacity(0.1))
        }
    }

    return FilterDropDownButtonPreview()
}

