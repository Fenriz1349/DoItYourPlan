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
    @Binding var showNewProjet : Bool
    
    struct Project {
        var name: String
        var category: NewProjectCategory
        var description: String
        var deadline: Date
    }
    var body: some View {
            NavigationStack {
                VStack{
                        Form {
                            Section(header: Text("Nommes ton projet")) {
                                TextField("Nom du projet", text: $projectName)
                                
                            }
                            Section(header: Text("Choisis la catégorie de ton projet DIY")) {
                                Picker("Catégorie:", selection: $selectedOption) {
                                    ForEach(NewProjectCategory.allCases, id: \.self) { category in
                                        Text(category.rawValue)
                                        
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
                        Text("")
                    Text("")
                    
                    Button(action: {
                                showNewProjet.toggle()
                            }) {
                                Text("Valider")
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(Color.purpleCustom)
                                    .cornerRadius(25.0)
                            
                        }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

                    
                    
                }
                NavigationLink(destination: ProjectsScreen(showNewProjet: showNewProjet),
                               isActive: $showNewProjet) {
                    EmptyView()
                }
                               .navigationBarTitle("Nouveau projet", displayMode: .inline)
            }
        }
    }

#Preview {
    NewProjectScreen(showNewProjet: .constant(false))
}
