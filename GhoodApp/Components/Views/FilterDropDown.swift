//
//  FilterDropDown.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

enum FilterDropDownOption: String, CaseIterable, Equatable {
    case mostRecent = "Most Recent"
    case mostActive = "Most Active"
}
let ghoodPink = Color(red: 255/255, green: 41/255, blue: 91/255)
let ghoodLightPink = Color(red: 255/255, green: 250/255, blue: 251/255)

struct FilterDropDown: View {
    @Binding var selected: FilterDropDownOption
    @Binding var isExpanded: Bool
    
    var body: some View {
        if isExpanded {
            VStack(alignment: .leading, spacing: 6) {
                ForEach(FilterDropDownOption.allCases, id: \.self) { option in
                    Button(action: {
                        selected = option
                        withAnimation { isExpanded = false }
                    }) {
                        Text(option.rawValue)
                            .font(.system(size: 11))
                            .foregroundColor(ghoodPink)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(
                                selected == option ? Color.gray.opacity(0.1) : Color.clear
                            )
                            .cornerRadius(6)
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 3)
            .padding(.trailing)
            .offset(y: 45)
            .transition(.opacity.combined(with: .move(edge: .top)))
            .zIndex(1)
        }
    }
}

#Preview {
    struct FilterDropDownPreview: View {
        @State private var selected = FilterDropDownOption.mostRecent
        @State private var isExpanded = true

        var body: some View {
            ZStack {
                Color.gray.opacity(0.05).ignoresSafeArea()
                FilterDropDown(selected: $selected, isExpanded: $isExpanded)
                    .padding()
            }
        }
    }

    return FilterDropDownPreview()
}

