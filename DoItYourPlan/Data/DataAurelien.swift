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
    
    func addStep(stepName: String, orderNumber: Int, isDone: Bool, stepColor: Color) {
        let newStep = Step(stepName: stepName, orderNumber: orderNumber, isDone: isDone, stepColor: stepColor)
        steps.append(newStep)
    }
    
    func removeStep(at index: Int) {
        steps.remove(at: index)
    }
    
    func updateOrder() {
        for (index, _) in steps.enumerated() {
            steps[index].orderNumber = index + 1
        }
    }
}

class Step: Identifiable, ObservableObject {
    @Published var id = UUID()
    @Published var stepName: String
    @Published var orderNumber: Int
    @Published var isDone: Bool
    @Published var stepColor: Color
    
    init(id: UUID = UUID(), stepName: String, orderNumber: Int, isDone: Bool, stepColor: Color) {
        self.id = id
        self.stepName = stepName
        self.orderNumber = orderNumber
        self.isDone = isDone
        self.stepColor = stepColor
    }
}

func randomColor() -> Color {
    let red = Double.random(in: 0...1)
    let green = Double.random(in: 0...1)
    let blue = Double.random(in: 0...1)
    return Color(red: red, green: green, blue: blue)
}

var myProject = Project(projectName: "Projet Couture", steps: [
    Step(stepName: "Choix du patron", orderNumber: 1, isDone: false, stepColor: .yellow),
    Step(stepName: "Sélection tissu", orderNumber: 2, isDone: false, stepColor: .blue),
    Step(stepName: "Mesures", orderNumber: 3, isDone: false, stepColor: .purple),
    Step(stepName: "Découpe", orderNumber: 4, isDone: false, stepColor: .orange),
    Step(stepName: "Assemblage", orderNumber: 5, isDone: false, stepColor: .indigo),
    Step(stepName: "Ourlets", orderNumber: 6, isDone: false, stepColor: .cyan),
    Step(stepName: "Ajustements", orderNumber: 7, isDone: false, stepColor: .brown),
    Step(stepName: "Repassage", orderNumber: 8, isDone: false, stepColor: .mint),
    Step(stepName: "Finitions", orderNumber: 9, isDone: false, stepColor: .red)])

