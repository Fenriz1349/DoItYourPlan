//
//  DataCaroline.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import Foundation
import SwiftUI

enum NewProjectCategory: String, CaseIterable{
    case couture = "Couture"
    case dessin = "Dessin"
    case peinture = "Peinture"
    case broderie = "Broderie"
    case crochet = "Crochet"
    case tricot = "Tricot"
    case jardinage = "Jardinage"
    case maison = "Maison"
    case bookCraft = "Book Craft"
    
//    ajouter les couleurs de chaque catégorie comme sur le figma une foois les assets récupérés
    func color() -> String{
        switch self {
        case .couture: 
            return "purpleCustom"
        case .dessin:
            return "blueCustom"
        case .peinture:
            return "orangeCustom"
        case .broderie:
            return "greenCustom"
        case .crochet:
            return "redCustom"
        case .tricot:
            return "purpleCustom"
        case .jardinage:
            return "greenCustom"
        case .maison:
            return "blueCustom"
        case .bookCraft:
            return "orangeCustom"
        }
    }
    
}
//formulaire pour nom du projet et description, en deux cases ici ou sur la view?
