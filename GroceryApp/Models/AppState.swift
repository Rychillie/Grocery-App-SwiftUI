//
//  AppState.swift
//  GroceryApp
//
//  Created by Rychillie Umpierre de Oliveira on 24/11/24.
//

import Foundation
import GroceryAppSharedDTO

enum GroceryError: Error {
    case login
}

enum Route: Hashable {
    case login
    case register
    case groceryCategoryList
    case groceryCategoryDetail(GroceryCategoryResponseDTO)
}

class AppState: ObservableObject {
    @Published var routes: [Route] = []
    @Published var errorWrapper: ErrorWrapper?
}
