//
//  NewProjectScreen2 .swift
//  DoItYourPlan
//
//  Created by apprenant71 on 20/03/2024.
//

import SwiftUI

struct NewProjectScreen2_: View {
    @State private var projectName = ""
    @State private var selectedOption = NewProjectCategory.couture
    @State private var projectDescription = ""
    @State private var selectedDate: Date = Date()
    @Binding var showNewProjet : Bool
    
    var body: some View {
        NavigationView {
            NavigationStack {
                VStack{
                    VStack {
                        VStack{
                            Text("Nommes ton Projet")
                            ZStack{
                                RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .fill(.purpleCustom)
                                    .frame(width: 380, height: 100)
                                    .padding(.bottom, 15)
                                TextField("Nom du projet", text: $projectName)
                                    .padding()
                            }
                        }
                        VStack{
                            Text("Choisis la catégorie de ton projet DIY")
                            ZStack{
                                RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .fill(.purpleCustom)
                                    .frame(width: 380, height: 100)
                                    .padding(.bottom, 15)
                                Picker("Catégorie:", selection: $selectedOption) {
                                    ForEach(NewProjectCategory.allCases, id: \.self) { category in
                                        Text(category.rawValue)
                                        
                                    }
                                } 
                            }
                        }
                        VStack{
                            Text("Décris ton projet")
                            ZStack{
                                RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .fill(.purpleCustom)
                                    .frame(width: 380, height: 100)
                                    .padding(.bottom, 15)
                                TextField("Description du projet", text: $projectDescription)
                            }
                        }
                        VStack{
                            Text("Choisis une date de fin")
                            ZStack{
                                RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .fill(.purpleCustom)
                                    .frame(width: 380, height: 100)
                                    .padding(.bottom, 15)
                                
                                DatePicker("Date de fin prévue:", selection: $selectedDate, displayedComponents: [.date])
                            }
                        }
                       
                    }
                    Button(action: {
                        showNewProjet.toggle()
                    }) {
                        Text("Valider")
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.purpleCustom)
                            .cornerRadius(25.0)
                    }
                }
                .padding() // Ajoute du padding à l'ensemble de la VStack
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
    NewProjectScreen2_(showNewProjet: .constant(false))
}
