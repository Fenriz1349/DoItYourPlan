//
//  NewProjectScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct NewProjectScreen: View {
    
    @State private var projectName = ""
    @State private var selectedOption = NewProjectCategory.couture
    @State private var projectDescription = ""
    @State private var selectedDate: Date = Date()
    
    
    struct Project {
        var name: String
        var category: NewProjectCategory
        var description: String
        var deadline: Date
    }
    var body: some View {
        NavigationView {
            NavigationStack {
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
                        .foregroundColor(.black)
                    }
                    Section(header: Text("Détails")) {
                        TextField("Description du projet", text: $projectDescription)
                    }
                    Section(header: Text("Pour quand souhaites-tu finir ce projet?")) {
                        DatePicker("Date de fin prévue:", selection: $selectedDate, displayedComponents: [.date])
                    }
                }
                NavigationLink(destination:ProjectsScreen()){
                    Text("Valider")
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.purpleCustom)
                        .cornerRadius(10)
                }
                .navigationBarTitle("Nouveau projet", displayMode: .inline)
                .navigationBarItems(leading:
                                        NavigationLink(destination: ProjectsScreen()) {
                    Text("retour")
                })
            }
        }
    }
}
    #Preview {
        NewProjectScreen()
    }
