
import SwiftUI

struct FaceGridShop: View {
    @Binding var selectedFace: Face?
    @Binding var userPoints: Int // Les points de l'utilisateur sont passés ici
    @Binding var showAlert: Bool
    @ObservedObject var userSelections: UserSelections
    
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(Color.black)
            .frame(height: 1) // Hauteur de la bordure
        ScrollView {
            Text("Faces")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding(.bottom, 20)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 20) {
                ForEach(faces) { face in
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .stroke(Color.black, lineWidth: 1)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            
                            if face.iconCadenas {
                                HStack {
                                    Spacer()
                                    Image(systemName: "lock.fill") // Icône du cadenas
                                        .foregroundColor(.black)
                                        .padding(.top, -37)
                                        .padding(.leading, -25)
                                }
                            } else {
                                Color.clear // Vue vide pour maintenir l'espace
                            }
                        }
                        .frame(width: 90, height: 90) // Taille de l'image et de la zone des points
                        .overlay(
                            Image(face.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60) // Taille de l'image
                        )
                        if face.iconCadenas, let points = face.points {
                            HStack {
                                Image(systemName: "leaf.fill") // Icône des points
                                    .foregroundColor(.black)
                                Text("\(points.nbrPoints)") // Nombre de points
                                    .foregroundColor(.black)
                            }
                        } else {
                            Color.clear // Vue vide pour maintenir l'espace
                        }
                    }.onTapGesture {
                        if face.iconCadenas {
                            if userPoints >= face.points?.nbrPoints ?? 0 {
                                userPoints -= face.points?.nbrPoints ?? 0
                                if let index = faces.firstIndex(where: { $0.id == face.id }) {
                                    faces[index].iconCadenas = false
                                    userSelections.selectedFace = faces[index]
                                }
                            } else {
                                showAlert = true // Affiche l'alerte car l'utilisateur n'a pas assez de points
                            }
                        } else {
                            userSelections.selectedFace = face // Affecter la face sélectionnée à selectedFace
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
        FaceGridShop(selectedFace: .constant(nil), userPoints: .constant(100), showAlert: .constant(false), userSelections: userSelections)
    }
