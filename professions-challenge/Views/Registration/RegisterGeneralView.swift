//
//  RegisterGeneralView.swift
//  professions-challenge
//
//  Created by Pedro Wiezel on 08/09/25.
//

import SwiftUI
import Combine

struct RegisterGeneralView: View {
    @State private var shouldPresentDetailsSheet: Bool = false
    
    @ObservedObject var recordDraft: RecordDraft
<<<<<<< HEAD
    @State private var keyboardHeight: CGFloat = 0

=======
    
    @State private var keyboardHeight: CGFloat = 0
    
>>>>>>> 609bc73 (fix: Keyboards and filters)
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.light2)
                .cornerRadius(12)
                .ignoresSafeArea(edges:.all)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Dados gerais do artefato")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.blueDark2)
                        .padding(.top, 12)
                        .padding(.bottom, 12)
                    Divider()
                        .frame(height: 1)
                        .foregroundStyle(Color(red: 0.33, green: 0.33, blue: 0.34).opacity(0.34))
                    
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Nº do Registro:")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(.blueDark2)
                            TextField("", text: Binding(
                                get: {
                                    recordDraft.artifactData?.registerNumber.map { String($0) } ?? ""
                                },
                                set: { newValue in
                                    if recordDraft.artifactData == nil {
                                        recordDraft.artifactData = ArtifactDataModel()
                                    }
                                    recordDraft.artifactData?.registerNumber = Int(newValue)
                                }
                            ))
                                .keyboardType(.numberPad)
                                .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                                .background(.light)
                                .cornerRadius(10)
                                .shadow(color: .black.opacity(0.12), radius: 4, x: -1, y: 4)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Denominação:")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(.blueDark2)
                            TextField("", text: bindingData(for: \.denomination))
                                .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                                .background(.light)
                                .cornerRadius(10)
                                .shadow(color: .black.opacity(0.12), radius: 4, x: -1, y: 4)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Descrição:")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(.blueDark2)
                            TextField("", text: bindingData(for: \.artifactDescription))
                                .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                                .background(.light)
                                .cornerRadius(10)
                                .shadow(color: .black.opacity(0.12), radius: 4, x: -1, y: 4)
                        }
                        
                        HStack {
                            Text("Características:")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(.blueDark2)
                            
                            Spacer()
                            
                            Button {
                                shouldPresentDetailsSheet = true
                            }
                            label: {
                                HStack(alignment: .center) {
                                    Text("Escolha")
                                        .font(.system(size: 17, weight: .regular))
                                        .foregroundColor(.blueDark2)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 17, weight: .regular))
                                        .foregroundColor(.blueDark2)
                                }
                                .padding(8)
                                .frame(width: 100, alignment: .center)
                                .background(.light)
                                .cornerRadius(10)
                                .shadow(color: .black.opacity(0.12), radius: 3, x: -1, y: 3)
                                
                            }
                        }
                    }
                    .padding(.top, 12)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Dados específicos do artefato")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.blueDark2)
                            .padding(.top, 22)
                            .padding(.bottom, 12)
                        Divider()
                            .frame(height: 1)
                            .foregroundStyle(Color(red: 0.33, green: 0.33, blue: 0.34).opacity(0.34))
                        
                        VStack(alignment: .leading, spacing: 24) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Inscrições e marcas de uso:")
                                    .font(.system(size: 17, weight: .regular))
                                    .foregroundColor(.blueDark2)
                                TextField("", text: bindingDetails(for: \.inscriptions))
                                    .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                                    .background(.light)
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.12), radius: 4, x: -1, y: 4)
                            }
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Filiação cultural:")
                                    .font(.system(size: 17, weight: .regular))
                                    .foregroundColor(.blueDark2)
                                TextField("", text: bindingDetails(for: \.filiation))
                                    .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                                    .background(.light)
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.12), radius: 4, x: -1, y: 4)
                            }
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Altura:")
                                        .font(.system(size: 17, weight: .regular))
                                        .foregroundColor(.blueDark2)
                                    TextField("", text: bindingDetailsDouble(for: \.height))
                                        .keyboardType(.decimalPad)
                                        .frame(maxWidth: 167, minHeight: 37, maxHeight: 37)
                                        .background(.light)
                                        .cornerRadius(10)
                                        .shadow(color: .black.opacity(0.12), radius: 4, x: -1, y: 4)
                                }
                                Spacer()
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Profundidade:")
                                        .font(.system(size: 17, weight: .regular))
                                        .foregroundColor(.blueDark2)
                                    TextField("", text: bindingDetailsDouble(for: \.depth))
                                        .keyboardType(.decimalPad)
                                        .frame(maxWidth: 167, minHeight: 37, maxHeight: 37)
                                        .background(.light)
                                        .cornerRadius(10)
                                        .shadow(color: .black.opacity(0.12), radius: 4, x: -1, y: 4)
                                }
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Largura:")
                                        .font(.system(size: 17, weight: .regular))
                                        .foregroundColor(.blueDark2)
                                    TextField("", text: bindingDetailsDouble(for: \.width))
                                        .keyboardType(.decimalPad)
                                        .frame(maxWidth: 167, minHeight: 37, maxHeight: 37)
                                        .background(.light)
                                        .cornerRadius(10)
                                        .shadow(color: .black.opacity(0.12), radius: 4, x: -1, y: 4)
                                }
                                Spacer()
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Peso:")
                                        .font(.system(size: 17, weight: .regular))
                                        .foregroundColor(.blueDark2)
                                    TextField("", text: bindingDetailsDouble(for: \.weight))
                                        .keyboardType(.decimalPad)
                                        .frame(maxWidth: 167, minHeight: 37, maxHeight: 37)
                                        .background(.light)
                                        .cornerRadius(10)
                                        .shadow(color: .black.opacity(0.12), radius: 4, x: -1, y: 4)
                                }
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        .padding(.top, 12)
                    }
                }
                .padding(12)
                .padding(.bottom, keyboardHeight)
            }
        }
        .onReceive(Publishers.keyboardHeight, perform: { height in
            withAnimation {
                self.keyboardHeight = height
            }
        })
        .sheet(isPresented: $shouldPresentDetailsSheet) {
            DetailsSheetView(recordDraft: recordDraft)
        }
        .presentationDragIndicator(.visible)
    }
    
    func bindingData(for keyPath: WritableKeyPath<ArtifactDataModel, String?>) -> Binding<String> {
        Binding<String>(
            get: {
                recordDraft.artifactData?[keyPath: keyPath] ?? ""
            },
            set: { newValue in
                if recordDraft.artifactData == nil {
                    recordDraft.artifactData = ArtifactDataModel()
                }
                recordDraft.artifactData?[keyPath: keyPath] = newValue
            }
        )
    }
    
    func bindingDetails(for keyPath: WritableKeyPath<ArtifactDetailsModel, String?>) -> Binding<String> {
        Binding<String>(
            get: {
                recordDraft.artifactDetails?[keyPath: keyPath] ?? ""
            },
            set: { newValue in
                if recordDraft.artifactDetails == nil {
                    recordDraft.artifactDetails = ArtifactDetailsModel()
                }
                recordDraft.artifactDetails?[keyPath: keyPath] = newValue
            }
        )
    }
    
    func bindingDetailsDouble(for keyPath: WritableKeyPath<ArtifactDetailsModel, Double?>) -> Binding<String> {
        Binding<String>(
            get: {
                if let value = recordDraft.artifactDetails?[keyPath: keyPath] {
                    return String(value)
                }
                return ""
            },
            set: { newValue in
                if recordDraft.artifactDetails == nil {
                    recordDraft.artifactDetails = ArtifactDetailsModel()
                }
                recordDraft.artifactDetails?[keyPath: keyPath] = Double(newValue)
            }
        )
    }
}

#Preview {
    RegisterGeneralView(recordDraft: RecordDraft())
}
