//
//  Constants.swift
//  GroceryApp
//
//  Created by Rychillie Umpierre de Oliveira on 23/11/24.
//

import Foundation

struct Constants {
    
    private static let baseUrlPath = "http://127.0.0.1:8080/api"
    
    struct Urls {
        
        static let register = URL(string: "\(baseUrlPath)/register")!
        static let login = URL(string: "\(baseUrlPath)/login")!
        
        static func saveGroceryCategoryByUserID(userId: UUID) -> URL {
            return URL(string: "\(baseUrlPath)/users/\(userId)/grocery-categories")!
        }
        
    }
}
