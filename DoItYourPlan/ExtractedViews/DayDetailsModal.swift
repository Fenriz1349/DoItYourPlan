//
//  DayDetailsModal.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 13/03/2024.
//

import SwiftUI

struct DayDetailsModal: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var  day : Date

    var ListProjectOfSelectedDay : [PlanningProjectProgress] {
        projectsProgressList.filter{$0.dateEnd == day}
    }
    var body: some View {
        //        affichage si la date correspond à une date de fin de projet
        VStack{
            if !ListProjectOfSelectedDay.isEmpty{
                Text("Le \(formattedDatePlanning(day)) vous avez :")
                ForEach(ListProjectOfSelectedDay) {projet in
                    HStack{
                        ExtPiePercentCompleted(percent: projet.progressPercent)
                        VStack(alignment: .leading){
                            Text("le projet \(projet.name) de \(projet.category.rawValue)")
                                .bold()
                            differenceInDays(from: Date(), to: day) != 0 ? Text("Est à finir dans \(differenceInDays(from: Date(), to: day)) jours") : Text("Est à finir aujourd'hui")
                        }
                    }
                }
                //            affichage si la date ne correspond pas à une fin de projet
            }else {
                Text("pas d'evenement aujourd'hui")
            }
            Button ("fermer"){
                presentationMode.wrappedValue.dismiss()
            }.padding(.top,50)
        }
    }
}

//#Preview {
//    DayDetailsModal(day: Date())
//}
