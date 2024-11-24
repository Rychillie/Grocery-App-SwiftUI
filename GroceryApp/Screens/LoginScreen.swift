//
//  LoginScreen.swift
//  GroceryApp
//
//  Created by Rychillie Umpierre de Oliveira on 23/11/24.
//

import SwiftUI

struct LoginScreen: View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var model: GroceryModel
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    
    private var isFormValid: Bool {
        !username.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace
    }
    
    private func login() async {
        do {
            let loginResponseDTO = try await model.login(username: username, password: password)
            if loginResponseDTO.error {
                errorMessage = loginResponseDTO.reason ?? ""
            } else {
                // take the user to grocery categories list screen
                appState.routes.append(.groceryCategoryList)
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
                Button("Login") {
                    Task {
                        await login()
                    }
                }.buttonStyle(.borderless)
                .disabled(!isFormValid)
                
                Spacer()
                
                Button("Register") {
                    appState.routes.append(.register)
                }.buttonStyle(.borderless)
            }
            
            Text(errorMessage)
        }.navigationTitle("Login")
    }
}

#Preview {
    NavigationStack {
        LoginScreen()
            .environmentObject(GroceryModel())
            .environmentObject(AppState())
    }
}
