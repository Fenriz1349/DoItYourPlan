//
//  DataMarion.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import Foundation
import SwiftUI

struct ColorFace: Identifiable {
    let id: Int
    let name: String
    let image: String
    let iconPoints: String
    let iconCadenas: String
    let nbrPoints: Int
}

struct Face: Identifiable {
    let id: Int
    let name: String
    let image: String
    let iconPoints: String
    let iconCadenas: String
    let nbrPoints: Int
}

struct Hair: Identifiable {
    let id: Int
    let name: String
    let image: String
    let iconPoints: String
    let iconCadenas: String
    let nbrPoints: Int
}

struct Hat: Identifiable {
    let id: Int
    let name: String
    let image: String
    let iconPoints: String
    let iconCadenas: String
    let nbrPoints: Int
}

struct Clothes: Identifiable {
    let id: Int
    let name: String
    let image: String
    let iconPoints: String
    let iconCadenas: String
    let nbrPoints: Int
}

struct Accessory: Identifiable {
    let id: Int
    let name: String
    let image: String
    let iconPoints: String
    let iconCadenas: String
    let nbrPoints: Int
}

struct Background: Identifiable {
    let id: Int
    let name: String
    let image: String
    let iconPoints: String
    let iconCadenas: String
    let nbrPoints: Int
}

let colorFaces: [ColorFace] = [
    ColorFace(id: 1, name: "Color Face 1", image: "colorface1", iconPoints: "icon_points1", iconCadenas: "icon_cadenas1", nbrPoints: 100),
    ColorFace(id: 2, name: "Color Face 2", image: "colorface2", iconPoints: "icon_points2", iconCadenas: "icon_cadenas2", nbrPoints: 120),
    // Ajoutez d'autres éléments de color face ici...
]

let faces: [Face] = [
    Face(id: 1, name: "Face 1", image: "face1", iconPoints: "icon_points1", iconCadenas: "icon_cadenas1", nbrPoints: 80),
    Face(id: 2, name: "Face 2", image: "face2", iconPoints: "icon_points2", iconCadenas: "icon_cadenas2", nbrPoints: 90),
    // Ajoutez d'autres visages ici...
]

let hairs: [Hair] = [
    Hair(id: 1, name: "Hair 1", image: "hair1", iconPoints: "icon_points1", iconCadenas: "icon_cadenas1", nbrPoints: 60),
    Hair(id: 2, name: "Hair 2", image: "hair2", iconPoints: "icon_points2", iconCadenas: "icon_cadenas2", nbrPoints: 70),
    // Ajoutez d'autres cheveux ici...
]

let hats: [Hat] = [
    Hat(id: 1, name: "Hat 1", image: "hat1", iconPoints: "icon_points1", iconCadenas: "icon_cadenas1", nbrPoints: 40),
    Hat(id: 2, name: "Hat 2", image: "hat2", iconPoints: "icon_points2", iconCadenas: "icon_cadenas2", nbrPoints: 50),
    // Ajoutez d'autres chapeaux ici...
]

let clothes: [Clothes] = [
    Clothes(id: 1, name: "Clothes 1", image: "clothes1", iconPoints: "icon_points1", iconCadenas: "icon_cadenas1", nbrPoints: 30),
    Clothes(id: 2, name: "Clothes 2", image: "clothes2", iconPoints: "icon_points2", iconCadenas: "icon_cadenas2", nbrPoints: 35),
    // Ajoutez d'autres vêtements ici...
]

let accessories: [Accessory] = [
    Accessory(id: 1, name: "Accessory 1", image: "accessory1", iconPoints: "icon_points1", iconCadenas: "icon_cadenas1", nbrPoints: 20),
    Accessory(id: 2, name: "Accessory 2", image: "accessory2", iconPoints: "icon_points2", iconCadenas: "icon_cadenas2", nbrPoints: 25),
    // Ajoutez d'autres accessoires ici...
]

let backgrounds: [Background] = [
    Background(id: 1, name: "Background 1", image: "background1", iconPoints: "icon_points1", iconCadenas: "icon_cadenas1", nbrPoints: 10),
    Background(id: 2, name: "Background 2", image: "background2", iconPoints: "icon_points2", iconCadenas: "icon_cadenas2", nbrPoints: 15),
    // Ajoutez d'autres arrière-plans ici...
]
