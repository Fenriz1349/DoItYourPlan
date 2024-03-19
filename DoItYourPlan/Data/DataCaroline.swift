//
//  DataCaroline.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import Foundation
import SwiftUI

var projectName = ""
var selectedOption = NewProjectCategory.couture
var projectDescription = ""
var selectedDate: Date = Date()


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
    
    //    ajout des couleurs
    func Color() -> String{
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

struct NewProject {
    // Propriétés de votre projet
    var name: String
    var category: NewProjectCategory
    var description: String
    var deadline: Date
    
}

