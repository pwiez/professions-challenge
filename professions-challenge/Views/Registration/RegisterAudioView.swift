//
//  RegisterAudioView.swift
//  professions-challenge
//
//  Created by Rodrigo Yamauchi on 07/09/25.
//

import SwiftUI
import AVFoundation

struct RegisterAudioView: View {
    @ObservedObject var recordDraft: RecordDraft
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.light2)
                .cornerRadius(12)
            if recordDraft.audios.isEmpty {
                VStack (spacing: 8) {
                    Text("Nenhum áudio adicionado ainda.")
                        .font(.system(size: 28, weight: .bold))
                        .kerning(0.38)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.blueDark2)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("Toque em “\(Image(systemName: "microphone.fill")) Adicionar Áudio” para começar.")
                        .font(.system(size: 17, weight: .regular))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.blueDark2)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.horizontal, 12)
            } else {
                
                ScrollView{
                    VStack(spacing: 20){
                        ForEach(Array(recordDraft.audios.enumerated()), id: \.element.id) { index, audio in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(audio.name)
                                    .font(.system(size: 17))
                                    .foregroundStyle(.blueDark2)
                                
                                HStack{
                                    Text("\(Image(systemName: "captions.bubble"))")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.gray)
                                    
                                    Spacer()
                                    
                                    if let url = audio.audioRecording?.fileURL {
                                        let duration = getDuration(from: url)
                                        Text(formatDuration(duration))
                                            .font(.system(size: 15))
                                            .foregroundStyle(.gray)
                                    } else {
                                        Text("Duração não disponível")
                                            .font(.system(size: 15))
                                            .foregroundStyle(.gray)
                                    }
                                }
                                Divider()
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 24)
                        }
                        Spacer()
                    }
                }
            }
            
            VStack {
                Spacer()
                
                NavigationLink {
                    AudioRecordingView(recordDraft: recordDraft)
                } label: {
                    Text("\(Image(systemName: "microphone.fill")) Adicionar Áudio")
                        .font(.system(size: 17))
                        .foregroundStyle(.light)
                        .frame(maxWidth: 230)
                        .frame(height: 50)
                        .background{
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.clay)
                        }
                        .padding(16)
                        .padding(.bottom, 21)
                }
            }
        }
    }
    
    func getDuration(from url: URL) -> TimeInterval {
        let asset = AVURLAsset(url: url)
        return CMTimeGetSeconds(asset.duration)
    }
    func formatDuration(_ duration: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: duration) ?? "00:00"
    }
}

let recordDraft: RecordDraft = {
    let draft = RecordDraft()
    draft.audios.append(AudioModel(name: "29/08/25 - 1"))
    draft.audios.append(AudioModel(name: "29/08/25 - 2"))
    return draft
}()

#Preview {
    RegisterAudioView(recordDraft: recordDraft)
}
