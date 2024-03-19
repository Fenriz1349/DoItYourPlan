////
////  MaterialScreen2.swift
////  DoItYourPlan
////
////  Created by apprenant71 on 19/03/2024.
//
//
//import SwiftUI
//
//struct MaterialScreen2: View {
//    // Structure pour stocker le nom de l'objet et son prix
//    struct MaterialItem: Identifiable {
//        var id = UUID()
//        var name: String
//        var price: Double
//    }
//    
//    // Tableau de matériaux avec les objets et leurs prix
//    @State var materials: [MaterialItem] = [
//        MaterialItem(name: "3 metres de jacquard Rouge", price: 10.0),
//        MaterialItem(name: "2 metres de ruban dentelle dorée", price: 5.0),
//        MaterialItem(name: "3 bobines fil rouge similaire", price: 3.0),
//        MaterialItem(name: "2 bobines dorées", price: 3.50),
//        
////  @State var materials = [ "Patron Burda Style 6550", "Paire de ciseaux", "Craies/marqueur pour patron", "Aiguilles n°90", "Epingles à tissus"]
//    ]
//    
//    @State var newMaterial = ""
//    @State var selectedMaterials = Set<UUID>()
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Form {
//                    Section(header: Text("Ajoutes tout ce dont tu auras besoin pour ce projet")) {
//                        ForEach(materials) { material in
//                            MaterialRow(material: material, isSelected: selectedMaterials.contains(material.id))
//                                .onTapGesture {
//                                    if selectedMaterials.contains(material.id) {
//                                        selectedMaterials.remove(material.id)
//                                    } else {
//                                        selectedMaterials.insert(material.id)
//                                    }
//                                }
//                        }
//                    }
//                    Section {
//                        HStack {
//                            TextField("Nouveau matériau", text: $newMaterial)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                            Button(action: addMaterial) {
//                                Text("Ajouter")
//                                    .padding()
//                                    .foregroundColor(.black)
//                                    .background(Color.purpleCustom)
//                                    .cornerRadius(10)
//                            }
//                        }
//                    }
//                }
//                .navigationBarTitle("Matériel", displayMode: .inline)
//            }
//        }
//    }
//    
//    func addMaterial() {
//        guard !newMaterial.isEmpty else { return }
//        // Ajoutez le nouveau matériau avec un prix par défaut
//        materials.append(MaterialItem(name: newMaterial, price: 0.0))
//        newMaterial = ""
//    }
//}
//
//struct MaterialRow: View {
//    var material: MaterialScreen2.MaterialItem
//    var isSelected: Bool
//    
//    var body: some View {
//        HStack {
//            Image(systemName: isSelected ? "checkmark.circle" : "circle")
//                .font(.system(size: 30))
//                .foregroundColor(isSelected ? .green : .gray)
//            HStack {
//                Text(material.name)
//                Spacer()
//                Text("Prix:")
//                Text(String(format: "%.2f", material.price))
//            }
//            Spacer()
//        }
//    }
//}
//
//#Preview {
//    MaterialScreen2()
//}
