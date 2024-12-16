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
    let onDelete: (UUID) -> Void
    
    private func deleteGroceryItem(at offsets: IndexSet) {
        offsets.forEach { index in
            let groceryItem = groceryItems[index]
            onDelete(groceryItem.id)
        }
    }
    
    var body: some View {
        List {
            ForEach(groceryItems) { groceryItem in
                Text(groceryItem.title)
            }.onDelete(perform: deleteGroceryItem)
        }
    }
}

#Preview {
    GroceryItemList(groceryItems: [], onDelete: { _ in })
}
