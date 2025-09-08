import SwiftUI

struct TitleRegistrationView: View {
    @State private var nomeFicha: String = ""
    @State private var continueToRegister: Bool = false
    
    var onSave : (RecordModel) -> ()
    
    var body: some View {
        ZStack {
            Color("Light")
                .ignoresSafeArea()
                
            VStack(alignment: .leading, spacing: 22) {
                
                Text("Cadastrar ficha")
                    .font(.largeTitle)
                    .foregroundColor(Color("BlueDark3"))
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("NOME DA FICHA")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    HStack {
                        TextField("Título", text: $nomeFicha)
                        
                        if !nomeFicha.isEmpty {
                            Button(action: {
                                self.nomeFicha = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding()
                    .background(Color("Light2"))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("BorderColor"), lineWidth: 1)
                    )
                    .shadow(color: Color.black.opacity(0.12), radius: 4, x: -1, y: 3)
                }
                
                Button {
                    continueToRegister = true
                } label: {
                    Text("Próximo")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("Clay"))
                        .foregroundColor(Color("Light"))
                        .cornerRadius(12)
                }
                
                Spacer()
            }
            .padding()
        }
        .fullScreenCover(isPresented: $continueToRegister, content: {
            RegisterView(onSave: onSave)
                .transition(.slide)
        })
        .transaction { transaction in
//            transaction.disablesAnimations = true
        }
    }
}

#Preview {
    NavigationView {
        TitleRegistrationView(onSave: {_ in })
    }
}
