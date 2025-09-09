//
//  CustomNavigationBarView.swift
//  professions-challenge
//
//  Created by Rodrigo Yamauchi on 07/09/25.
//

import SwiftUI

struct CustomNavigationBarView: View {
    let backAction: () -> Void
    var body: some View {
        ZStack {
            HStack {
                Button {
                    backAction()
                } label: {
                    HStack (spacing: 0) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.clay)
                            .padding(.trailing, 4)
                        
                        Text("Título")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundStyle(.clay)
                        
                        Spacer()
                    }
                }
                
                Spacer()
            }
            
            HStack {
                Spacer()
                
                Text("Nome da ficha")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.blueDark3)
                    
                Spacer()
            }
        }
        .padding(.horizontal, 12)
        .padding(.top, 8)
        .background(.clear)
    }
}

#Preview {
    CustomNavigationBarView(backAction: {})
}
