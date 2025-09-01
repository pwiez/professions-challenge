import SwiftUI
import MijickCamera

struct CapturedScreen: MCapturedMediaScreen {
    let capturedMedia: MCameraMedia
    let namespace: Namespace.ID
    let retakeAction: () -> ()
    let acceptMediaAction: () -> ()
    
    var body: some View {
        ZStack {
            createContentView()
            VStack{
                Spacer()
                createButtons()
                    .padding(.bottom, 50)
                    .padding([.leading, .trailing], 30)
            }
        }
    }
}

private extension CapturedScreen {
    // Se há uma imagem capturada, cria a view pra ela, caso contrário, mostra uma view vazia
    func createContentView() -> some View { ZStack {
        if let image = capturedMedia.getImage() { createImageView(image) }
        else { EmptyView() }
    }}
    
    func createButtons() -> some View {
        HStack() {
            createRetakeButton()
                .padding(.trailing, 50)
            createSaveButton()
                .padding(.leading, 50)
        }
    }
}

private extension CapturedScreen {

    func createImageView(_ image: UIImage) -> some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width*0.75, height: UIScreen.main.bounds.height*0.75)
            .padding(.bottom, 100)
    }

    func createRetakeButton() -> some View {
        Button{
            retakeAction()
        } label: {
            HStack{
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                Text("Refazer")
                    .foregroundColor(.white)
            }
            .frame(width: 130, height: 45)
            .background(Color.red.opacity(0.7))
            .cornerRadius(40)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.white, lineWidth: 2)
            )
        }
    }
    
    func createSaveButton() -> some View {
        Button {
            acceptMediaAction()
        }
        label: {
            HStack{
                Text("Usar Foto")
                    .foregroundColor(.white)
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
            }
            .frame(width: 130, height: 45)
            .background(Color.green.opacity(0.7))
            .cornerRadius(40)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.white, lineWidth: 2)
            )
        }
    }
}
