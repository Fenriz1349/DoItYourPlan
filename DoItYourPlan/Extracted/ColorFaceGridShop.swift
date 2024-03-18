
import SwiftUI

 import SwiftUI

 struct ColorFaceGridShop: View {
     @Binding var selectedColorFace: ColorFace?
     @Binding var userPoints: Int // Les points de l'utilisateur sont passés ici
     @Binding var showAlert: Bool
    


     var body: some View {
         RoundedRectangle(cornerRadius: 0)
             .fill(Color.black)
             .frame(height: 1) // Hauteur de la bordure
         ScrollView {
             Text("Couleurs Visage")
                 .font(.system(size: 24))
                 .fontWeight(.bold)
                 .padding(.bottom, 20)
             LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 20) {
                 ForEach(colorFaces) { colorFace in
                     VStack {
                         ZStack {
                             RoundedRectangle(cornerRadius: 20)
                                 .fill(colorFace.color) // Utilisez la couleur du ColorFace
                                 .frame(width: 90, height: 90) // Taille du cadre
                                 .overlay(
                                     RoundedRectangle(cornerRadius: 20)
                                         .stroke(Color.black, lineWidth: 1)
                                         .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                 )
                             
                             if colorFace.iconCadenas {
                                 Image(systemName: "lock.fill") // Icône du cadenas
                                     .foregroundColor(.black)
                                     .padding(.top, -37)
                                     .padding(.leading, 40)
                             }
                         }
                         if let points = colorFace.points {
                             HStack {
                                 Image(systemName: "leaf.fill") // Icône des points
                                     .foregroundColor(.black)
                                 Text("\(points.nbrPoints)") // Nombre de points
                                     .foregroundColor(.black)
                             }
                         }
                     }  .onTapGesture {
                         if colorFace.iconCadenas {
                             if userPoints >= colorFace.points?.nbrPoints ?? 0 {
                                 userPoints -= colorFace.points?.nbrPoints ?? 0
                                 selectedColorFace = colorFace
                             } else {
                                 showAlert = true // Affiche l'alerte car l'utilisateur n'a pas assez de points
                             }
                         } else {
                             selectedColorFace = colorFace // Affecter la couleur de visage sélectionnée à selectedColorFace
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

    

