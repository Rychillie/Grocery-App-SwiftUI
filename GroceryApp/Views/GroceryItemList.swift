//
//  GroceryItemList.swift
//  GroceryApp
//
//  Created by Rychillie Umpierre de Oliveira on 04/12/24.
//

import SwiftUI
import GroceryAppSharedDTO

struct GroceryItemList: View {
    
    let groceryItems: [GroceryItemResponseDTO]
    
    var body: some View {
        List {
            ForEach(groceryItems) { groceryItem in
                Text(groceryItem.title)
            }
        }
    }
}

#Preview {
    GroceryItemList(groceryItems: [])
}
