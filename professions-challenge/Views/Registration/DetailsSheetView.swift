//
//  DetailsSheetView.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 04/09/25.
//

import SwiftUI
import Flow

struct DetailsSheetView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedCategories: Set<Category> = []
    @State private var otherCategotyText = ""
    
    @State private var selectedMaterials: Set<ArtifactMaterial> = []
    @State private var otherMaterialText = ""
    
    @State private var selectedTechniques: Set<ProductionTechnique> = []
    @State private var otherTechniqueText = ""
    
    @State private var selectedDecorations: Set<Decoration> = []
    @State private var otherDecorationText = ""
    
    @State var selectedConservationState: ConservationState? = nil
    @State private var conservationDescription = ""
    
    var body: some View {
        ZStack {
            Color.light2.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 12){
                HStack {
                    Text("Características")
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
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        SelectionSectionView(
                            title: "Categoria",
                            options: Category.selectableOptions,
                            selectedItems: $selectedCategories,
                            otherText: $otherCategotyText
                        )
                        
                        SelectionSectionView(
                            title: "Materiais",
                            options: ArtifactMaterial.selectableOptions,
                            selectedItems: $selectedMaterials,
                            otherText: $otherMaterialText
                        )
                        
                        SelectionSectionView(
                            title: "Técnica de produção",
                            options: ProductionTechnique.selectableOptions,
                            selectedItems: $selectedTechniques,
                            otherText: $otherTechniqueText
                        )
                        
                        SelectionSectionView(
                            title: "Decoração",
                            options: Decoration.selectableOptions,
                            selectedItems: $selectedDecorations,
                            otherText: $otherDecorationText
                        )
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Estado de conservação")
                                .foregroundStyle(.blueDark2)
                                .font(.system(size: 17))
                            
                            HFlow(itemSpacing: 16, rowSpacing: 8) {
                                ForEach(ConservationState.allCases, id: \.label) { option in
                                    SelectionItemView(
                                        text: option.label,
                                        isSelected: Binding(
                                            get: { selectedConservationState == option },
                                            set: { newValue in
                                                selectedConservationState = newValue ? option : nil
                                            }
                                        )
                                    )
                                }
                            }
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Description")
                                    .foregroundStyle(.blueDark2)
                                    .font(.system(size: 17))
                                
                                StyledTextField(placeholder: "", text: $conservationDescription)
                            }
                        }
                        
                        
                        Button {
                            // TODO: Save selected data
                            dismiss()
                        } label: {
                            Text("Salvar")
                                .font(.system(size: 17))
                                .foregroundStyle(.light)
                                .padding(.vertical, 14)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.clay)
                                )
                        }
                    }
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 12)
        }
    }
}
