//
//  MaterialScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct MaterialScreen: View {
    
    let stepColor: Color
    // Structure pour stocker le nom de l'objet et son prix
    struct MaterialItem: Identifiable {
        var id = UUID()
        var name: String
        var price: Double
    }
    
    // Tableau de matériaux avec les objets et leurs prix
    @State var materials: [MaterialItem] = [
        MaterialItem(name: "1m de jacquard Rouge", price: 10.5),
        MaterialItem(name: "50cm de ruban dentelle dorée", price: 5.0),
//        MaterialItem(name: "2 bobines de fil rouge", price: 0.0),
        MaterialItem(name: "1 bobine dorée", price: 3.5),
        MaterialItem(name: "Patron Burda", price: 6.50),
        MaterialItem(name: "Marqueur Patron", price: 2.99),
//        MaterialItem(name: "Paire de ciseaux", price: 0.0),
        MaterialItem(name: "Aiguilles 70/10", price: 6.24),
        MaterialItem(name: "Pinces pour couture", price: 9.49)
    ]
    
    @State var newMaterial = ""
    @State var selectedMaterials = Set<UUID>()
    
    var totalMaterialPrice: Double {
        // Calculer le total des prix des matériaux
        return materials.reduce(0) { $0 + $1.price }
    }
    
    var totalRemainingPrice: Double {
        let remainingMaterials = materials.filter { !selectedMaterials.contains($0.id)}
        return remainingMaterials.reduce(0) { $0 + $1.price}
    }
    
    var body: some View {
//        NavigationView {
            ScrollView { //Modif Vstack
//                Form {
//                    Section(header: Text("Ajoutes tout ce dont tu auras besoin pour ce projet")) {
                        ForEach(materials) { material in
                            MaterialRow(material: material, isSelected: selectedMaterials.contains(material.id), stepColor: stepColor)
                                .onTapGesture {
                                    if selectedMaterials.contains(material.id) {
                                        selectedMaterials.remove(material.id)
                                    } else {
                                        selectedMaterials.insert(material.id)
                                    }
                                }
                        }
                        .padding(.horizontal, 10) //Ajout
                        .padding(.bottom, 5)
//                    }
                    //   pour calculer le total de mon tableau
                    HStack {
                        Section(header: Text("Coût total :")) {
                            Text("\(String(format: "%.2f", totalMaterialPrice))€")
                                .font(.headline)
                        }
                        Spacer()
                        Section(header: Text("Reste :")) {
                            Text("\(String(format: "%.2f", totalRemainingPrice))€")
                                .font(.headline)
                        }
                        
                    }
                    .padding(.horizontal, 10) //Ajout
                    .padding(.top, 10)
                    
//                    Section {
                        HStack {
                            TextField("Nouveau matériau", text: $newMaterial)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Button(action: addMaterial) {
                                Text("Ajouter")
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(Color.purpleCustom)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal, 10) //Ajout
                        .padding(.top, 15)
//                    }
//                }
//                .navigationBarTitle("Matériel", displayMode: .inline)
            }
            .padding(.top, 15)
//        }
    }
    
    func addMaterial() {
        guard !newMaterial.isEmpty else { return }
        // Ajoutez le nouveau matériau avec un prix par défaut
        materials.append(MaterialItem(name: newMaterial, price: 0.0))
        newMaterial = ""
    }
}

struct MaterialRow: View {
    var material: MaterialScreen.MaterialItem
    var isSelected: Bool
    var stepColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: isSelected ? "checkmark.circle" : "circle")
                .font(.system(size: 30))
                .foregroundColor(stepColor)
            HStack {
                Text(material.name)
                Spacer()
                Text("Prix:")
                Text(String(format: "%.2f", material.price) + "€")
            }
            Spacer()
        }
    }
}

//#Preview {
//    MaterialScreen()
//}
