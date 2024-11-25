//
//  GroceryAppApp.swift
//  GroceryApp
//
//  Created by Rychillie Umpierre de Oliveira on 23/11/24.
//

import SwiftUI

@main
struct GroceryAppApp: App {
    
    @StateObject private var model = GroceryModel()
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
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
                        }
                    }
            }
            .environmentObject(model)
            .environmentObject(appState)
        }
    }
}
