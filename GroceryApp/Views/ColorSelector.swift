//
//  ColorSelector.swift
//  GroceryApp
//
//  Created by Rychillie Umpierre de Oliveira on 25/11/24.
//

import SwiftUI

enum Colors: String, CaseIterable {
    case green = "#2ecc71"
    case red = "#e74c3c"
    case blue = "#3498db"
    case purple = "#9b59b6"
    case yellow = "#f1c40f"
}

struct ColorSelector: View {
    
    @Binding var colorCode: String
    
    var body: some View {
        HStack {
            ForEach(Colors.allCases, id: \.rawValue) { color in
                VStack {
                    Image(systemName: colorCode == color.rawValue ? "record.circle.fill" : "circle.fill")
                        .font(.title)
                        .foregroundStyle(Color.fromHex(color.rawValue))
                        .clipShape(Circle())
                        .onTapGesture {
                            colorCode = color.rawValue
                        }
                }
            }
        }
    }
}

#Preview {
    ColorSelector(colorCode: .constant("#2ecc71"))
}
