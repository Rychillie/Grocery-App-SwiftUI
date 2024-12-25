//
//  ErrorView.swift
//  GroceryApp
//
//  Created by Rychillie Umpierre de Oliveira on 25/12/24.
//

import SwiftUI

struct ErrorView: View {
    
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        VStack {
            Text("Error has occurred in the application.")
                .font(.headline)
                .padding([.bottom], 10)
            Text(errorWrapper.error.localizedDescription)
            Text(errorWrapper.guidance)
                .font(.caption)
        }
        .padding()
    }
}

#Preview {
    ErrorView(
        errorWrapper: ErrorWrapper(
            error: URLError(.badServerResponse),
            guidance: "Operation has failed. Please try again later."
        )
    )
}
