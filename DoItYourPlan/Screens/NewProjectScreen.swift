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
    @State var selectedDate: Date = Date()
    @Binding var showNewProjet : Bool
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Nom du projet")) {
                        TextField("Nom du projet", text: $projectName)
                    }
                    Section(header: Text("Choisis la catégorie de ton projet DIY")) {
                        Picker("Catégorie:", selection: $selectedOption) {
                            ForEach(NewProjectCategory.allCases, id: \.self) { category in
                                Text(category.rawValue)
                                // Style du menu déroulant: ajouter couleur selon le choix de catégorie
                            }
                        }
                    }
                    Section(header: Text("Détails")) {
                        TextField("Description du projet", text: $projectDescription)
                    }
                    Section(header: Text("Pour quand souhaites-tu finir ce projet?")) {
                        DatePicker("Date de fin prévue:", selection: $selectedDate, displayedComponents: [.date])
                    }
                }
                NavigationLink(destination: ProjectsScreen(showNewProjet: showNewProjet)
                    .navigationBarHidden(true), isActive: $showNewProjet) {
                    EmptyView()
                }

                Button(action: {
                    showNewProjet.toggle()
                }) {
                    Text("Valider")
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.purpleCustom)
                        .cornerRadius(10)
                }
                
                .navigationBarTitle("Nouveau projet", displayMode: .inline)
                .navigationBarItems(leading:
                                        NavigationLink(destination: ProjectsScreen(showNewProjet: showNewProjet)) {
                    Text("retour")
                }
                )
            }
        }
        // Bouton "Valider" pour enregistrer le projet
        
//        func SaveProject() {
//            // Action pour enregistrer le projet et naviguer
//            let newProject = Project(name: projectName, category: selectedOption, description: projectDescription, deadline: selectedDate)
//            // stocke le nouveau projet
//
//            // Une fois que le projet est enregistré, naviguer vers l'écran ProjectScreen
//            NavigationLink(destination: ProjectsScreen()) {
//                EmptyView()
//            }
//        }
    }
    
    
}
    
    #Preview {
        NewProjectScreen(showNewProjet: .constant(false))
    }
