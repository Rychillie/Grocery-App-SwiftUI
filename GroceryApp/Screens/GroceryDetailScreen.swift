//
//  GroceryDetailScreen.swift
//  GroceryApp
//
//  Created by Rychillie Umpierre de Oliveira on 26/11/24.
//

import SwiftUI
import GroceryAppSharedDTO

struct GroceryDetailScreen: View {
    
    let groceryCategory: GroceryCategoryResponseDTO
    @State private var isPresented: Bool = false
    @EnvironmentObject private var model: GroceryModel
    
    var body: some View {
        VStack {
            List(1...10, id: \.self) { index in
                Text("Grocery Items: \(index)")
            }
        }
        .navigationTitle(groceryCategory.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add Grocery Item") {
                    isPresented = true
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            NavigationStack {
                AddGroceryItemScreen()
            }
        }
        .onAppear {
            model.groceryCategory = groceryCategory
        }
    }
}

#Preview {
    NavigationStack {
        GroceryDetailScreen(
            groceryCategory: GroceryCategoryResponseDTO(
                id: UUID(uuidString: "134f4a6d-59ce-4a7c-bcb7-87dd4bc97fda")!,
                title: "Seafood",
                colorCode: "#3498db"
            )
        )
        .environmentObject(GroceryModel())
    }
}
