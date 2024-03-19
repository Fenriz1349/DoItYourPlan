//
//  DataMarion.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//
import SwiftUI

class UserSelections: ObservableObject {
    @Published var selectedHat: Hat?
    @Published var selectedColorFace: ColorFace?
    @Published var selectedFace: Face?
    @Published var selectedHair: Hair?
    @Published var selectedAccessory: Accessory?
    @Published var selectedBackground: Background?
    @Published var selectedClothe: Clothe?
}
var userSelections = UserSelections()
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

struct Clothe: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
    var iconCadenas: Bool
    var points: Points?
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
    let color: Color
    var iconCadenas: Bool
    var points: Points?
}
struct Points {
    var iconPoints: String
    var nbrPoints: Int
}

var colorFaces: [ColorFace] = [
    ColorFace(name: "Color Face 1", color: Color("ColorFace1"), iconCadenas: true, points: Points(iconPoints: "icon_points1", nbrPoints: 50)),
    ColorFace(name: "Color Face 2", color: Color("ColorFace2"), iconCadenas: true, points: Points(iconPoints: "icon_points2", nbrPoints: 30)),
    ColorFace(name: "Color Face 3", color: Color("ColorFace3"), iconCadenas: false, points: nil),
    ColorFace(name: "Color Face 4", color: Color("ColorFace4"), iconCadenas: true, points: Points(iconPoints: "icon_points4", nbrPoints: 40)),
    ColorFace(name: "Color Face 5", color: Color("ColorFace5"), iconCadenas: false, points: nil),
    ColorFace(name: "Color Face 6", color: Color("ColorFace6"), iconCadenas: true, points: Points(iconPoints: "icon_points6", nbrPoints: 50)),
    ColorFace(name: "Color Face 7", color: Color("ColorFace7"), iconCadenas: false, points: nil),
    ColorFace(name: "Color Face 8", color: Color("ColorFace8"), iconCadenas: true, points: Points(iconPoints: "icon_points8", nbrPoints: 60)),
    ColorFace(name: "Color Face 9", color: Color("ColorFace9"), iconCadenas: false, points: nil),
    ColorFace(name: "Color Face 10", color: Color("ColorFace10"), iconCadenas: true, points: Points(iconPoints: "icon_points10", nbrPoints: 70)),
    ColorFace(name: "Color Face 11", color: Color("ColorFace11"), iconCadenas: false, points: nil),
    ColorFace(name: "Color Face 12", color: Color("ColorFace12"), iconCadenas: true, points: Points(iconPoints: "icon_points12", nbrPoints: 80)),
    ColorFace(name: "Color Face 13", color: Color("ColorFace13"), iconCadenas: false, points: nil),
    ColorFace(name: "Color Face 14", color: Color("ColorFace14"), iconCadenas: true, points: Points(iconPoints: "icon_points14", nbrPoints: 90)),
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


var clothes: [Clothe] = [
    Clothe(name: "Clothe 1", color: Color("Clothe1"), iconCadenas: true, points: Points(iconPoints: "icon_points1", nbrPoints: 50)),
    Clothe(name: "Clothe 2", color: Color("Clothe2"), iconCadenas: true, points: Points(iconPoints: "icon_points2", nbrPoints: 50)),
    Clothe(name: "Clothe 3", color: Color("Clothe3"), iconCadenas: false, points: nil),
    Clothe(name: "Clothe 4", color: Color("Clothe4"), iconCadenas: true, points: Points(iconPoints: "icon_points4", nbrPoints: 70)),
    Clothe(name: "Clothe 5", color: Color("Clothe5"), iconCadenas: false, points: nil),
    Clothe(name: "Clothe 6", color: Color("Clothe6"), iconCadenas: true, points: Points(iconPoints: "icon_points6", nbrPoints: 110)),
    Clothe(name: "Clothe 7", color: Color("Clothe7"), iconCadenas: false, points: nil),
    Clothe(name: "Clothe 8", color: Color("Clothe8"), iconCadenas: true, points: Points(iconPoints: "icon_points8", nbrPoints: 150)),
    Clothe(name: "Clothe 9", color: Color("Clothe9"), iconCadenas: false, points: nil),
    Clothe(name: "Clothe 10", color: Color("Clothe10"), iconCadenas: true, points: Points(iconPoints: "icon_points10", nbrPoints: 190)),
    Clothe(name: "Clothe 11", color: Color("Clothe11"), iconCadenas: false, points: nil),
    Clothe(name: "Clothe 12", color: Color("Clothe12"), iconCadenas: true, points: Points(iconPoints: "icon_points12", nbrPoints: 230)),
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

var backgrounds: [Background] = [
    Background(name: "Background 1", color: Color("beigeCustom"), iconCadenas: true, points: Points(iconPoints: "icon_points1", nbrPoints: 50)),
    Background(name: "Background 2", color: Color("yellowCustom"), iconCadenas: true, points: Points(iconPoints: "icon_points1", nbrPoints: 50)),
    Background(name: "Background 3", color: Color("orangeCustom"), iconCadenas: false, points: nil),
    Background(name: "Background 4", color: Color("pinkCustom"), iconCadenas: true, points: Points(iconPoints: "icon_points4", nbrPoints: 70)),
    Background(name: "Background 5", color: Color("purpleCustom"), iconCadenas: false, points: nil),
    Background(name: "Background 6", color: Color("blueCustom"), iconCadenas: true, points: Points(iconPoints: "icon_points6", nbrPoints: 110)),
    Background(name: "Background 7", color: Color("blue2Custom"), iconCadenas: false, points: nil),
    Background(name: "Background 8", color: Color("greenCustom"), iconCadenas: true, points: Points(iconPoints: "icon_points8", nbrPoints: 150)),
    Background(name: "Background 9", color: Color("green2Custom"), iconCadenas: false, points: nil),
    Background(name: "Background 10", color: Color("grayCustom"), iconCadenas: true, points: Points(iconPoints: "icon_points10", nbrPoints: 190)),
   
]
