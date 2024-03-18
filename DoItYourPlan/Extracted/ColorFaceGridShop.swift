
/*import SwiftUI

struct ColorFaceGridShop: View {
    @Binding var selectedColorFace: ColorFace?
    @Binding var userPoints: Int
    @Binding var showAlert: Bool
    var colorFaces: [ColorFace]
    
    var body: some View {
            ScrollView {
                Text("Couleur de peau")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 20) {
                    ForEach(colorFaces) { colorFace in
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(colorFace.color) // Utilisez la couleur directement
                                    .frame(width: 90, height: 90)
                                    .overlay(
                                        colorFace.iconCadenas ? Image(systemName: "lock.fill").foregroundColor(.black) : nil
                                    )
                            }
                            .onTapGesture {
                                if colorFace.iconCadenas && userPoints >= colorFace.points?.nbrPoints ?? 0 {
                                    userPoints -= colorFace.points?.nbrPoints ?? 0
                                    if let index = colorFaces.firstIndex(where: { $0.id == colorFace.id }) {
                                        // Mis à jour pour refléter le déverrouillage dans le modèle de données
                                        // Note : cela nécessite que colorFaces soit mutable et observable
                                    }
                                    selectedColorFace = colorFace
                                } else if !colorFace.iconCadenas {
                                    selectedColorFace = colorFace
                                } else {
                                    showAlert = true
                                }
                            }

                            if colorFace.iconCadenas, let points = colorFace.points {
                                HStack {
                                    Image(systemName: points.iconPoints) // Assurez-vous que ceci est un symbole SF valide
                                        .foregroundColor(.black)
                                    Text("\(points.nbrPoints)")
                                }
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
#Preview{
  
    ColorFaceGridShop(selectedColorFace: .constant(nil), userPoints: .constant(100), showAlert: .constant(false))
      }

    */

