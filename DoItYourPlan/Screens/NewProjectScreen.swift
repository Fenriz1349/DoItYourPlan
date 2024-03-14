//
//  NewProjectScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct NewProjectScreen: View {
    
    @State var selectedOption = NewProjectCategory.couture
    var body: some View {
        //        insert de la nav bar avec titre page "Nouveau projet" et bouton retour
        Text("Nouveau projet")
        VStack {
// Premiere zone cliquable contenant le nom du projet, sa catégorie et une petite déscription
            Text("Choisis la catégorie de ton Projet DIY")
            Picker("Choisis une catégorie", selection: $selectedOption) {
                ForEach(NewProjectCategory.allCases, id: \.self){ category in
                Text(category.rawValue)
            }
        }
            .pickerStyle(MenuPickerStyle())
            // Style du menu déroulant (faire une bordure et ajouter couleur selon le choix de catégorie
            
            // Insertion du formulaire pour nom du projet et détail comme indiqué sur figma
            // Insertion du bouton valider
            
// Fin de la première zone cliquable / développable
            // Planning pour date de fin estimée (voir avec Julien)
           // Création liste des étapes et taches à faire ?? Rejoins l'écran selected screen ou insert écran tast and step??
            // Matériel: C'est le matériel à acheter? Donc pas dans les taches? 
                   } //fin de la Vstack
                   .padding()
               }
           }

#Preview {
    NewProjectScreen()
}
