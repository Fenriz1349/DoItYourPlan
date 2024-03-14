//
//  ShopScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct ShopScreen: View {
    @State private var backgroundColor: Color = Color("yellowCustom")
    @State private var isHeadImageBackgroundBlack: Bool = true

    var body: some View {
        VStack(spacing: -3) {
            Button(action: {
                // Changer la couleur de fond de l'image "headProfil"
                if self.isHeadImageBackgroundBlack {
                    self.backgroundColor = Color.blue // Changer la couleur en bleu
                } else {
                    self.backgroundColor = Color("yellowCustom") // Revenir à la couleur jaune d'origine
                }
                // Inverser l'état du booléen pour alterner entre les couleurs
                self.isHeadImageBackgroundBlack.toggle()
            }) {
                VStack(spacing: 0) {
                    Image("headProfil")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.black)
                        .background(backgroundColor) // Appliquer la couleur de fond dynamique
                        .padding(.trailing, 10)

                    Image("bustProfil")
                        .resizable()
                        .frame(width: 170, height: 100)
                        .foregroundColor(.black)
                        .padding(.trailing, 10)
                }
            }
            Divider()
        }
        .background(Color("yellowCustom"))
    }
}

#Preview {
    ShopScreen()
}
