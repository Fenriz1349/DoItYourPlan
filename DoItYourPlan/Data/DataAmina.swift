//
//  DataAmina.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import Foundation
import SwiftUI


struct myProjectsView {
   let color : String
    let title : String
    let category : String
    let progress : Int
}

var myProjectsList : [myProjectsView] = [
    myProjectsView(color: "purpleColor", title: "Projet 1", category: "Couture", progress: 70),
    myProjectsView(color: "pinkColor", title: "Projet 2 ", category: "Crochet", progress: 70),
    myProjectsView(color: "blueColor", title: "Projet 3", category: "Peinture", progress: 70)
]
