import SwiftUI

struct ColorFaceGridShop: View {
    @Binding var selectedColorFace: ColorFace?
    @Binding var userPoints: Int
    @Binding var showAlert: Bool
    @ObservedObject var userSelections: UserSelections
    
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(Color.black)
            .frame(height: 1)
        ScrollView {
            Text("Couleurs de peau")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding(.bottom, 20)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 20) {
                ForEach(colorFaces) { colorFace in
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(colorFace.color)
                                .frame(width: 90, height: 90)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 1)
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                )
                            VStack {
                                if colorFace.iconCadenas {
                                    Image(systemName: "lock.fill")
                                        .foregroundColor(.black)
                                        .padding(.top, 15)
                                        .padding(.leading, 40)
                                } else {
                                    Color.clear // Vue vide pour maintenir l'espace
                                        .frame(width: 24, height: 24) // Ajustez la taille au besoin pour correspondre à l'icône
                                        .padding(.top, -37)
                                        .padding(.trailing, 40)
                                }
                                Spacer() // Assure que l'espace réservé ou l'icône soit toujours en haut
                            }
                        }
                        if let points = colorFace.points {
                            HStack {
                                Image(systemName: "leaf.fill")
                                    .foregroundColor(.black)
                                Text("\(points.nbrPoints)")
                                    .foregroundColor(.black)
                            }
                        } else {
                            // Gardez un espace pour l'alignement même quand il n'y a pas de points
                            HStack {
                                Spacer()
                                Text(" ")
                                    .foregroundColor(.clear)
                            }
                        }
                    }
                    .onTapGesture {
                        if colorFace.iconCadenas {
                            if userPoints >= colorFace.points?.nbrPoints ?? 0 {
                                userPoints -= colorFace.points?.nbrPoints ?? 0
                                userSelections.selectedColorFace = colorFace
                            } else {
                                showAlert = true
                            }
                        } else {
                            userSelections.selectedColorFace = colorFace
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview{
  
    ColorFaceGridShop(selectedColorFace: .constant(nil), userPoints: .constant(100), showAlert: .constant(false),  userSelections: userSelections)
      }

    
