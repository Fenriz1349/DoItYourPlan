//
//  DayDetailsModal.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 13/03/2024.
//

import SwiftUI

struct DayDetailsModal: View {
    let day : Date
    let listDaysOfProjectsEnd : [Date] = projectsProgressList.compactMap{$0.dateEnd}
    var body: some View {
        ForEach(listDaysOfProjectsEnd, id: \.self) { day in
            Text("\(day)")
        }
            if listDaysOfProjectsEnd.contains(day) {
                Text("projet à finir aujourd'hui")
            }else {
                Text("pas d'evenement aujourd'hui")
            }
        
    }
}

#Preview {
    DayDetailsModal(day: Date())
}
