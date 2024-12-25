//
//  ErrorWrapper.swift
//  GroceryApp
//
//  Created by Rychillie Umpierre de Oliveira on 25/12/24.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let guidance: String
}
