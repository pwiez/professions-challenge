//
//  SelectionItemView.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 04/09/25.
//

import SwiftUI

struct SelectionItemView: View {
    let text: String
    @Binding var isSelected: Bool
    
    var body: some View {
        Button {
            
            isSelected.toggle()
        } label: {
            Text(text)
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.blueDark2)
                .padding(8)
                .background {
                    if isSelected {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blueLight3)
                    } else {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.light)
                    }
                }
                .shadow(color: .black.opacity(0.12), radius: 4, x: -1, y: 3)
        }
    }
}

#Preview {
    SelectionItemView(text: "Test", isSelected: .constant(false))
}
