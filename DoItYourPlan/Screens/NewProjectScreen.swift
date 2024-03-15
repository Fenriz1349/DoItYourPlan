//
//  NewProjectScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct NewProjectScreen: View {
    
    @State var projectName = ""
    @State var selectedOption = NewProjectCategory.couture
    @State var projectDescription = ""
    var body: some View {
       
        
        //        insert de la nav bar avec titre page "Nouveau projet" et bouton retour
        Text("Nouveau projet")
        
        VStack {
            ZStack {
                    Form {
                        Section(header: Text("Nom du projet")){
                            TextField("Nom du projet", text: $projectName)
                                }
                        
                        Section(header: Text("Choisis la catégorie de ton Projet DIY")) {
                            Picker("Catégorie:", selection: $selectedOption) {
                                ForEach(NewProjectCategory.allCases, id: \.self){ category in
                                    Text(category.rawValue)
                                    // Style du menu déroulant: ajouter couleur selon le choix de catégorie
                                    }
                                }
                            }
                        Section(header : Text("Détails")) {
                            TextField("Description du projet", text: $projectDescription)
                            }
                        Section(header : Text("Date de fin")) {
                            // Planning pour date de fin estimée (voir avec Julien)
                            }
                        }
                    }
                }
           
//        rounded ici pour figurer le bouton valider qui envoie directement à -> SelectedProjectScreen
        RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.gray)
                .frame(width: 50, height: 50)

            }
        }

#Preview {
    NewProjectScreen()
}
