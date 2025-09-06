//
//  StyledTextField.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 05/09/25.
//

import SwiftUI

struct StyledTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .frame(height: 37)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.light)
            }
            .shadow(color: .black.opacity(0.12), radius: 10, x: -1, y: 3)
    }
}
