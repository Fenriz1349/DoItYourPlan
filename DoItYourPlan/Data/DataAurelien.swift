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
    
    func addStep(stepName: String, orderNumber: Int, isDone: Bool, isCurrent: Bool, stepColor: Color, stepPosition: Double, tasks: [Task] = []) {
        let newStep = Step(stepName: stepName, orderNumber: orderNumber, isDone: isDone, isCurrent: isCurrent, stepColor: stepColor, stepPosition: stepPosition, tasks: tasks)
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
    
    func addTask(toStep stepID: UUID, taskName: String, isDone: Bool = false) {
        if let index = steps.firstIndex(where: { $0.id == stepID }) {
            let newTask = Task(taskName: taskName, orderNumber: steps[index].tasks.count + 1, isDone: isDone)
            steps[index].tasks.append(newTask)
        }
    }
}

class Step: Identifiable, ObservableObject {
    @Published var id = UUID()
    @Published var stepName: String
    @Published var orderNumber: Int
    @Published var isDone: Bool
    @Published var isCurrent: Bool
    @Published var stepColor: Color
    @Published var stepPosition: Double
    @Published var tasks: [Task] = []
    
    
    init(id: UUID = UUID(), stepName: String, orderNumber: Int, isDone: Bool, isCurrent: Bool, stepColor: Color, stepPosition: Double, tasks: [Task]) {
        self.id = id
        self.stepName = stepName
        self.orderNumber = orderNumber
        self.isDone = isDone
        self.isCurrent = isCurrent
        self.stepColor = stepColor
        self.stepPosition = stepPosition
        self.tasks = tasks
    }
    
    func removeTask(at index: Int) {
        tasks.remove(at: index)
    }
    
    func toggleTaskStatus(taskID: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == taskID }) {
            tasks[index].toggleStatus()
        }
    }
    
    func updateTaskOrder() {
        for (index, _) in tasks.enumerated() {
            tasks[index].orderNumber = index + 1
        }
    }
}

class Task: Identifiable, ObservableObject {
    @Published var id = UUID()
    @Published var taskName: String
    @Published var orderNumber: Int
    @Published var isDone: Bool = false
    
    init(id: UUID = UUID(), taskName: String, orderNumber: Int, isDone: Bool) {
        self.id = id
        self.taskName = taskName
        self.orderNumber = orderNumber
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
    Step(stepName: "Préparation des matériaux", orderNumber: 1, isDone: true, isCurrent: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Choisir le tissu pour la trousse", orderNumber: 1, isDone: true),
        Task(taskName: "Laver et repasser le tissu", orderNumber: 2, isDone: true),
        Task(taskName: "Préparer les fournitures nécessaires", orderNumber: 3, isDone: true)
    ]),
    Step(stepName: "Découpe des pièces", orderNumber: 2, isDone: true, isCurrent: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Prendre les mesures nécessaires pour découper les pièces de tissu", orderNumber: 1, isDone: true),
        Task(taskName: "Découper le tissu selon les dimensions requises pour la trousse", orderNumber: 2, isDone: true),
        Task(taskName: "Découper la fermeture éclair à la bonne taille si nécessaire", orderNumber: 3, isDone: true)
    ]),
    Step(stepName: "Assemblage du corps de la trousse", orderNumber: 3, isDone: true, isCurrent: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Épingler les côtés du tissu ensemble, endroit contre endroit", orderNumber: 1, isDone: true),
        Task(taskName: "Coudre les côtés et le fond de la trousse", orderNumber: 2, isDone: true),
        Task(taskName: "Faire des entailles aux coins pour faciliter le retournement", orderNumber: 3, isDone: true)
    ]),
    Step(stepName: "Fixation de la fermeture éclair", orderNumber: 4, isDone: false, isCurrent: true, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Positionner la fermeture éclair sur le bord de l'ouverture de la trousse", orderNumber: 1, isDone: true),
        Task(taskName: "Épingler la fermeture éclair en place", orderNumber: 2, isDone: false),
        Task(taskName: "Coudre la fermeture éclair sur les bords de la trousse", orderNumber: 3, isDone: false)
    ]),
    Step(stepName: "Création de la doublure", orderNumber: 5, isDone: false, isCurrent: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Découper les pièces de doublure selon les mêmes dimensions que le tissu extérieur", orderNumber: 1, isDone: false),
        Task(taskName: "Assembler les côtés de la doublure, endroit contre endroit", orderNumber: 2, isDone: false),
        Task(taskName: "Laisser une ouverture sur un des côtés pour retourner la trousse", orderNumber: 3, isDone: false)
    ]),
    Step(stepName: "Assemblage final", orderNumber: 6, isDone: false, isCurrent: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Insérer la doublure dans la trousse en la positionnant correctement", orderNumber: 1, isDone: false),
        Task(taskName: "Épingler les bords de la doublure et de la trousse ensemble", orderNumber: 2, isDone: false),
        Task(taskName: "Coudre les bords ensemble, en prenant soin de refermer l'ouverture laissée précédemment", orderNumber: 3, isDone: false)
    ]),
    Step(stepName: "Finitions", orderNumber: 7, isDone: false, isCurrent: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Couper les fils en trop", orderNumber: 1, isDone: false),
        Task(taskName: "Repasser la trousse pour aplatir les coutures", orderNumber: 2, isDone: false),
        Task(taskName: "Vérifier qu'il n'y a pas de défauts et effectuer des retouches si nécessaire", orderNumber: 3, isDone: false)
    ]),
    Step(stepName: "Ajout de décoration (facultatif)", orderNumber: 8, isDone: false, isCurrent: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Choisir des éléments de décoration tels que des rubans, des boutons, ou des broderies", orderNumber: 1, isDone: false),
        Task(taskName: "Positionner les décorations sur la trousse selon votre goût", orderNumber: 2, isDone: false),
        Task(taskName: "Coudre les décorations en place", orderNumber: 3, isDone: false)
    ]),
    Step(stepName: "Test et ajustements", orderNumber: 9, isDone: false, isCurrent: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Tester la trousse en y plaçant vos produits de maquillage", orderNumber: 1, isDone: false),
        Task(taskName: "Vérifier que la fermeture éclair fonctionne correctement", orderNumber: 2, isDone: false),
        Task(taskName: "Effectuer des ajustements si nécessaire, comme revoir les dimensions ou renforcer les coutures", orderNumber: 3, isDone: false)
    ]),
    Step(stepName: "Finition finale", orderNumber: 10, isDone: false, isCurrent: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Repasser une dernière fois la trousse pour assurer une finition impeccable", orderNumber: 1, isDone: false),
        Task(taskName: "Ajouter une étiquette avec votre nom ou logo si désiré", orderNumber: 2, isDone: false),
        Task(taskName: "Admirer et utiliser votre nouvelle trousse de maquillage faite main avec fierté!", orderNumber: 3, isDone: false)
    ])
])

var myProject2 = Project(projectName: "Projet Lampe en Bois", steps: [
    Step(stepName: "Préparation du matériel", orderNumber: 1, isDone: true, isCurrent: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Choisir le type de bois", orderNumber: 1, isDone: true),
        Task(taskName: "Acheter ou rassembler le matériel électrique nécessaire (douille, fil, interrupteur)", orderNumber: 2, isDone: true),
        Task(taskName: "Préparer les outils de travail (scie, perceuse, papier de verre)", orderNumber: 3, isDone: true),
        Task(taskName: "Esquisser le design de la lampe", orderNumber: 4, isDone: true),
        Task(taskName: "Déterminer les dimensions de la lampe", orderNumber: 5, isDone: true)
    ]),
    Step(stepName: "Découpe et assemblage du bois", orderNumber: 2, isDone: true, isCurrent: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Découper le bois selon les dimensions prévues", orderNumber: 1, isDone: true),
        Task(taskName: "Poncer les pièces de bois pour lisser les surfaces", orderNumber: 2, isDone: true),
        Task(taskName: "Assembler les pièces pour former la structure de la lampe", orderNumber: 3, isDone: true),
        Task(taskName: "Vérifier la stabilité de la structure", orderNumber: 4, isDone: true),
        Task(taskName: "Appliquer un traitement de finition sur le bois (vernis, huile)", orderNumber: 5, isDone: true)
    ]),
    Step(stepName: "Installation électrique", orderNumber: 3, isDone: true, isCurrent: false, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Percez un trou pour le passage du fil électrique", orderNumber: 1, isDone: true),
        Task(taskName: "Installer la douille", orderNumber: 2, isDone: true),
        Task(taskName: "Passer le fil à travers la structure et la douille", orderNumber: 3, isDone: true),
        Task(taskName: "Fixer l'interrupteur au fil", orderNumber: 4, isDone: true),
        Task(taskName: "Tester la connexion électrique", orderNumber: 5, isDone: true)
    ]),
    Step(stepName: "Finitions et décoration", orderNumber: 4, isDone: false, isCurrent: true, stepColor: randomColor(), stepPosition: randomStepPosition(), tasks: [
        Task(taskName: "Choisir un abat-jour adapté au design de la lampe", orderNumber: 1, isDone: false),
        Task(taskName: "Installer l'abat-jour", orderNumber: 2, isDone: false),
        Task(taskName: "Appliquer des éléments décoratifs si désiré", orderNumber: 3, isDone: false),
        Task(taskName: "Effectuer les retouches finales sur le bois si nécessaire", orderNumber: 4, isDone: false)
    ])
])
