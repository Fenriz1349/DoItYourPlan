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
    var iconCadenas: Bool
    var points: Points?
}

struct Hair: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    var iconCadenas: Bool
    var points: Points?
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
    var iconCadenas: Bool
    var points: Points?
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
  
var faces: [Face] = [
        Face(name: "Face 1", image: "face1", iconCadenas: true, points: Points(iconPoints: "icon_points1", nbrPoints: 40)),
        Face(name: "Face 2", image: "face2", iconCadenas: false, points: nil),
        Face(name: "Face 3", image: "face3", iconCadenas: false, points: nil),
        Face(name: "Face 4", image: "face4", iconCadenas: true, points: Points(iconPoints: "icon_points4", nbrPoints: 70)),
        Face(name: "Face 5", image: "face5", iconCadenas: false, points: nil),
        Face(name: "Face 6", image: "face6", iconCadenas: true, points: Points(iconPoints: "icon_points6", nbrPoints: 90)),
        Face(name: "Face 7", image: "face7", iconCadenas: false, points: nil),
        Face(name: "Face 8", image: "face8", iconCadenas: true, points: Points(iconPoints: "icon_points8", nbrPoints: 110)),
        Face(name: "Face 9", image: "face9", iconCadenas: false, points: nil),
        Face(name: "Face 10", image: "face10", iconCadenas: true, points: Points(iconPoints: "icon_points10", nbrPoints: 130)),
        Face(name: "Face 11", image: "face11", iconCadenas: false, points: nil),
        Face(name: "Face 12", image: "face12", iconCadenas: true, points: Points(iconPoints: "icon_points12", nbrPoints: 150)),
        Face(name: "Face 13", image: "face13", iconCadenas: false, points: nil),
        Face(name: "Face 14", image: "face14", iconCadenas: true, points: Points(iconPoints: "icon_points14", nbrPoints: 170)),
    ]

var hairs: [Hair] = [
    Hair(name: "Hair 1", image: "hair1", iconCadenas: true, points: Points(iconPoints: "icon_points1", nbrPoints: 40)),
    Hair(name: "Hair 2", image: "hair2", iconCadenas: false, points: nil),
    Hair(name: "Hair 3", image: "hair3", iconCadenas: true, points: Points(iconPoints: "icon_points3", nbrPoints: 60)),
    Hair(name: "Hair 4", image: "hair4", iconCadenas: false, points: nil),
    Hair(name: "Hair 5", image: "hair5", iconCadenas: true, points: Points(iconPoints: "icon_points5", nbrPoints: 80)),
    Hair(name: "Hair 6", image: "hair6", iconCadenas: false, points: nil),
    Hair(name: "Hair 7", image: "hair7", iconCadenas: true, points: Points(iconPoints: "icon_points7", nbrPoints: 100)),
    Hair(name: "Hair 8", image: "hair8", iconCadenas: false, points: nil),
    Hair(name: "Hair 9", image: "hair9", iconCadenas: true, points: Points(iconPoints: "icon_points9", nbrPoints: 120)),
    Hair(name: "Hair 10", image: "hair10", iconCadenas: false, points: nil),
    Hair(name: "Hair 11", image: "hair11", iconCadenas: true, points: Points(iconPoints: "icon_points11", nbrPoints: 140)),
    Hair(name: "Hair 12", image: "hair12", iconCadenas: false, points: nil),
    Hair(name: "Hair 13", image: "hair13", iconCadenas: true, points: Points(iconPoints: "icon_points13", nbrPoints: 160)),
    Hair(name: "Hair 14", image: "hair14", iconCadenas: false, points: nil),
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

var accessories: [Accessory] = [
    Accessory(name: "Access 1", image: "access1", iconCadenas: true, points: Points(iconPoints: "icon_points1", nbrPoints: 40)),
    Accessory(name: "Access 2", image: "access2", iconCadenas: false, points: nil),
    Accessory(name: "Access 3", image: "access3", iconCadenas: false, points: nil),
    Accessory(name: "Access 4", image: "access4", iconCadenas: true, points: Points(iconPoints: "icon_points4", nbrPoints: 40)),
    Accessory(name: "Access 5", image: "access5", iconCadenas: false, points: nil),
    Accessory(name: "Access 6", image: "access6", iconCadenas: true, points: Points(iconPoints: "icon_points6", nbrPoints: 50)),
    Accessory(name: "Access 7", image: "access7", iconCadenas: false, points: nil),
    Accessory(name: "Access 8", image: "access8", iconCadenas: true, points: Points(iconPoints: "icon_points8", nbrPoints: 60)),
    Accessory(name: "Access 9", image: "access9", iconCadenas: false, points: nil),
    Accessory(name: "Access 10", image: "access10", iconCadenas: true, points: Points(iconPoints: "icon_points10", nbrPoints: 70)),
    Accessory(name: "Access 11", image: "access11", iconCadenas: false, points: nil),
    Accessory(name: "Access 12", image: "access12", iconCadenas: true, points: Points(iconPoints: "icon_points12", nbrPoints: 80)),
    Accessory(name: "Access 13", image: "access13", iconCadenas: false, points: nil),
    Accessory(name: "Access 14", image: "access14", iconCadenas: true, points: Points(iconPoints: "icon_points14", nbrPoints: 90)),
    Accessory(name: "Access 15", image: "access15", iconCadenas: false, points: nil),
    Accessory(name: "Access 16", image: "access16", iconCadenas: true, points: Points(iconPoints: "icon_points16", nbrPoints: 100)),
    Accessory(name: "Access 17", image: "access17", iconCadenas: false, points: nil),
]

let backgrounds: [Background] = [
    Background(name: "Background 1", image: "background1", iconPoints: "icon_points1", iconCadenas: "icon_cadenas1", nbrPoints: 10),
    Background(name: "Background 2", image: "background2", iconPoints: "icon_points2", iconCadenas: "icon_cadenas2", nbrPoints: 15),
    // Ajoutez d'autres arrière-plans ici...
]
