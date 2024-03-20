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
            guard let selectedDay = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: day) else {
                return []
            }
            return projectsProgressList.filter { project in
                if let projectDateEnd = project.dateEnd {
                    let projectDay = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: projectDateEnd)
                    return projectDay == selectedDay
                } else {
                    return false // Ignore les projets sans date de fin
                }
            }
        }
    
    var body: some View {
        //        affichage si la date correspond à une date de fin de projet
        VStack{
            differenceInDays(from: Date(), to: day) == 0 ?
            Text("Aujourd'hui")
                .bold()
                .padding():
            Text("le \(formattedDatePlanning(day))")
                .bold()
                .padding()
            if !ListProjectOfSelectedDay.isEmpty{
                ForEach(ListProjectOfSelectedDay) {projet in
                    ExtPlanningProjectProgress(project: projet)
                        }
            }else {
                Text("Tu n'as pas d'evenement")
            }
            Button ("fermer"){
                presentationMode.wrappedValue.dismiss()
            }.padding(.top,50)
        }
    }
}

#Preview {
    DayDetailsModal(day: .constant(Date()))
}
