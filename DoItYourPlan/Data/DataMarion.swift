//
//  DataMarion.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//


import SwiftUI

struct ColorFace: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
    var iconCadenas: Bool
    var points: Points?
}

struct Face: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let iconPoints: String
    let iconCadenas: String
    let nbrPoints: Int
}

struct Hair: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let iconPoints: String
    let iconCadenas: String
    let nbrPoints: Int
}

  


struct Hat: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    var iconCadenas: Bool 
    var points: Points?
}
struct Points {
    var iconPoints: String
    var nbrPoints: Int
}


struct Clothes: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let iconPoints: String
    let iconCadenas: String
    let nbrPoints: Int
}

struct Accessory: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let iconPoints: String
    let iconCadenas: String
    let nbrPoints: Int
}

struct Background: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let iconPoints: String
    let iconCadenas: String
    let nbrPoints: Int
}


var colorFaces: [ColorFace] = [
            ColorFace(name: "Color Face 1", color: Color("Colorface1"), iconCadenas: true, points: Points(iconPoints: "icon_points1", nbrPoints: 100)),
            ColorFace(name: "Color Face 2", color: Color("Colorface2"), iconCadenas: true, points: Points(iconPoints: "icon_points2", nbrPoints: 120)),
            
        ]
  
let faces: [Face] = [
    Face(name: "Face 1", image: "face1", iconPoints: "icon_points1", iconCadenas: "icon_cadenas1", nbrPoints: 80),
    Face(name: "Face 2", image: "face2", iconPoints: "icon_points2", iconCadenas: "icon_cadenas2", nbrPoints: 90),
    // Ajoutez d'autres visages ici...
]

let hairs: [Hair] = [
    Hair(name: "Hair 1", image: "hair1", iconPoints: "icon_points1", iconCadenas: "icon_cadenas1", nbrPoints: 60),
    Hair(name: "Hair 2", image: "hair2", iconPoints: "icon_points2", iconCadenas: "icon_cadenas2", nbrPoints: 70),
    // Ajoutez d'autres cheveux ici...
]
var hats: [Hat] = [
    Hat(name: "Hat 1", image: "hat1", iconCadenas: true, points: Points(iconPoints: "icon_points1", nbrPoints: 40)),
    Hat(name: "Hat 2", image: "hat2", iconCadenas: true, points: Points(iconPoints: "icon_points2", nbrPoints: 30)),
    Hat(name: "Hat 3", image: "hat3", iconCadenas: false, points: nil),
    Hat(name: "Hat 4", image: "hat4", iconCadenas: true, points: Points(iconPoints: "icon_points2", nbrPoints: 60)),
    Hat(name: "Hat 5", image: "hat5", iconCadenas: false, points: nil),
    Hat(name: "Hat 6", image: "hat6", iconCadenas: true, points: Points(iconPoints: "icon_points2", nbrPoints: 20)),
    Hat(name: "Hat 7", image: "hat7", iconCadenas: true, points: Points(iconPoints: "icon_points2", nbrPoints: 70)),
    Hat(name: "Hat 8", image: "hat8", iconCadenas: true, points: Points(iconPoints: "icon_points2", nbrPoints: 80)),
    Hat(name: "Hat 9", image: "hat9", iconCadenas: false, points: nil),
    Hat(name: "Hat 10", image: "hat10", iconCadenas: true, points: Points(iconPoints: "icon_points2", nbrPoints: 40)),
    Hat(name: "Hat 11", image: "hat11", iconCadenas: false, points: nil),
    Hat(name: "Hat 12", image: "hat12", iconCadenas: true, points: Points(iconPoints: "icon_points2", nbrPoints: 30)),
    Hat(name: "Hat 13", image: "hat13", iconCadenas: false, points: nil),
    Hat(name: "Hat 14", image: "hat14", iconCadenas: true, points: Points(iconPoints: "icon_points2", nbrPoints: 70)),
    Hat(name: "Hat 15", image: "hat15", iconCadenas: true, points: Points(iconPoints: "icon_points2", nbrPoints: 50)),
    Hat(name: "Hat 16", image: "hat16", iconCadenas: false, points: nil)
]


let clothes: [Clothes] = [
    Clothes(name: "Clothes 1", image: "clothes1", iconPoints: "icon_points1", iconCadenas: "icon_cadenas1", nbrPoints: 30),
    Clothes(name: "Clothes 2", image: "clothes2", iconPoints: "icon_points2", iconCadenas: "icon_cadenas2", nbrPoints: 35),
    // Ajoutez d'autres vêtements ici...
]

let accessories: [Accessory] = [
    Accessory(name: "Accessory 1", image: "accessory1", iconPoints: "icon_points1", iconCadenas: "icon_cadenas1", nbrPoints: 20),
    Accessory(name: "Accessory 2", image: "accessory2", iconPoints: "icon_points2", iconCadenas: "icon_cadenas2", nbrPoints: 25),
    // Ajoutez d'autres accessoires ici...
]

let backgrounds: [Background] = [
    Background(name: "Background 1", image: "background1", iconPoints: "icon_points1", iconCadenas: "icon_cadenas1", nbrPoints: 10),
    Background(name: "Background 2", image: "background2", iconPoints: "icon_points2", iconCadenas: "icon_cadenas2", nbrPoints: 15),
    // Ajoutez d'autres arrière-plans ici...
]
