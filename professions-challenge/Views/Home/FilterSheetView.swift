//
//  FilterSheetView.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 03/09/25.
//

import SwiftUI
import Flow

struct FilterSheetView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var filters: FilterOptions
    var onApply: () -> Void
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.light2.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        Text("Filtros")
                            .foregroundStyle(.blueDark2)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Spacer()
                        
                        Button{
                            dismiss()
                        } label: {
                            Image(systemName: "multiply")
                                .foregroundStyle(Color(hex: "3D3D3D"))
                                .font(.system(size: 16, weight: .semibold))
                                .opacity(0.5)
                                .background {
                                    Circle()
                                        .foregroundStyle(Color(hex: "7F7F7F"))
                                        .opacity(0.2)
                                        .frame(width: 30, height: 30)
                                }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        HFlow(itemSpacing: 16, rowSpacing: 8) {
                            SelectionItemView(text: "Exportados", isSelected: $filters.exported)
                            SelectionItemView(text: "Recentes", isSelected: $filters.recents)
                            SelectionItemView(text: "Com Imagem", isSelected: $filters.withImage)
                            SelectionItemView(text: "Com Áudio", isSelected: $filters.withAudio)
                        }
                    }
                    .padding(0)
                    
                    Button {
                        onApply()
                        dismiss()
                    } label: {
                        Text("Filtrar")
                            .foregroundStyle(.light)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.clay)
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}
