//
//  AddGroceryCategoryScreen.swift
//  GroceryApp
//
//  Created by Rychillie Umpierre de Oliveira on 25/11/24.
//

import SwiftUI
import GroceryAppSharedDTO

struct AddGroceryCategoryScreen: View {
    
    @EnvironmentObject private var model: GroceryModel
    
    @State private var title: String = ""
    @State private var colorCode: String = "#2ecc71"
    
    @Environment(\.dismiss) private var dismiss
    
    private func saveGroceryCategory() async {
        
        let groceryCategoryRequestDTO = GroceryCategoryRequestDTO(title: title, colorCode: colorCode)
        
        do {
            try await model.saveGroceryCategory(groceryCategoryRequestDTO)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhiteSpace
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            ColorSelector(colorCode: $colorCode)
        }
        .navigationTitle("New Category")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    Task {
                        await saveGroceryCategory()
                    }
                }
                .disabled(!isFormValid)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddGroceryCategoryScreen()
            .environmentObject(GroceryModel())
    }
}
