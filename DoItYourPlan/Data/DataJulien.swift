//
//  DataJulien.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import Foundation
import SwiftUI
//enum des differents couleurs
enum CustomColor : String,CaseIterable{
    case purpleC = "purpleCustom"
    case pinkC = "pinkCustom"
    case blueC = "blueCustom"
    case blackC = "blackCustom"
    case fontBlackC = "fontBlackCustom"
    case greenC = "greenCustom"
    case orangeC = "orangeCustom"
    case yellowC = "yellowCustom"
}

enum CustomColorPostIT : String,CaseIterable{
    case purpleC = "purpleCustom"
    case pinkC = "pinkCustom"
    case blueC = "blueCustom"
    case greenC = "greenCustom"
    case orangeC = "orangeCustom"
    case yellowC = "yellowCustom"
    
    func color() ->String{
        switch self {
        case .purpleC : return "violet"
        case .pinkC : return "rose"
        case .blueC : return "bleu"
        case .greenC : return "vert"
        case .orangeC : return "orange"
        case .yellowC : return "jaune"
        }
    }
}
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
    
}
//liste de 3 projets pour afficher les projets en cours
var projectsProgressList : [PlanningProjectProgress] = [
    PlanningProjectProgress(name: "Robe vintage à motifs floraux", category :.couture,dateEnd: createDate(22, 3, 2024), dateStepsEnd: nil, progressPercent: 90),
    PlanningProjectProgress(name: "Plaid bohème multicolore", category :.crochet,dateEnd: createDate(18, 6, 2024), dateStepsEnd: nil, progressPercent: 70),
    PlanningProjectProgress(name: "Paysage marin au coucher du soleil", category :.peinture,dateEnd: nil, dateStepsEnd: nil, progressPercent: 25)
]

//class pour gérer un element sur l'inspirationBoard
// id : identifiant unique
// name : nom de l'inspiration
// x : position de l'element sur l'abscise
// y : position de l'element sur l'ordonné
// rotation : angle de rotation de l'element
class Inspiration : Identifiable,ObservableObject {
    var id = UUID()
    @Published var name : String
    @Published var x : CGFloat
    @Published var y : CGFloat
    @Published var rotation : Double
    @Published var isShowed : Bool
    
    init(name: String, x: CGFloat = 0, y: CGFloat = 0, rotation: Double = 0,isShowed : Bool = true) {
        self.name = name
        self.x = x
        self.y = y
        self.rotation = rotation
        self.isShowed = isShowed
    }
}

//clsse herité de Inspiration pour les Post It
// color : la couleur de fond du post It
// content : le contenu du Post It
class PostIt : Inspiration {
    @Published var color : CustomColorPostIT
    @Published var contents : [String]
    
    init(name: String, x: CGFloat = 0, y: CGFloat = 0, rotation: Double = 0,isShowed : Bool = true,color: CustomColorPostIT, contents: [String]) {
            self.color = color
            self.contents = contents
            super.init(name: name, x: x, y: y, rotation: rotation)
        }
}

class PostItList: ObservableObject {
    @Published var postIts: [PostIt] = [
        PostIt(name: "Thème", x: 350, y: 100, rotation: -5, color: .yellowC, contents: ["printemps", "marguerite","soleil"]),
        PostIt(name: "Matériaux", x: 350, y: 300, rotation: 10, color: .blueC, contents: ["tissu vintage", "coton","forme cloche"])
    ]
    
    func addPostIt(_ postIt: PostIt) {
        postIts.append(postIt)
    }
}
//clsse herité de Inspiration pour les Post It
// color : la couleur de fond du post It
// content : le contenu du Post It
class ImageInspiration : Inspiration {
    @Published var link : String
    @Published var width : CGFloat
    @Published var heigth : CGFloat
    
    init(name: String, x: CGFloat = 0, y: CGFloat = 0, rotation: Double = 0,isShowed : Bool = true, link: String, width : CGFloat = 150, height : CGFloat = 150) {
            self.link = link
            self.width = width
            self.heigth = height
            super.init(name: name, x: x, y: y, rotation: rotation)
        }
}

struct TutoLink : Identifiable {
    var id = UUID()
    var name : String
    var url : String
    var icone : String
}

struct PressableButtonStylesCustom: ButtonStyle {
    let color: Color // Ajout d'un paramètre de couleur
    
    func makeBody(configuration: Self.Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(color) // Utilisation de la couleur fournie
                .blur(radius: configuration.isPressed ? 0 : 1)
                .offset(x: 0, y: configuration.isPressed ? 5 : 10)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(configuration.isPressed ? Color.gray : color) // Utilisation de la couleur fournie
                .offset(x: 0, y: configuration.isPressed ? 5 : 0)
            
            configuration.label
                .foregroundColor(.white)
        }
        .animation(.spring(), value: configuration.isPressed)
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
        .frame(width: 170, height: 50)
    }
}

struct PressableButtonStylesIcone: ButtonStyle {
    let width : Double
    let color: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(color)
                .blur(radius: configuration.isPressed ? 0 : 1)
                .offset(x: 0, y: configuration.isPressed ? 5 : 10)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(configuration.isPressed ? Color.gray : color)
                .offset(x: 0, y: configuration.isPressed ? 5 : 0)
            
            configuration.label
                .foregroundColor(.white)
        }
        .animation(.spring(), value: configuration.isPressed)
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
        .frame(width: width, height: width)
    }
}
