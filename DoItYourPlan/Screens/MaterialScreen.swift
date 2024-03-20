//
//  MaterialScreen2.swift
//  DoItYourPlan
//
//  Created by apprenant71 on 19/03/2024.


import SwiftUI

struct MaterialScreen: View {
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
        MaterialItem(name: "2 bobines de fil rouge", price: 0.0),
        MaterialItem(name: "1 bobine dorée", price: 3.5),
        MaterialItem(name: "Patron Burda", price: 6.50),
        MaterialItem(name: "Marqueur Patron", price: 2.99),
        MaterialItem(name: "Paire de ciseaux", price: 0.0),
        MaterialItem(name: "Aiguilles 70/10", price: 6.24),
        MaterialItem(name: "Pinces pour couture", price: 9.49)
    ]
    
    @State var newMaterialName = ""
    @State var newMaterialPrice = ""
    @State var selectedMaterials = Set<UUID>()
    
    var totalMaterialPrice: Double {
        // Calculer le total des prix de tous les matériaux
        return materials.reduce(0) { $0 + $1.price }
    }
    
    var totalRemainingPrice: Double {
        // Filtrer les matériaux non sélectionnés
        let remainingMaterials = materials.filter { !selectedMaterials.contains($0.id) }
        // Calculer le total des prix des matériaux non sélectionnés
        return remainingMaterials.reduce(0) { $0 + $1.price }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Ajoutes tout ce dont tu auras besoin pour ce projet")) {
                        ForEach(materials) { material in
                            MaterialRow(material: material, isSelected: selectedMaterials.contains(material.id))
                                .contextMenu {
                                    Button(action: {
                                        deleteMaterial(withID: material.id)
                                    }) {
                                        Text("Supprimer")
                                        Image(systemName: "trash")
                                    }
                                }
                                .onTapGesture {
                                    if selectedMaterials.contains(material.id) {
                                        selectedMaterials.remove(material.id)
                                    } else {
                                        selectedMaterials.insert(material.id)
                                    }
                                }
                        }
                    }
                    Section {
                        HStack {
                            TextField("Nouveau matériau", text: $newMaterialName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Prix", text: $newMaterialPrice)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad) // Pour afficher un clavier numérique
                            Button(action: addMaterial) {
                                Text("Ajouter")
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(Color.purpleCustom)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    HStack{
                        Section(header: Text("Cout total")) {
                            Text("\(String(format: "%.2f", totalMaterialPrice))€")
                                .font(.headline)
                        }
                        Spacer()
                        Section(header: Text("Reste à acheter")) {
                            Text("\(String(format: "%.2f", totalRemainingPrice))€")
                                .font(.headline)
                        }
                        
                    }
                }
                .navigationBarTitle("Matériel", displayMode: .inline)
            }
        }
    }
    
    func addMaterial() {
        guard !newMaterialName.isEmpty else { return }
        // Convertir le prix saisi en Double
        guard let price = Double(newMaterialPrice) else { return }
        // Ajoutez le nouveau matériau avec le nom et le prix saisis
        materials.append(MaterialItem(name: newMaterialName, price: price))
        newMaterialName = ""
        newMaterialPrice = ""
    }
    
    func deleteMaterial(withID id: UUID) {
        materials.removeAll { $0.id == id }
    }
}

struct MaterialRow: View {
    var material: MaterialScreen.MaterialItem
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Image(systemName: isSelected ? "checkmark.circle" : "circle")
                .font(.system(size: 30))
                .foregroundColor(isSelected ? .green : .gray)
            HStack {
                Text(material.name)
                Spacer()
                Text("Prix:")
                Text(String(format: "%.2f", material.price))
            }
            Spacer()
        }
    }
}

#Preview {
    MaterialScreen()
}
