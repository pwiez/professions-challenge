//
//  RegisterLocationView.swift
//  professions-challenge
//
//  Created by Pedro Wiezel on 08/09/25.
//

import SwiftUI

struct RegisterLocationView : View {
    
    @State private var site: String = ""
    @State private var processNumber: String = ""
    @State private var address: String = ""
    @State private var institution: String = ""
    
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
                    
                    TextField("", text: $site)
                        .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                        .background(.light)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.12), radius: 2, x: -1, y: 3)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Nº do processo:")
                        .font(.body)
                        .foregroundColor(.blueDark2)
                    TextField("", text: $processNumber)
                        .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                        .background(.light)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.12), radius: 2, x: -1, y: 3)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Endereço:")
                        .font(.body)
                        .foregroundColor(.blueDark2)
                    TextField("", text: $address)
                        .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                        .background(.light)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.12), radius: 2, x: -1, y: 3)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Instituição:")
                        .font(.body)
                        .foregroundColor(.blueDark2)
                    TextField("", text: $institution)
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
}

#Preview {
    RegisterLocationView()
}
