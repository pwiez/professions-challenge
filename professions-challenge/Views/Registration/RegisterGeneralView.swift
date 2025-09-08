//
//  RegisterGeneralView.swift
//  professions-challenge
//
//  Created by Pedro Wiezel on 08/09/25.
//

import SwiftUI

struct RegisterGeneralView: View {
    @State private var processNumber: String = ""
    @State private var denomination: String = ""
    @State private var description: String = ""
    //
    @State private var institutionAndUseSigns: String = ""
    @State private var filiation: String = ""
    @State private var height: String = ""
    @State private var width: String = ""
    @State private var weight: String = ""
    @State private var depth: String = ""
    
    @State private var shouldPresentDetailsSheet: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.light2)
                .cornerRadius(12)
                .ignoresSafeArea(edges:.all)
            
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
                        TextField("", text: $processNumber)
                            .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                            .background(.light)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.12), radius: 4, x: -1, y: 4)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Denominação:")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(.blueDark2)
                        TextField("", text: $denomination)
                            .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                            .background(.light)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.12), radius: 4, x: -1, y: 4)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Descrição:")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(.blueDark2)
                        TextField("", text: $description)
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
                            Text("Instituição e marcas de uso:")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(.blueDark2)
                            TextField("", text: $institutionAndUseSigns)
                                .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                                .background(.light)
                                .cornerRadius(10)
                                .shadow(color: .black.opacity(0.12), radius: 4, x: -1, y: 4)
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Filiação cultural:")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(.blueDark2)
                            TextField("", text: $filiation)
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
                                TextField("", text: $height)
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
                                TextField("", text: $depth)
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
                                TextField("", text: $width)
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
                                TextField("", text: $weight)
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
        }
        .sheet(isPresented: $shouldPresentDetailsSheet) {
            DetailsSheetView()
        }
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    RegisterGeneralView()
}
