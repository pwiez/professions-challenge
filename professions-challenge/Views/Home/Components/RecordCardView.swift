//
//  ArtifactCardView.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 03/09/25.
//

import SwiftUI

struct RecordCardView: View {
    let record: RecordModel
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image("shovel_icon")
                    .resizable()
                    .frame(width: 47, height: 47)
                
                VStack(alignment: .leading){
                    Text(record.name)
                        .lineLimit(1)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.blueDark)
                    
                    Text("\(Image(systemName: "calendar")) \(dateFormatter.string(from: record.createdAt))")
                        .font(.system(size: 11))
                        .foregroundStyle(.blueDark)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background{
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundStyle(.blueLight2)
                        }
                }
                Spacer()
                
                VStack{
                    Button{
                        // TODO: Include button action
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(.blueDark)
                            .font(.system(size: 16, weight: .semibold))
                    }
                        Spacer()
                }
            }
            .frame(height: 62)
            
            Rectangle()
                .frame(width: .infinity, height: 0.2)
                .foregroundStyle(.clay)
                .padding(.bottom, 12)
            
            VStack(spacing: 4){
                HStack{
                    Text("Objeto:")
                        .foregroundStyle(.blueDark)
                        .font(.system(size: 12, weight: .medium))
                    
                    Spacer()
                    
                    Text(record.artifact.artifactData?.denomination ?? "N/A")
                        .foregroundStyle(.blueDark)
                        .font(.system(size: 12, weight: .regular))
                }
                
                HStack{
                    Text("Nº do processo:")
                        .foregroundStyle(.blueDark)
                        .font(.system(size: 12, weight: .medium))
                    
                    Spacer()
                    
                    Text(record.artifact.location?.processNumber?.description ?? "N/A")
                        .foregroundStyle(.blueDark)
                        .font(.system(size: 12, weight: .regular))
                }
                
                HStack{
                    Text("Sítio:")
                        .foregroundStyle(.blueDark)
                        .font(.system(size: 12, weight: .medium))
                    
                    Spacer()
                    
                    Text(record.artifact.location?.site ?? "N/A")
                        .foregroundStyle(.blueDark)
                        .font(.system(size: 12, weight: .regular))
                }
            }
            
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 14)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.light2)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.clay, lineWidth: 0.2)
        }
    }
}

#Preview {
    RecordCardView(record: RecordModel(id: UUID(), name: "Artefato 1", createdAt: Date(), artifact: ArtifactModel(), audios: []))
        .padding(.horizontal, 12)
}
