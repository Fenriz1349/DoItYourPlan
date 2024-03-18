//
//  MaterialScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct MaterialScreen: View {
    @State var materials = ["3 metres de jacquard Rouge","2 metres de ruban dentelle dorée", "3 bobines fil rouge similaire","2 bobines dorées", "Patron Burda Style 6550", "Paire de ciseaux", "Craies/marqueur pour patron", "Aiguilles n°90", "Epingles à tissus"]
    @State var materialName = ""
    
    
    var body: some View {
        NavigationView{
            VStack{
                Form {
                    Section(header: Text("Ajoutes tout ce dont tu auras besoin pour ce projet")) {
                        ForEach(materials, id: \.self) { material in
                            MaterialRow(material: material)
                        }
                    }
                    Section {
                        Button(action: addMaterial) {
                            Text("Ajouter un nouveau matériau")
                        }
                    }
                    
                }
                .navigationBarTitle("Matériel", displayMode: .inline)
                .navigationBarItems(leading:
                                        NavigationLink(destination: SelectedProjectScreen()) {
                    Text("retour")
                })
            }
        }
    }
    func addMaterial() {
         guard !materialName.isEmpty else { return }
         materials.append(materialName)
         materialName = ""
     }
 }

 struct MaterialRow: View {
     var material: String
     
     var body: some View {
         HStack {
             Text(material)
             Spacer()
         }
     }
 }




#Preview {
    MaterialScreen()
}
