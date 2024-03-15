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
    
    func addStep(stepName: String, orderNumber: Int, isDone: Bool, stepColor: Color, stepPosition: Double, tasks: [Task] = []) {
        let newStep = Step(stepName: stepName, orderNumber: orderNumber, isDone: isDone, stepColor: stepColor, stepPosition: stepPosition, tasks: tasks)
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
    @Published var stepPosition: Double
    @Published var tasks: [Task] = []
    
    init(id: UUID = UUID(), stepName: String, orderNumber: Int, isDone: Bool, stepColor: Color, stepPosition: Double, tasks: [Task]) {
        self.id = id
        self.stepName = stepName
        self.orderNumber = orderNumber
        self.isDone = isDone
        self.stepColor = stepColor
        self.stepPosition = stepPosition
        self.tasks = tasks
    }
    
    func addTask(taskName: String, isDone: Bool = false) {
        tasks.append(Task(taskName: taskName, isDone: isDone))
    }
    
    func removeTask(at index: Int) {
        tasks.remove(at: index)
    }
    
    func toggleTaskStatus(taskID: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == taskID }) {
            tasks[index].toggleStatus()
            print("Task toggled: \(tasks[index])")
                } else {
                    print("Task with ID \(taskID) not found.")
                
        }
    }
}

class Task: Identifiable, ObservableObject {
    @Published var id = UUID()
    @Published var taskName: String
    @Published var isDone: Bool = false
    
    init(id: UUID = UUID(), taskName: String, isDone: Bool) {
        self.id = id
        self.taskName = taskName
        self.isDone = isDone
    }
    
    func toggleStatus() {
        self.isDone.toggle()
    }
}

func randomColor() -> Color {
    let red = Double.random(in: 0...1)
    let green = Double.random(in: 0...1)
    let blue = Double.random(in: 0...1)
    return Color(red: red, green: green, blue: blue)
}

func randomStepPosition() -> Double {
    return Double.random(in: 0.8...1.2)
}

var myProject = Project(projectName: "Projet Couture", steps: [
    Step(stepName: "Préparation des matériaux", orderNumber: 1, isDone: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Choisir le tissu pour la trousse", isDone: false),
        Task(taskName: "Laver et repasser le tissu", isDone: false),
        Task(taskName: "Préparer les fournitures nécessaires", isDone: false)
    ]),
    Step(stepName: "Découpe des pièces", orderNumber: 2, isDone: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Prendre les mesures nécessaires pour découper les pièces de tissu", isDone: false),
        Task(taskName: "Découper le tissu selon les dimensions requises pour la trousse", isDone: false),
        Task(taskName: "Découper la fermeture éclair à la bonne taille si nécessaire", isDone: false)
    ]),
    Step(stepName: "Assemblage du corps de la trousse", orderNumber: 3, isDone: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Épingler les côtés du tissu ensemble, endroit contre endroit", isDone: false),
        Task(taskName: "Coudre les côtés et le fond de la trousse", isDone: false),
        Task(taskName: "Faire des entailles aux coins pour faciliter le retournement", isDone: false)
    ]),
    Step(stepName: "Fixation de la fermeture éclair", orderNumber: 4, isDone: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Positionner la fermeture éclair sur le bord de l'ouverture de la trousse", isDone: false),
        Task(taskName: "Épingler la fermeture éclair en place", isDone: false),
        Task(taskName: "Coudre la fermeture éclair sur les bords de la trousse", isDone: false)
    ]),
    Step(stepName: "Création de la doublure", orderNumber: 5, isDone: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Découper les pièces de doublure selon les mêmes dimensions que le tissu extérieur", isDone: false),
        Task(taskName: "Assembler les côtés de la doublure, endroit contre endroit", isDone: false),
        Task(taskName: "Laisser une ouverture sur un des côtés pour retourner la trousse", isDone: false)
    ]),
    Step(stepName: "Assemblage final", orderNumber: 6, isDone: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Insérer la doublure dans la trousse en la positionnant correctement", isDone: false),
        Task(taskName: "Épingler les bords de la doublure et de la trousse ensemble", isDone: false),
        Task(taskName: "Coudre les bords ensemble, en prenant soin de refermer l'ouverture laissée précédemment", isDone: false)
    ]),
    Step(stepName: "Finitions", orderNumber: 7, isDone: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Couper les fils en trop", isDone: false),
        Task(taskName: "Repasser la trousse pour aplatir les coutures", isDone: false),
        Task(taskName: "Vérifier qu'il n'y a pas de défauts et effectuer des retouches si nécessaire", isDone: false)
    ]),
    Step(stepName: "Ajout de décoration (facultatif)", orderNumber: 8, isDone: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Choisir des éléments de décoration tels que des rubans, des boutons, ou des broderies", isDone: false),
        Task(taskName: "Positionner les décorations sur la trousse selon votre goût", isDone: false),
        Task(taskName: "Coudre les décorations en place", isDone: false)
    ]),
    Step(stepName: "Test et ajustements", orderNumber: 9, isDone: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Tester la trousse en y plaçant vos produits de maquillage", isDone: false),
        Task(taskName: "Vérifier que la fermeture éclair fonctionne correctement", isDone: false),
        Task(taskName: "Effectuer des ajustements si nécessaire, comme revoir les dimensions ou renforcer les coutures", isDone: false)
    ]),
    Step(stepName: "Finition finale", orderNumber: 10, isDone: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Repasser une dernière fois la trousse pour assurer une finition impeccable", isDone: false),
        Task(taskName: "Ajouter une étiquette avec votre nom ou logo si désiré", isDone: false),
        Task(taskName: "Admirer et utiliser votre nouvelle trousse de maquillage faite main avec fierté!", isDone: false)
    ])
])


