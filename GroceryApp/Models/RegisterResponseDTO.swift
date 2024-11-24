//
//  RegisterResponseDTO.swift
//  GroceryApp
//
//  Created by Rychillie Umpierre de Oliveira on 23/11/24.
//

import Foundation

struct RegisterResponseDTO: Codable {
    let error: Bool
    var reason: String? = nil
}
