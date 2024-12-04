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
    
    private func populateGroceryItems() async {
        do {
            try await model.populateGroceryItemsBy(groceryCategoryId: groceryCategory.id)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        VStack {
            if model.groceryItems.isEmpty {
                Text("No items found...")
            } else {
                GroceryItemList(groceryItems: model.groceryItems)
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
        .task {
            await populateGroceryItems()
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
