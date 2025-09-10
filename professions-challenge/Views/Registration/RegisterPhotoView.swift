//
//  RegisterPhotoView.swift
//  professions-challenge
//
//  Created by Rodrigo Yamauchi on 07/09/25.
//

import SwiftUI

struct RegisterPhotoView: View {
    @ObservedObject var recordDraft: RecordDraft

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.light2)
                .cornerRadius(12)

            if !recordDraft.photos.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(recordDraft.photos, id: \.self) { photo in
                            if let uiImage = photo.uiImage {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }
            } else {
                VStack (spacing: 8) {
                    Text("Nenhuma foto adicionada ainda.")
                        .font(.system(size: 28, weight: .bold))
                        .kerning(0.38)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.blueDark2)
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text("Toque em “\(Image(systemName: "camera.fill")) Adicionar Foto” para começar.")
                        .font(.system(size: 17, weight: .regular))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.blueDark2)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.horizontal, 12)
            }

            VStack {
                Spacer()

                NavigationLink {
                    CameraView(recordDraft: recordDraft)
                } label: {
                    Text("\(Image(systemName: "camera.fill")) Adicionar Foto")
                        .font(.system(size: 17))
                        .foregroundStyle(.light)
                        .frame(maxWidth: 230)
                        .frame(height: 50)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.clay)
                        }
                        .padding(16)
                        .padding(.bottom, 21)
                }
            }
        }
    }
}
