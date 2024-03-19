//
//  HairGridShop.swift
//  DoItYourPlan
//
//  Created by apprenant49 on 15/03/2024.
//

import SwiftUI

struct HairGridShop: View {
    @Binding var selectedHair: Hair?
    @Binding var userPoints: Int // Les points de l'utilisateur sont passés ici
    @Binding var showAlert: Bool
    @ObservedObject var userSelections: UserSelections
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(Color.black)
            .frame(height: 1) // Hauteur de la bordure
        ScrollView {
            Text("Cheveux")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding(.bottom, 20)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 20) {
                ForEach(hairs) { hair in
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .stroke(Color.black, lineWidth: 1)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            
                            if hair.iconCadenas {
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
                            Image(hair.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60) // Taille de l'image
                        )
                        if hair.iconCadenas, let points = hair.points {
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
                        if hair.iconCadenas {
                            if userPoints >= hair.points?.nbrPoints ?? 0 {
                                userPoints -= hair.points?.nbrPoints ?? 0
                                if let index = hairs.firstIndex(where: { $0.id == hair.id }) {
                                    hairs[index].iconCadenas = false
                                    userSelections.selectedHair = hairs[index]
                                }
                            } else {
                                showAlert = true // Affiche l'alerte car l'utilisateur n'a pas assez de points
                            }
                        } else {
                            userSelections.selectedHair = hair // Affecter le cheveu sélectionné à selectedHair
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
 
        HairGridShop(selectedHair: .constant(nil), userPoints: .constant(100), showAlert: .constant(false), userSelections: userSelections)
    }
