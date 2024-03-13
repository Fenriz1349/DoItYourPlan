//
//  DataJulien.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import Foundation
import SwiftUI

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
func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: date)
}
var ListDateEndProjects : [Date?] = [
    createDate(22, 3, 2024),
    createDate(18, 6, 2024),
    createDate(26, 8, 2024),
]
