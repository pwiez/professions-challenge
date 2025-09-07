//
//  SelectionSectionView.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 05/09/25.
//

import SwiftUI
import Flow

struct SelectionSectionView<T: SelectableOption>: View {
    let title: String
    let options: [T]
    
    @Binding var selectedItems: Set<T>
    @Binding var otherText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .foregroundStyle(.blueDark2)
                .font(.system(size: 17))
            
            HFlow(itemSpacing: 16, rowSpacing: 8) {
                ForEach(options, id: \.label) { option in
                    SelectionItemView(
                        text: option.label,
                        isSelected: Binding(
                            get: { selectedItems.contains(option) },
                            set: { newValue in
                                if newValue {
                                    selectedItems.insert(option)
                                } else {
                                    selectedItems.remove(option)
                                }
                            }
                        )
                    )
                }
            }
            VStack(alignment: .leading, spacing: 2) {
                Text("Outros:")
                    .foregroundStyle(.blueDark2)
                    .font(.system(size: 17))
                
                StyledTextField(placeholder: "", text: $otherText)
            }
        }
    }
}
