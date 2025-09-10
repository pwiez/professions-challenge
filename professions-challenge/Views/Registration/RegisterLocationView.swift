//
//  RegisterLocationView.swift
//  professions-challenge
//
//  Created by Pedro Wiezel on 08/09/25.
//

import SwiftUI

struct RegisterLocationView : View {
    @ObservedObject var recordDraft: RecordDraft
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.light2)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Sítio:")
                        .font(.body)
                        .foregroundColor(.blueDark2)
                    
                    TextField("", text: bindingLocation(for: \.site))
                        .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                        .background(.light)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.12), radius: 2, x: -1, y: 3)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Nº do processo:")
                        .font(.body)
                        .foregroundColor(.blueDark2)
                    TextField("", text: intBindingLocation(for: \.processNumber))
                        .keyboardType(.numberPad)
                        .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                        .background(.light)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.12), radius: 2, x: -1, y: 3)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Endereço:")
                        .font(.body)
                        .foregroundColor(.blueDark2)
                    TextField("", text: bindingLocation(for: \.adress))
                        .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                        .background(.light)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.12), radius: 2, x: -1, y: 3)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Instituição:")
                        .font(.body)
                        .foregroundColor(.blueDark2)
                    TextField("", text: bindingLocation(for: \.institution))
                        .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                        .background(.light)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.12), radius: 2, x: -1, y: 3)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(12)
        }
    }
    
    func bindingLocation(for keyPath: WritableKeyPath<LocationInfoModel, String?>) -> Binding<String> {
        Binding<String>(
            get: {
                recordDraft.location?[keyPath: keyPath] ?? ""
            },
            set: { newValue in
                if recordDraft.location == nil {
                    recordDraft.location = LocationInfoModel()
                }
                recordDraft.location?[keyPath: keyPath] = newValue
            }
        )
    }

    func intBindingLocation(for keyPath: WritableKeyPath<LocationInfoModel, Int?>) -> Binding<String> {
        Binding<String>(
            get: {
                recordDraft.location?[keyPath: keyPath].map { String($0) } ?? ""
            },
            set: { newValue in
                if recordDraft.location == nil {
                    recordDraft.location = LocationInfoModel()
                }
                recordDraft.location?[keyPath: keyPath] = Int(newValue)
            }
        )
    }
}

#Preview {
    RegisterLocationView(recordDraft: RecordDraft())
}
