//
//  RegisterView.swift
//  professions-challenge
//
//  Created by Rodrigo Yamauchi on 07/09/25.
//

import SwiftUI

enum RegisterSection: SelectableOption, CaseIterable {
    case location
    case general
    case audio
    case photos
    case geolocation

    var label: String {
        switch self {
        case .location: return "Local"
        case .general: return "Geral"
        case .audio: return "Áudio"
        case .photos: return "Fotos"
        case .geolocation: return "Geolocalização"
        }
    }
    
    var view: some View {
        switch self {
        case .location: return AnyView(RegisterLocationView())
        case .general: return AnyView(RegisterGeneralView()) // Placeholder
        case .audio: return AnyView(RegisterAudioView())
        case .photos: return AnyView(RegisterPhotoView())
        case .geolocation: return AnyView(RegisterGeolocationView())
        }
    }
}

struct RegisterView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedSection: RegisterSection? = nil
    
    var onSave : (RecordModel) -> ()

    var body: some View {
        NavigationStack {
            VStack (spacing: 32) {
                CustomNavigationBarView(backAction: { dismiss() })
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(RegisterSection.allCases, id: \.self) { section in
                            RegistrationSectionCapsuleTitleView(
                                title: section.label,
                                isSelected: selectedSection == section,
                                backAction: { selectedSection = section }
                            )
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.never)
                
                if let section = selectedSection {
                    if section == .general {
                        ScrollView(.vertical) {
                            section.view
                                .padding(12)
                        }
                        .scrollIndicators(.never)
                    } else {
                        section.view
                            .padding(12)
                    }
                } else {
                    Spacer()
                }
                
                Button{
                    onSave(RecordModel.mock())
                } label: {
                    Text("Finalizar ficha")
                        .font(.system(size: 17))
                        .foregroundStyle(.light)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background{
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.clay)
                        }
                        .padding(16)
                        .padding(.bottom, 21)
                }
            }
            .background(.light)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}
