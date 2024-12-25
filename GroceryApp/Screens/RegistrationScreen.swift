//
//  RegistrationScreen.swift
//  GroceryApp
//
//  Created by Rychillie Umpierre de Oliveira on 23/11/24.
//

import SwiftUI

struct RegistrationScreen: View {
    
    @EnvironmentObject private var model: GroceryModel
    @EnvironmentObject private var appState: AppState
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    
    private var isFormValid: Bool {
        !username.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace && (password.count >= 8 && password.count <= 16)
    }
    
    private func register() async {
        
        do {
            let registerResponseDTO = try await model.register(username: username, password: password)
            
            if !registerResponseDTO.error {
                // take the user to the login screen
                appState.routes.append(.login)
            }
           
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    var body: some View {
        Form {
            TextField("Username", text: $username)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
            
            HStack {
                Button("Register") {
                    Task {
                        await register()
                    }
                }.buttonStyle(.borderless)
                    .disabled(!isFormValid)
                
                Spacer()
                
                Button("Login") {
                    appState.routes.append(.login)
                }.buttonStyle(.borderless)
            }
            
            Text(errorMessage)
            
        }
        .navigationTitle("Registration")
        .navigationBarBackButtonHidden(true)
    }
}

struct RegistrationScreenContainer: View {
    
    @StateObject private var model = GroceryModel()
    @StateObject private var appState = AppState()
    
    var body: some View {
        NavigationStack(path: $appState.routes) {
            RegistrationScreen()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                        case .register:
                            RegistrationScreen()
                        case .login:
                            LoginScreen()
                        case .groceryCategoryList:
                            GroceryCategoryListScreen()
                        case .groceryCategoryDetail(let groceryCategory):
                            GroceryDetailScreen(groceryCategory: groceryCategory)
                    }
                }
        }
        .environmentObject(model)
        .environmentObject(appState)
    }
}

#Preview {
    RegistrationScreenContainer()
}
