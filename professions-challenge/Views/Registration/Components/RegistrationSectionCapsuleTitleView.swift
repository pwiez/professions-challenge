//
//  RegistrationSectionCapsuleTitleView.swift
//  professions-challenge
//
//  Created by Rodrigo Yamauchi on 07/09/25.
//

import SwiftUI

struct RegistrationSectionCapsuleTitleView: View {
    let title: String
    let isSelected: Bool
    let backAction: () -> Void

    var body: some View {
        Button {
            backAction()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.clay, lineWidth: 2)
                    .padding(.vertical, 1)
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color.clay : Color.clear)
                    .padding(.vertical, 1)
                
                Text(title)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(isSelected ? .light : .clay)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 7)
            }
            .frame(maxHeight: 36)
        }
    }
}
