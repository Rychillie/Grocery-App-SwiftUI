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
    
    private func deleteGroceryItem(groceryItemId: UUID) {
        Task {
            do {
                try await model.deleteGroceryItem(
                    groceryCategoryId: groceryCategory.id,
                    groceryItemId: groceryItemId
                )
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        VStack {
            if model.groceryItems.isEmpty {
                Text("No items found...")
            } else {
                GroceryItemList(
                    groceryItems: model.groceryItems,
                    onDelete: deleteGroceryItem
                )
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
                id: UUID(uuidString: "134F4A6D-59CE-4A7C-BCB7-87DD4BC97FDA")!,
                title: "Seafood",
                colorCode: "#3498db"
            )
        )
        .environmentObject(GroceryModel())
    }
}
