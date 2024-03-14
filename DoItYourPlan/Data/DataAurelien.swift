//
//  DataAurelien.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

class Project: Identifiable, ObservableObject {
    @Published var id = UUID()
    @Published var projectName: String
    @Published var steps: [Step]

    init(projectName: String, steps: [Step]) {
        self.projectName = projectName
        self.steps = steps
    }

    func addStep(stepName: String, orderNumber: Int, isDone: Bool) {
        let newStep = Step(stepName: stepName, orderNumber: orderNumber, isDone: isDone)
        steps.append(newStep)
    }

    func removeStep(at index: Int) {
        steps.remove(at: index)
    }
}

class Step: Identifiable, ObservableObject {
    @Published var id = UUID()
    @Published var stepName: String
    @Published var orderNumber: Int
    @Published var isDone: Bool

    init(stepName: String, orderNumber: Int, isDone: Bool) {
        self.stepName = stepName
        self.orderNumber = orderNumber
        self.isDone = isDone
    }
}

let steps: [Step] = [
    Step(stepName: "Choix du patron", orderNumber: 1, isDone: false),
    Step(stepName: "Sélection tissu", orderNumber: 2, isDone: false),
    Step(stepName: "Mesures", orderNumber: 3, isDone: false),
    Step(stepName: "Découpe", orderNumber: 4, isDone: false),
    Step(stepName: "Assemblage", orderNumber: 5, isDone: false),
    Step(stepName: "Ourlets", orderNumber: 6, isDone: false),
    Step(stepName: "Ajustements", orderNumber: 7, isDone: false),
    Step(stepName: "Repassage", orderNumber: 8, isDone: false),
    Step(stepName: "Finitions", orderNumber: 9, isDone: false)
]

let myProject = Project(projectName: "Projet de Couture", steps: steps)


