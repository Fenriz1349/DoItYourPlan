//
//  DataJulien.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import Foundation
import SwiftUI

//ennum de la liste des category de DIY, renvoie une string de la category
// le methode .color renvoie la couleur assosié
enum DiyCategory : String,CaseIterable{
    case couture = "Couture"
    case tricot = "Tricot"
    case dessin = "Dessin"
    case maison = "Maison"
    case peinture = "Peinture"
    case bookCraft = "Book Craft"
    case crochet = "Crochet"
    case jardinage = "Jardinage"
    case broderie = "Broderie"
    
    func color() ->String{
        switch self {
        case .tricot : return "purpleCustom"
        case .dessin : return "blueCustom"
        case .maison : return "blueCustom"
        case .peinture : return "orangeCustom"
        case .bookCraft : return "orangeCustom"
        case .crochet : return "pinkCustom"
        case .jardinage : return "greenCustom"
        case .broderie : return "greenCustom"
        default : return "purpleCustom"
        }
    }
}
//fonction qui renvoie un optionnel au format Date
// day : le jour
// month : le mois
// year : l'année
func createDate(_ day : Int,_ month : Int,_ year : Int)->Date?{

    // Définir les composants de date
    var dateComponents = DateComponents()
    dateComponents.year = year
    dateComponents.month = month
    dateComponents.day = day

    // Créer la variable Date en utilisant les composants
    if let date = Calendar.current.date(from: dateComponents) {
        return date
    }else {
        return nil
    }
}

//fonction pour formater une date et renvoyer un String
func formattedDatePlanning(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
}

//fonction pour calculer la difference entre 2 dates
func differenceInDays(from startDate: Date, to endDate: Date) -> Int {
    let components = Calendar.current.dateComponents([.day], from: startDate, to: endDate)
    
    // `components.day` contiendra la différence en jours entre startDate et endDate
    if let daysDifference = components.day {
        return daysDifference
    } else {
        return 0  // En cas d'erreur ou si la différence est nulle
    }
}

//struct pour gérer l'affichage de l'avancement d'un projet
// id : id du projet
// name : nom du projet
// dateEnd : date de fin de projet
// dateStepsend : liste des dates de fin des étapes
// progressePercent : pourcentage de progression du projet pour la simulation
struct PlanningProjectProgress :Identifiable{
    let id = UUID()
    let name : String
    let category : DiyCategory
    let dateEnd : Date?
    let dateStepsEnd : [Date]?
    let progressPercent : Int
    let rotation : Bool
    
}

var projectsProgressList : [PlanningProjectProgress] = [
    PlanningProjectProgress(name: "Projet 1", category :.couture,dateEnd: createDate(22, 3, 2024), dateStepsEnd: nil, progressPercent: 25,rotation: true),
    PlanningProjectProgress(name: "Projet 2", category :.tricot,dateEnd: createDate(18, 6, 2024), dateStepsEnd: nil, progressPercent: 66,rotation: false),
    PlanningProjectProgress(name: "Projet 3", category :.peinture,dateEnd: nil, dateStepsEnd: nil, progressPercent: 75,rotation: true)
]

